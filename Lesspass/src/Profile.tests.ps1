Import-Module $PSScriptRoot/Profile.psm1 -Force  # force code to be reloaded
Describe 'Profile' {
    Context "Create default profile" {
        $profile = New-Profile "site.org" "my-login"

        It 'contains default <property>' -TestCases @(
            @{property = "Lowercase"},
            @{property = "Uppercase"},
            @{property = "Digits"},
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
        It 'disable Uppercase' {
            $profile.Uppercase | Should -Be $false
        }
        It 'disable Digits' {
            $profile.Digits | Should -Be $false
        }
        It 'disable symbols' {
            $profile.symbols | Should -Be $false
        }
    }
    
    Context "Create profile with Uppercase" {
        $profile = New-Profile "site.org" -Uppercase

        It 'disable Lowercase' {
            $profile.Lowercase | Should -Be $false
        }
        It 'enable Uppercase' {
            $profile.Uppercase | Should -Be $true
        }
        It 'disable Digits' {
            $profile.Digits | Should -Be $false
        }
        It 'disable symbols' {
            $profile.symbols | Should -Be $false
        }
    }
    
    Context "Create profile with Digits" {
        $profile = New-Profile "site.org" -Digits

        It 'disable Lowercase' {
            $profile.Lowercase | Should -Be $false
        }
        It 'disable Uppercase' {
            $profile.Uppercase | Should -Be $false
        }
        It 'enable Digits' {
            $profile.Digits | Should -Be $true
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
        It 'disable Uppercase' {
            $profile.Uppercase | Should -Be $false
        }
        It 'disable Digits' {
            $profile.Digits | Should -Be $false
        }
        It 'enable symbols' {
            $profile.symbols | Should -Be $true
        }
    }

    Context "Create profile with Lowercase and Uppercase" {
        $profile = New-Profile "site.org" -Lowercase -Uppercase

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'enable Uppercase' {
            $profile.Uppercase | Should -Be $true
        }
        It 'disable Digits' {
            $profile.Digits | Should -Be $false
        }
        It 'disable symbols' {
            $profile.symbols | Should -Be $false
        }
    }
    
    Context "Create profile with Lowercase and Digits" {
        $profile = New-Profile "site.org" -Lowercase -Digits

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'disable Uppercase' {
            $profile.Uppercase | Should -Be $false
        }
        It 'enable Digits' {
            $profile.Digits | Should -Be $true
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
        It 'disable Uppercase' {
            $profile.Uppercase | Should -Be $false
        }
        It 'disable Digits' {
            $profile.Digits | Should -Be $false
        }
        It 'enable symbols' {
            $profile.symbols | Should -Be $true
        }
    }

    Context "Create profile with Uppercase and Digits" {
        $profile = New-Profile "site.org" -Uppercase -Digits

        It 'disable Lowercase' {
            $profile.Lowercase | Should -Be $false
        }
        It 'enable Uppercase' {
            $profile.Uppercase | Should -Be $true
        }
        It 'enable Digits' {
            $profile.Digits | Should -Be $true
        }
        It 'disable symbols' {
            $profile.symbols | Should -Be $false
        }
    }
    
    Context "Create profile with Uppercase and symbols" {
        $profile = New-Profile "site.org" -Uppercase -symbols

        It 'disable Lowercase' {
            $profile.Lowercase | Should -Be $false
        }
        It 'enable Uppercase' {
            $profile.Uppercase | Should -Be $true
        }
        It 'disable Digits' {
            $profile.Digits | Should -Be $false
        }
        It 'enable symbols' {
            $profile.symbols | Should -Be $true
        }
    }

    Context "Create profile with Digits and symbols" {
        $profile = New-Profile "site.org" -Digits -symbols

        It 'disable Lowercase' {
            $profile.Lowercase | Should -Be $false
        }
        It 'disable Uppercase' {
            $profile.Uppercase | Should -Be $false
        }
        It 'enable Digits' {
            $profile.Digits | Should -Be $true
        }
        It 'enable symbols' {
            $profile.symbols | Should -Be $true
        }
    }

    Context "Create profile with Lowercase, Uppercase and Digits" {
        $profile = New-Profile "site.org" -Lowercase -Uppercase -Digits

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'enable Uppercase' {
            $profile.Uppercase | Should -Be $true
        }
        It 'enable Digits' {
            $profile.Digits | Should -Be $true
        }
        It 'disable symbols' {
            $profile.symbols | Should -Be $false
        }
    }

    Context "Create profile with Lowercase, Uppercase and symbols" {
        $profile = New-Profile "site.org" -Lowercase -Uppercase -symbols

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'enable Uppercase' {
            $profile.Uppercase | Should -Be $true
        }
        It 'disable Digits' {
            $profile.Digits | Should -Be $false
        }
        It 'enable symbols' {
            $profile.symbols | Should -Be $true
        }
    }

    Context "Create profile with Uppercase, Digits and symbols" {
        $profile = New-Profile "site.org" -Uppercase -Digits -symbols

        It 'disable Lowercase' {
            $profile.Lowercase | Should -Be $false
        }
        It 'enable Uppercase' {
            $profile.Uppercase | Should -Be $true
        }
        It 'enable Digits' {
            $profile.Digits | Should -Be $true
        }
        It 'enable symbols' {
            $profile.symbols | Should -Be $true
        }
    }

    Context "Create profile with Lowercase, Uppercase, Digits and symbols" {
        $profile = New-Profile "site.org" -Lowercase -Uppercase -Digits -symbols

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'enable Uppercase' {
            $profile.Uppercase | Should -Be $true
        }
        It 'enable Digits' {
            $profile.Digits | Should -Be $true
        }
        It 'enable symbols' {
            $profile.symbols | Should -Be $true
        }
    }

    Context "Create profile with symbols, Uppercase, Lowercase and Digits" {
        $profile = New-Profile "site.org" -symbols -Uppercase -Lowercase -Digits

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'enable Uppercase' {
            $profile.Uppercase | Should -Be $true
        }
        It 'enable Digits' {
            $profile.Digits | Should -Be $true
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
        It 'enable Uppercase' {
            $profile.Uppercase | Should -Be $true
        }
        It 'enable Digits' {
            $profile.Digits | Should -Be $true
        }
        It 'enable symbols' {
            $profile.symbols | Should -Be $true
        }
    }

    Context "Create profile with no Uppercase" {
        $profile = New-Profile "site.org" -noUppercase

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'disable Uppercase' {
            $profile.Uppercase | Should -Be $false
        }
        It 'enable Digits' {
            $profile.Digits | Should -Be $true
        }
        It 'enable symbols' {
            $profile.symbols | Should -Be $true
        }
    }

    Context "Create profile with no Digits" {
        $profile = New-Profile "site.org" -noDigits

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'enable Uppercase' {
            $profile.Uppercase | Should -Be $true
        }
        It 'disable Digits' {
            $profile.Digits | Should -Be $false
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
        It 'enable Uppercase' {
            $profile.Uppercase | Should -Be $true
        }
        It 'enable Digits' {
            $profile.Digits | Should -Be $true
        }
        It 'disable symbols' {
            $profile.symbols | Should -Be $false
        }
    }

}