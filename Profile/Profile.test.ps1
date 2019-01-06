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

}