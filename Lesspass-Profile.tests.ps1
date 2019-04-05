Import-Module $PSScriptRoot/Lesspass-Profile.psm1 -Force  # force code to be reloaded
Describe 'Profile' {
    Context "Create default profile" {
        $profile = New-Profile "site.org" "my-login"

        It 'contains default <property>' -TestCases @(
            @{property = "lowercase"},
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

    Context "Create profile with lowercase" {
        $profile = New-Profile "site.org" -lowercase

        It 'enable lowercase' {
            $profile.lowercase | Should -Be $true
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

        It 'disable lowercase' {
            $profile.lowercase | Should -Be $false
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

        It 'disable lowercase' {
            $profile.lowercase | Should -Be $false
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

        It 'disable lowercase' {
            $profile.lowercase | Should -Be $false
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

    Context "Create profile with lowercase and uppercase" {
        $profile = New-Profile "site.org" -lowercase -uppercase

        It 'enable lowercase' {
            $profile.lowercase | Should -Be $true
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
    
    Context "Create profile with lowercase and digits" {
        $profile = New-Profile "site.org" -lowercase -digits

        It 'enable lowercase' {
            $profile.lowercase | Should -Be $true
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
    
    Context "Create profile with lowercase and symbols" {
        $profile = New-Profile "site.org" -lowercase -symbols

        It 'enable lowercase' {
            $profile.lowercase | Should -Be $true
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

        It 'disable lowercase' {
            $profile.lowercase | Should -Be $false
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

        It 'disable lowercase' {
            $profile.lowercase | Should -Be $false
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

        It 'disable lowercase' {
            $profile.lowercase | Should -Be $false
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

    Context "Create profile with lowercase, uppercase and digits" {
        $profile = New-Profile "site.org" -lowercase -uppercase -digits

        It 'enable lowercase' {
            $profile.lowercase | Should -Be $true
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

    Context "Create profile with lowercase, uppercase and symbols" {
        $profile = New-Profile "site.org" -lowercase -uppercase -symbols

        It 'enable lowercase' {
            $profile.lowercase | Should -Be $true
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

        It 'disable lowercase' {
            $profile.lowercase | Should -Be $false
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

    Context "Create profile with lowercase, uppercase, digits and symbols" {
        $profile = New-Profile "site.org" -lowercase -uppercase -digits -symbols

        It 'enable lowercase' {
            $profile.lowercase | Should -Be $true
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

    Context "Create profile with symbols, uppercase, lowercase and digits" {
        $profile = New-Profile "site.org" -symbols -uppercase -lowercase -digits

        It 'enable lowercase' {
            $profile.lowercase | Should -Be $true
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

    Context "Create profile with no lowercase" {
        $profile = New-Profile "site.org" -noLowercase

        It 'disable lowercase' {
            $profile.lowercase | Should -Be $false
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

        It 'enable lowercase' {
            $profile.lowercase | Should -Be $true
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

        It 'enable lowercase' {
            $profile.lowercase | Should -Be $true
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

        It 'enable lowercase' {
            $profile.lowercase | Should -Be $true
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