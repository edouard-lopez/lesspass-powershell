Import-Module $PSScriptRoot/Profile.psd1 -Force  # force code to be reloaded

Clear-Host

Describe 'Profile' {
    Context "Create default profile" {
        ($profile, $master_pasword) = New-Profile "site.org" "my-login"

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
            ($profile | Get-Member -MemberType NoteProperty).Name | should -Contain ($property)
        }

        It 'contains given `site` value' {
            $profile.site | Should -Be 'site.org'
        }
        It 'contains given `login` value' {
            $profile.login | Should -Be 'my-login'
        }
    }

    It 'create profile without login parameter' {
        ($profile, $__) = New-Profile "site.org"

        $profile.login | Should -Be ''
    }

    It 'create profile with a given length' {
        ($profile, $__) = New-Profile "site.org" -length 8

        $profile.Length | Should -Be 8
    }

    It 'create profile with a given counter' {
        ($profile, $__) = New-Profile "site.org" -counter 2

        $profile.counter | Should -Be 2
    }

    It 'create profile with given master password' {
        ($__, $master_password) = New-Profile "site.org" "my-login" "my_master_pasword"

        $master_password | Should -Be "my_master_pasword"
    }

    Context "Create profile with lowercase" {
        ($profile, $__) = New-Profile "site.org" -lowercase

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
        ($profile, $__) = New-Profile "site.org" -uppercase

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
        ($profile, $__) = New-Profile "site.org" -digits

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
        ($profile, $__) = New-Profile "site.org" -symbols

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
        ($profile, $__) = New-Profile "site.org" -lowercase -uppercase

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
        ($profile, $__) = New-Profile "site.org" -lowercase -digits

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
        ($profile, $__) = New-Profile "site.org" -lowercase -symbols

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
        It 'disable symbols' {
            $profile.symbols | Should -Be $true
        }
    }
}