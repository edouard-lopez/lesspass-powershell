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
            
            GetConfiguredRules $PasswordProfile | Should -Be @("uppercase", "symbols")
        }
    }
}

Describe 'Password' {
    Context "Compute Entropy" {
        It "as a lower case hexadecimal string" {
            $PasswordProfile = [PSCustomObject]@{
                site      = "example.org"
                login     = "contact@example.org"
                counter   = 1
            }
            $MasterPassword = "password"

            CalcEntropy $PasswordProfile $MasterPassword | Should -Be 'dc33d431bce2b01182c613382483ccdb0e2f66482cbba5e9d07dab34acc7eb1e'
        }
    }
    Context "Generate" {
        It 'with profile #1' {
            $PasswordProfile = [PSCustomObject]@{
                site      = "example.org"
                login     = "contact@example.org"
                lowercase = $True
                uppercase = $True
                digits    = $True
                symbols   = $True
                length    = 16
                counter   = 1
            }
            $MasterPassword = "password"

            GeneratePassword $PasswordProfile $MasterPassword | Should -Be "WHLpUL)e00[iHR+w"
        }

        # It 'with profile #2' {
        #     $PasswordProfile = [PSCustomObject]@{
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
        #     $PasswordProfile = [PSCustomObject]@{
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
        #     $PasswordProfile = [PSCustomObject]@{
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
        #     $PasswordProfile = [PSCustomObject]@{
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
