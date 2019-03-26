$CharacterSubsets = @{
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
        $Salt = $PasswordProfile.site + $PasswordProfile.login + $PasswordProfile.counter
        $SaltAsBytes = [System.Text.UTF8Encoding]::UTF8.GetBytes($Salt)
        # $HashAlgorithm = New-Object System.Security.Cryptography.HMACSHA256
        $HashAlgorithm = [System.Security.Cryptography.HMACSHA256]::new()
        $MasterPasswordAsBytes = [System.Text.UTF8Encoding]::UTF8.GetBytes($MasterPassword)
        $Iterations = 100000
        $DerivedKeyLength = 32

        $Entropy = PBKDF2_by_medo64 $HashAlgorithm $MasterPasswordAsBytes $SaltAsBytes $Iterations $DerivedKeyLength

        return [System.BitConverter]::ToString($Entropy).ToLower().Replace('-', '')
    }
}


# function GetSetOfCharacters {
#     param(
#         $Rules=$null
#     )
#     process{}
# }
# function ConsumeEntropy {
#     param(
#         [String]$GeneratedPassword, 
#         [Int]$Quotient, 
#         [String]$SetOfCharacters, 
#         [Int]$MaxLength
#     )
#     process{}
# }
# function InsertStringPseudoRandomly {
#     param(
#         [String]$GeneratedPassword, 
#         [Int]$Entropy, 
#         [String]$String
#     )
#     process{}
# }
# function GetOneCharPerRule {
#     param(
#         [Int]$Entropy, 
#         $Rules
#     )
#     process{}
# }
function GetConfiguredRules {
    param(
        $PasswordProfile
    )
    process{
        $Rules = @("lowercase", "uppercase", "digits", "symbols")
        $ruleset = @()

        return $PasswordProfile.Keys | Where-Object { $PasswordProfile.$_ -contains $Rules }
    }
}
function RenderPassword {
    param(
        [String]$Entropy, 
        $PasswordProfile
    )
    process{}
}
function GeneratePassword {
    param(
        $PasswordProfile, 
        [String]$MasterPassword
    )
    process {
        $Entropy = CalcEntropy $PasswordProfile $MasterPassword

        $Result = RenderPassword $Entropy $PasswordProfile

        return 'whatever'
    }
}

Export-ModuleMember -Function CalcEntropy, GeneratePassword, GetConfiguredRules
