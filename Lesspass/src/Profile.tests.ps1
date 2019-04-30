Import-Module $PSScriptRoot/Profile.psm1 -Force  # force code to be reloaded
Describe 'Profile' {
    Context "Create default profile" {
        $profile = New-Profile "site.org" "my-login"

        It 'contains default <property>' -TestCases @(
            @{property = "Lowercase"},
            @{property = "uppercase"},
            @{property = "digits"},
            @{property = "symbols"},
            @{property = "length"},
            @{property = "counter"},
            @{property = "site"},
            @{property = "login"}
        ) {
            param($property)
            $profile.keys | Should -Contain $property
        }

        It 'contains given `site` value' {
            $profile.site | Should -Be 'site.org'
        }
        It 'contains given `login` value' {
            $profile.login | Should -Be 'my-login'
        }
    }

    It 'create profile without login parameter' {
        $profile = New-Profile "site.org"

        $profile.login | Should -Be ''
    }

    It 'create profile with a given length' {
        $profile = New-Profile "site.org" -length 8

        $profile.Length | Should -Be 8
    }

    It 'create profile with a given counter' {
        $profile = New-Profile "site.org" -counter 2

        $profile.counter | Should -Be 2
    }

    Context "Create profile with Lowercase" {
        $profile = New-Profile "site.org" -Lowercase

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'disable uppercase' {
            $profile.uppercase | Should -Be $false
        }
        It 'disable digits' {
            $profile.digits | Should -Be $false
        }
        It 'disable symbols' {
            $profile.symbols | Should -Be $false
        }
    }
    
    Context "Create profile with uppercase" {
        $profile = New-Profile "site.org" -uppercase

        It 'disable Lowercase' {
            $profile.Lowercase | Should -Be $false
        }
        It 'enable uppercase' {
            $profile.uppercase | Should -Be $true
        }
        It 'disable digits' {
            $profile.digits | Should -Be $false
        }
        It 'disable symbols' {
            $profile.symbols | Should -Be $false
        }
    }
    
    Context "Create profile with digits" {
        $profile = New-Profile "site.org" -digits

        It 'disable Lowercase' {
            $profile.Lowercase | Should -Be $false
        }
        It 'disable uppercase' {
            $profile.uppercase | Should -Be $false
        }
        It 'enable digits' {
            $profile.digits | Should -Be $true
        }
        It 'disable symbols' {
            $profile.symbols | Should -Be $false
        }
    }
    
    Context "Create profile with symbols" {
        $profile = New-Profile "site.org" -symbols

        It 'disable Lowercase' {
            $profile.Lowercase | Should -Be $false
        }
        It 'disable uppercase' {
            $profile.uppercase | Should -Be $false
        }
        It 'disable digits' {
            $profile.digits | Should -Be $false
        }
        It 'enable symbols' {
            $profile.symbols | Should -Be $true
        }
    }

    Context "Create profile with Lowercase and uppercase" {
        $profile = New-Profile "site.org" -Lowercase -uppercase

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'enable uppercase' {
            $profile.uppercase | Should -Be $true
        }
        It 'disable digits' {
            $profile.digits | Should -Be $false
        }
        It 'disable symbols' {
            $profile.symbols | Should -Be $false
        }
    }
    
    Context "Create profile with Lowercase and digits" {
        $profile = New-Profile "site.org" -Lowercase -digits

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'disable uppercase' {
            $profile.uppercase | Should -Be $false
        }
        It 'enable digits' {
            $profile.digits | Should -Be $true
        }
        It 'disable symbols' {
            $profile.symbols | Should -Be $false
        }
    }
    
    Context "Create profile with Lowercase and symbols" {
        $profile = New-Profile "site.org" -Lowercase -symbols

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'disable uppercase' {
            $profile.uppercase | Should -Be $false
        }
        It 'disable digits' {
            $profile.digits | Should -Be $false
        }
        It 'enable symbols' {
            $profile.symbols | Should -Be $true
        }
    }

    Context "Create profile with uppercase and digits" {
        $profile = New-Profile "site.org" -uppercase -digits

        It 'disable Lowercase' {
            $profile.Lowercase | Should -Be $false
        }
        It 'enable uppercase' {
            $profile.uppercase | Should -Be $true
        }
        It 'enable digits' {
            $profile.digits | Should -Be $true
        }
        It 'disable symbols' {
            $profile.symbols | Should -Be $false
        }
    }
    
    Context "Create profile with uppercase and symbols" {
        $profile = New-Profile "site.org" -uppercase -symbols

        It 'disable Lowercase' {
            $profile.Lowercase | Should -Be $false
        }
        It 'enable uppercase' {
            $profile.uppercase | Should -Be $true
        }
        It 'disable digits' {
            $profile.digits | Should -Be $false
        }
        It 'enable symbols' {
            $profile.symbols | Should -Be $true
        }
    }

    Context "Create profile with digits and symbols" {
        $profile = New-Profile "site.org" -digits -symbols

        It 'disable Lowercase' {
            $profile.Lowercase | Should -Be $false
        }
        It 'disable uppercase' {
            $profile.uppercase | Should -Be $false
        }
        It 'enable digits' {
            $profile.digits | Should -Be $true
        }
        It 'enable symbols' {
            $profile.symbols | Should -Be $true
        }
    }

    Context "Create profile with Lowercase, uppercase and digits" {
        $profile = New-Profile "site.org" -Lowercase -uppercase -digits

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'enable uppercase' {
            $profile.uppercase | Should -Be $true
        }
        It 'enable digits' {
            $profile.digits | Should -Be $true
        }
        It 'disable symbols' {
            $profile.symbols | Should -Be $false
        }
    }

    Context "Create profile with Lowercase, uppercase and symbols" {
        $profile = New-Profile "site.org" -Lowercase -uppercase -symbols

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'enable uppercase' {
            $profile.uppercase | Should -Be $true
        }
        It 'disable digits' {
            $profile.digits | Should -Be $false
        }
        It 'enable symbols' {
            $profile.symbols | Should -Be $true
        }
    }

    Context "Create profile with uppercase, digits and symbols" {
        $profile = New-Profile "site.org" -uppercase -digits -symbols

        It 'disable Lowercase' {
            $profile.Lowercase | Should -Be $false
        }
        It 'enable uppercase' {
            $profile.uppercase | Should -Be $true
        }
        It 'enable digits' {
            $profile.digits | Should -Be $true
        }
        It 'enable symbols' {
            $profile.symbols | Should -Be $true
        }
    }

    Context "Create profile with Lowercase, uppercase, digits and symbols" {
        $profile = New-Profile "site.org" -Lowercase -uppercase -digits -symbols

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'enable uppercase' {
            $profile.uppercase | Should -Be $true
        }
        It 'enable digits' {
            $profile.digits | Should -Be $true
        }
        It 'enable symbols' {
            $profile.symbols | Should -Be $true
        }
    }

    Context "Create profile with symbols, uppercase, Lowercase and digits" {
        $profile = New-Profile "site.org" -symbols -uppercase -Lowercase -digits

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'enable uppercase' {
            $profile.uppercase | Should -Be $true
        }
        It 'enable digits' {
            $profile.digits | Should -Be $true
        }
        It 'enable symbols' {
            $profile.symbols | Should -Be $true
        }
    }

    Context "Create profile with no Lowercase" {
        $profile = New-Profile "site.org" -noLowercase

        It 'disable Lowercase' {
            $profile.Lowercase | Should -Be $false
        }
        It 'enable uppercase' {
            $profile.uppercase | Should -Be $true
        }
        It 'enable digits' {
            $profile.digits | Should -Be $true
        }
        It 'enable symbols' {
            $profile.symbols | Should -Be $true
        }
    }

    Context "Create profile with no uppercase" {
        $profile = New-Profile "site.org" -noUppercase

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'disable uppercase' {
            $profile.uppercase | Should -Be $false
        }
        It 'enable digits' {
            $profile.digits | Should -Be $true
        }
        It 'enable symbols' {
            $profile.symbols | Should -Be $true
        }
    }

    Context "Create profile with no digits" {
        $profile = New-Profile "site.org" -noDigits

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'enable uppercase' {
            $profile.uppercase | Should -Be $true
        }
        It 'disable digits' {
            $profile.digits | Should -Be $false
        }
        It 'enable symbols' {
            $profile.symbols | Should -Be $true
        }
    }

    Context "Create profile with no symbols" {
        $profile = New-Profile "site.org" -noSymbols

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'enable uppercase' {
            $profile.uppercase | Should -Be $true
        }
        It 'enable digits' {
            $profile.digits | Should -Be $true
        }
        It 'disable symbols' {
            $profile.symbols | Should -Be $false
        }
    }

}