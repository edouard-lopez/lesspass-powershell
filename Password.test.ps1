Import-Module $PSScriptRoot/Password.psm1 -Force  # force code to be reloaded

Clear-Host

Describe 'Rendder Password' {
    Context "GetConfiguredRules" {
        It "is empty when no rules in profile" {
            $PasswordProfile = @{}
            
            GetConfiguredRules $PasswordProfile | Should -Be @()
        }

        It "ignore disabled rules" {
            $PasswordProfile = @{
                lowercase = $False
                uppercase = $True
                digits    = $False
                symbols   = $True
            }
            
            GetConfiguredRules $PasswordProfile | Sort-Object | Should -Be @("symbols", "uppercase")
        }
    }

    Context "GetSetOfCharacters" {
        $CharacterSubsets = [ordered]@{
            lowercase = "abcdefghijklmnopqrstuvwxyz"
            uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
            digits    = "0123456789"
            symbols   = "!`"#$%&'()*+,-./:;<=>?@[`\]^_``{|}~"
        }

        It "get set of characters without rule" {
            GetSetOfCharacters | Should -Be "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!`"#$%&'()*+,-./:;<=>?@[\]^_``{|}~"
        }

        It "get set of characters with single rule: <rule>"-TestCases @(
            @{rule = "lowercase" }
            @{rule = "uppercase" }
            @{rule = "digits" }
            @{rule = "symbols" }
         ) {
            param($rule)
            GetSetOfCharacters @($rule) | Should -Be $CharacterSubsets.$rule

        }
        It "get set of characters with several rules" {
            GetSetOfCharacters @("lowercase", "digits") | Should -Be "abcdefghijklmnopqrstuvwxyz0123456789"
        }
    }

    Context "ConsumeEntropy" {
        $GeneratedPassword = ""
        # declaring BigInt as a string is mandatory, see https://stackoverflow.com/q/55366362/802365
        [BigInt]$EntropyAsInt = "99600400399777174105034830393873797761817714609490038944205586760025858632478"
        
        $SetOfCharacters = "abcdefghijklmnopqrstuvwxyz0123456789"
        $MaxLength = 12

        $generated_password, $remaining_entropy = ConsumeEntropy $GeneratedPassword $EntropyAsInt $SetOfCharacters $MaxLength

        It "returns generated password value" {
            $generated_password | Should -Be "gsrwvjl3d0sn"
        }

        It "returns the remaining entropy" {
            $remaining_entropy | Should -Be "21019920789038193790619410818194537836313158091882651458040"
        }
    }
}

Describe 'Password' {
    Context "Compute Entropy" {
        It "as a lower case hexadecimal string" {
            $PasswordProfile = @{
                site      = "example.org"
                login     = "contact@example.org"
                counter   = 1
            }
            $MasterPassword = "password"

            CalcEntropy $PasswordProfile $MasterPassword | Should -Be 'dc33d431bce2b01182c613382483ccdb0e2f66482cbba5e9d07dab34acc7eb1e'
        }
    }
    Context "Generate" {
        # It 'with profile #1' {
        #     $PasswordProfile = @{
        #         site      = "example.org"
        #         login     = "contact@example.org"
        #         lowercase = $True
        #         uppercase = $True
        #         digits    = $True
        #         symbols   = $True
        #         length    = 16
        #         counter   = 1
        #     }
        #     $MasterPassword = "password"

        #     GeneratePassword $PasswordProfile $MasterPassword | Should -Be "WHLpUL)e00[iHR+w"
        # }

        # It 'with profile #2' {
        #     $PasswordProfile = @{
        #         site      = "example.org"
        #         login     = "contact@example.org"
        #         lowercase = $True
        #         uppercase = $True
        #         digits    = $True
        #         symbols   = $false
        #         length    = 14
        #         counter   = 2
        #     }
        #     $MasterPassword = "password"
            
        #     GeneratePassword $PasswordProfile $MasterPassword | Should -Be "MBAsB7b1Prt8Sl"
        # }

        # It 'with profile #3' {
        #     $PasswordProfile = @{
        #         site      = "example.org"
        #         login     = "contact@example.org"
        #         lowercase = $False
        #         uppercase = $False
        #         digits    = $True
        #         symbols   = $False
        #         length    = 16
        #         counter   = 1
        #     }
        #     $MasterPassword = "password"

        #     GeneratePassword $PasswordProfile $MasterPassword | Should -Be "8742368585200667"
        # }

        # It 'with profile #4' {
        #     $PasswordProfile = @{
        #         site      = "example.org"
        #         login     = "contact@example.org"
        #         lowercase = $True
        #         uppercase = $True
        #         digits    = $False
        #         symbols   = $True
        #         length    = 16
        #         counter   = 1
        #     }
        #     $MasterPassword = "password"

        #     GeneratePassword $PasswordProfile $MasterPassword | Should -Be "s>{F}RwkN/-fmM.X"
        # }

        # It 'with profile NRT 328' {
        #     $PasswordProfile = @{
        #         site      = "site"
        #         login     = "login"
        #         lowercase = $True
        #         uppercase = $True
        #         digits    = $True
        #         symbols   = $True
        #         length    = 16
        #         counter   = 1
        #     }
        #     $MasterPassword = "test"

        #     GeneratePassword $PasswordProfile $MasterPassword | Should -Be "XFt0F*,r619:+}[."
        # }
    }
}
