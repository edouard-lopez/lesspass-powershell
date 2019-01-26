Import-Module $PSScriptRoot/Password.psm1 -Force  # force code to be reloaded

Clear-Host

Describe 'Password' {
    Context "Generate" {
        It 'with profile #1' {
            $Profile = [PSCustomObject]@{
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

            GeneratePassword $Profile $MasterPassword | Should -Be "WHLpUL)e00[iHR+w"
        }

        It 'with profile #2' {
            $Profile = [PSCustomObject]@{
                site      = "example.org"
                login     = "contact@example.org"
                lowercase = $True
                uppercase = $True
                digits    = $True
                symbols   = $false
                length    = 14
                counter   = 2
            }
            $MasterPassword = "password"
            
            GeneratePassword $Profile $MasterPassword | Should -Be "MBAsB7b1Prt8Sl"
        }

        It 'with profile #3' {
            $Profile = [PSCustomObject]@{
                site      = "example.org"
                login     = "contact@example.org"
                lowercase = $False
                uppercase = $False
                digits    = $True
                symbols   = $False
                length    = 16
                counter   = 1
            }
            $MasterPassword = "password"

            GeneratePassword $Profile $MasterPassword | Should -Be "8742368585200667"
        }

        It 'with profile #4' {
            $Profile = [PSCustomObject]@{
                site      = "example.org"
                login     = "contact@example.org"
                lowercase = $True
                uppercase = $True
                digits    = $False
                symbols   = $True
                length    = 16
                counter   = 1
            }
            $MasterPassword = "password"

            GeneratePassword $Profile $MasterPassword | Should -Be "s>{F}RwkN/-fmM.X"
        }

        It 'with profile NRT 328' {
            $Profile = [PSCustomObject]@{
                site      = "site"
                login     = "login"
                lowercase = $True
                uppercase = $True
                digits    = $True
                symbols   = $True
                length    = 16
                counter   = 1
            }
            $MasterPassword = "test"

            GeneratePassword $Profile $MasterPassword | Should -Be "XFt0F*,r619:+}[."
        }
    }
}
