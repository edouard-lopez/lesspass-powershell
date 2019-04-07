$CharacterSubsets = [ordered]@{
    lowercase = "abcdefghijklmnopqrstuvwxyz"
    uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    digits    = "0123456789"
    symbols   = "!`"#$%&'()*+,-./:;<=>?@[`\]^_``{|}~"
}

function PBKDF2_by_medo64 {
    param(
        $HashAlgorithm, 
        [byte[]]$MasterPasswordAsBytes, 
        [byte[]]$SaltAsBytes, 
        [Int]$Iterations,
        [Int]$DerivedKeyLength
    ) 
    process {
        $SourcePBKDF2 = ((Get-Content -Path "$PSScriptRoot/PBKDF2_HMAC.cs") -join "`n")
        Add-Type -TypeDefinition "$SourcePBKDF2" # -ReferencedAssemblies ([System.Security.Cryptography.HMAC].Assembly.Location),'System.IO'
        $Derivation = New-Object Medo.Security.Cryptography.Pbkdf2 @($HashAlgorithm, $MasterPasswordAsBytes, $SaltAsBytes, $Iterations)

        return $Derivation.GetBytes($DerivedKeyLength)
    }
}
function CalcEntropy {
    param(
        $PasswordProfile,
        [String]$MasterPassword
    )
    process {
        $Salt = $PasswordProfile.site + $PasswordProfile.login + [System.Convert]::ToString($PasswordProfile.counter, 16)
        $SaltAsBytes = [System.Text.UTF8Encoding]::UTF8.GetBytes($Salt)
        $HashAlgorithm = [System.Security.Cryptography.HMACSHA256]::new()
        $MasterPasswordAsBytes = [System.Text.UTF8Encoding]::UTF8.GetBytes($MasterPassword)
        $Iterations = 100000
        $DerivedKeyLength = 32

        $EntropyAsBytes = PBKDF2_by_medo64 $HashAlgorithm $MasterPasswordAsBytes $SaltAsBytes $Iterations $DerivedKeyLength

        return ($EntropyAsBytes | ForEach-Object ToString X2).ToLower() -join ''
    }
}

function GetConfiguredRules {
    param(
        $PasswordProfile
    )
    process{
        $Rules = @("lowercase", "uppercase", "digits", "symbols")

        return $Rules | Where-Object { $_ -in $PasswordProfile.Keys -and $PasswordProfile.$_ }
    }
}

function GetSetOfCharacters {
    param(
        [ValidateSet('lowercase','uppercase','digits','symbols')]
            [string[]]$Rules=@()
    )
    process{
        if ($Rules.Count -eq 0) {
            return $CharacterSubsets.Values -join ''
        }

        $SetOfCharacters = ""
        foreach ($rule in $Rules) {
            $SetOfCharacters += $CharacterSubsets.$rule
        }
        return $SetOfCharacters
    }
}

function ConsumeEntropy {
    param(
        [String]$GeneratedPassword, 
        [BigInt]$Quotient, 
        [String]$SetOfCharacters, 
        [Int]$MaxLength
    )
    process{
        if ($GeneratedPassword.Length -ge $MaxLength) {
            return $GeneratedPassword, $Quotient
        }
        $Remainder = 0
        $Quotient = [BigInt]::DivRem( $Quotient, $SetOfCharacters.Length, [ref]$Remainder )
        $GeneratedPassword += $SetOfCharacters[$Remainder]

        return ConsumeEntropy $GeneratedPassword $Quotient $SetOfCharacters $MaxLength

    }
}

function GetOneCharPerRule {
    param(
        [BigInt]$Entropy, 
        [ValidateSet('lowercase','uppercase','digits','symbols')]
            [string[]]$Rules=@()
    )
    process{
        $OneCharPerRules = ""
        foreach ($rule in $Rules) {
            $Value, $Entropy = ConsumeEntropy "" $Entropy $CharacterSubsets.$rule 1
            $OneCharPerRules += $Value
        }
        return $OneCharPerRules, $Entropy

    }
}

function InsertStringPseudoRandomly {
    param(
        [String]$GeneratedPassword, 
        [BigInt]$Entropy, 
        [String]$String
    )
    process{
        foreach ($letter in $String.ToCharArray()) {
            [Int]$Remainder = 0
            $Quotient = [BigInt]::DivRem( $Entropy, $GeneratedPassword.Length, [ref]$Remainder )
            $Before = $GeneratedPassword.Substring(0, $Remainder)
            $After = $GeneratedPassword.Substring($Remainder)

            $GeneratedPassword = $Before,$letter,$After -join ''
            $Entropy = $Quotient
        }
        return $GeneratedPassword
    }
}

function RenderPassword {
    param(
        [String]$Entropy, 
        $PasswordProfile
    )
    process{
        $GeneratedPassword = ""
        $EntropyAsInt = [BigInt]::Parse('0'+$Entropy, 'AllowHexSpecifier')
        $Rules = GetConfiguredRules $PasswordProfile
        $SetOfCharacters = GetSetOfCharacters $Rules
        $MaxLength = $PasswordProfile.Length - $Rules.count

        $Password, $PasswordEntropy = ConsumeEntropy $GeneratedPassword $EntropyAsInt $SetOfCharacters $MaxLength

        $CharactersToAdd, $CharacterEntropy = GetOneCharPerRule $PasswordEntropy $Rules

        return InsertStringPseudoRandomly $Password $CharacterEntropy $CharactersToAdd
    }
}

function GeneratePassword {
    param(
        $PasswordProfile, 
        [String]$MasterPassword
    )
    process {
        $Entropy = CalcEntropy $PasswordProfile $MasterPassword

        return RenderPassword $Entropy $PasswordProfile
    }
}

Export-ModuleMember -Function   CalcEntropy, `
                                GeneratePassword, `
                                GetConfiguredRules, `
                                GetSetOfCharacters, `
                                ConsumeEntropy, `
                                GetOneCharPerRule, `
                                InsertStringPseudoRandomly, `
                                RenderPassword
