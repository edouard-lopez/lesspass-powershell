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

            $profile.site | Should -Be 'site.org'
            $profile.login | Should -Be 'my-login'
        }
    }
}