Import-Module $PSScriptRoot/Profile.psm1 -Force  # force code to be reloaded
Describe 'Profile' {
    Context "Create default profile" {
        $profile = New-Profile "Site.org" "my-login"

        It 'contains default <property>' -TestCases @(
            @{property = "Lowercase"},
            @{property = "Uppercase"},
            @{property = "Digits"},
            @{property = "Symbols"},
            @{property = "length"},
            @{property = "counter"},
            @{property = "Site"},
            @{property = "login"}
        ) {
            param($property)
            $profile.keys | Should -Contain $property
        }

        It 'contains given `Site` value' {
            $profile.Site | Should -Be 'Site.org'
        }
        It 'contains given `login` value' {
            $profile.login | Should -Be 'my-login'
        }
    }

    It 'create profile without login parameter' {
        $profile = New-Profile "Site.org"

        $profile.login | Should -Be ''
    }

    It 'create profile with a given length' {
        $profile = New-Profile "Site.org" -length 8

        $profile.Length | Should -Be 8
    }

    It 'create profile with a given counter' {
        $profile = New-Profile "Site.org" -counter 2

        $profile.counter | Should -Be 2
    }

    Context "Create profile with Lowercase" {
        $profile = New-Profile "Site.org" -Lowercase

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'disable Uppercase' {
            $profile.Uppercase | Should -Be $false
        }
        It 'disable Digits' {
            $profile.Digits | Should -Be $false
        }
        It 'disable Symbols' {
            $profile.Symbols | Should -Be $false
        }
    }
    
    Context "Create profile with Uppercase" {
        $profile = New-Profile "Site.org" -Uppercase

        It 'disable Lowercase' {
            $profile.Lowercase | Should -Be $false
        }
        It 'enable Uppercase' {
            $profile.Uppercase | Should -Be $true
        }
        It 'disable Digits' {
            $profile.Digits | Should -Be $false
        }
        It 'disable Symbols' {
            $profile.Symbols | Should -Be $false
        }
    }
    
    Context "Create profile with Digits" {
        $profile = New-Profile "Site.org" -Digits

        It 'disable Lowercase' {
            $profile.Lowercase | Should -Be $false
        }
        It 'disable Uppercase' {
            $profile.Uppercase | Should -Be $false
        }
        It 'enable Digits' {
            $profile.Digits | Should -Be $true
        }
        It 'disable Symbols' {
            $profile.Symbols | Should -Be $false
        }
    }
    
    Context "Create profile with Symbols" {
        $profile = New-Profile "Site.org" -Symbols

        It 'disable Lowercase' {
            $profile.Lowercase | Should -Be $false
        }
        It 'disable Uppercase' {
            $profile.Uppercase | Should -Be $false
        }
        It 'disable Digits' {
            $profile.Digits | Should -Be $false
        }
        It 'enable Symbols' {
            $profile.Symbols | Should -Be $true
        }
    }

    Context "Create profile with Lowercase and Uppercase" {
        $profile = New-Profile "Site.org" -Lowercase -Uppercase

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'enable Uppercase' {
            $profile.Uppercase | Should -Be $true
        }
        It 'disable Digits' {
            $profile.Digits | Should -Be $false
        }
        It 'disable Symbols' {
            $profile.Symbols | Should -Be $false
        }
    }
    
    Context "Create profile with Lowercase and Digits" {
        $profile = New-Profile "Site.org" -Lowercase -Digits

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'disable Uppercase' {
            $profile.Uppercase | Should -Be $false
        }
        It 'enable Digits' {
            $profile.Digits | Should -Be $true
        }
        It 'disable Symbols' {
            $profile.Symbols | Should -Be $false
        }
    }
    
    Context "Create profile with Lowercase and Symbols" {
        $profile = New-Profile "Site.org" -Lowercase -Symbols

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'disable Uppercase' {
            $profile.Uppercase | Should -Be $false
        }
        It 'disable Digits' {
            $profile.Digits | Should -Be $false
        }
        It 'enable Symbols' {
            $profile.Symbols | Should -Be $true
        }
    }

    Context "Create profile with Uppercase and Digits" {
        $profile = New-Profile "Site.org" -Uppercase -Digits

        It 'disable Lowercase' {
            $profile.Lowercase | Should -Be $false
        }
        It 'enable Uppercase' {
            $profile.Uppercase | Should -Be $true
        }
        It 'enable Digits' {
            $profile.Digits | Should -Be $true
        }
        It 'disable Symbols' {
            $profile.Symbols | Should -Be $false
        }
    }
    
    Context "Create profile with Uppercase and Symbols" {
        $profile = New-Profile "Site.org" -Uppercase -Symbols

        It 'disable Lowercase' {
            $profile.Lowercase | Should -Be $false
        }
        It 'enable Uppercase' {
            $profile.Uppercase | Should -Be $true
        }
        It 'disable Digits' {
            $profile.Digits | Should -Be $false
        }
        It 'enable Symbols' {
            $profile.Symbols | Should -Be $true
        }
    }

    Context "Create profile with Digits and Symbols" {
        $profile = New-Profile "Site.org" -Digits -Symbols

        It 'disable Lowercase' {
            $profile.Lowercase | Should -Be $false
        }
        It 'disable Uppercase' {
            $profile.Uppercase | Should -Be $false
        }
        It 'enable Digits' {
            $profile.Digits | Should -Be $true
        }
        It 'enable Symbols' {
            $profile.Symbols | Should -Be $true
        }
    }

    Context "Create profile with Lowercase, Uppercase and Digits" {
        $profile = New-Profile "Site.org" -Lowercase -Uppercase -Digits

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'enable Uppercase' {
            $profile.Uppercase | Should -Be $true
        }
        It 'enable Digits' {
            $profile.Digits | Should -Be $true
        }
        It 'disable Symbols' {
            $profile.Symbols | Should -Be $false
        }
    }

    Context "Create profile with Lowercase, Uppercase and Symbols" {
        $profile = New-Profile "Site.org" -Lowercase -Uppercase -Symbols

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'enable Uppercase' {
            $profile.Uppercase | Should -Be $true
        }
        It 'disable Digits' {
            $profile.Digits | Should -Be $false
        }
        It 'enable Symbols' {
            $profile.Symbols | Should -Be $true
        }
    }

    Context "Create profile with Uppercase, Digits and Symbols" {
        $profile = New-Profile "Site.org" -Uppercase -Digits -Symbols

        It 'disable Lowercase' {
            $profile.Lowercase | Should -Be $false
        }
        It 'enable Uppercase' {
            $profile.Uppercase | Should -Be $true
        }
        It 'enable Digits' {
            $profile.Digits | Should -Be $true
        }
        It 'enable Symbols' {
            $profile.Symbols | Should -Be $true
        }
    }

    Context "Create profile with Lowercase, Uppercase, Digits and Symbols" {
        $profile = New-Profile "Site.org" -Lowercase -Uppercase -Digits -Symbols

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'enable Uppercase' {
            $profile.Uppercase | Should -Be $true
        }
        It 'enable Digits' {
            $profile.Digits | Should -Be $true
        }
        It 'enable Symbols' {
            $profile.Symbols | Should -Be $true
        }
    }

    Context "Create profile with Symbols, Uppercase, Lowercase and Digits" {
        $profile = New-Profile "Site.org" -Symbols -Uppercase -Lowercase -Digits

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'enable Uppercase' {
            $profile.Uppercase | Should -Be $true
        }
        It 'enable Digits' {
            $profile.Digits | Should -Be $true
        }
        It 'enable Symbols' {
            $profile.Symbols | Should -Be $true
        }
    }

    Context "Create profile with no Lowercase" {
        $profile = New-Profile "Site.org" -noLowercase

        It 'disable Lowercase' {
            $profile.Lowercase | Should -Be $false
        }
        It 'enable Uppercase' {
            $profile.Uppercase | Should -Be $true
        }
        It 'enable Digits' {
            $profile.Digits | Should -Be $true
        }
        It 'enable Symbols' {
            $profile.Symbols | Should -Be $true
        }
    }

    Context "Create profile with no Uppercase" {
        $profile = New-Profile "Site.org" -noUppercase

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'disable Uppercase' {
            $profile.Uppercase | Should -Be $false
        }
        It 'enable Digits' {
            $profile.Digits | Should -Be $true
        }
        It 'enable Symbols' {
            $profile.Symbols | Should -Be $true
        }
    }

    Context "Create profile with no Digits" {
        $profile = New-Profile "Site.org" -noDigits

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'enable Uppercase' {
            $profile.Uppercase | Should -Be $true
        }
        It 'disable Digits' {
            $profile.Digits | Should -Be $false
        }
        It 'enable Symbols' {
            $profile.Symbols | Should -Be $true
        }
    }

    Context "Create profile with no Symbols" {
        $profile = New-Profile "Site.org" -noSymbols

        It 'enable Lowercase' {
            $profile.Lowercase | Should -Be $true
        }
        It 'enable Uppercase' {
            $profile.Uppercase | Should -Be $true
        }
        It 'enable Digits' {
            $profile.Digits | Should -Be $true
        }
        It 'disable Symbols' {
            $profile.Symbols | Should -Be $false
        }
    }

}