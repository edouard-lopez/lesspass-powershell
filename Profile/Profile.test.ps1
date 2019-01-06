Import-Module $PSScriptRoot/Profile.psd1 -Force  # force code to be reloaded

Clear-Host

Describe 'Profile' {
    Context "Create default profile" {
        ($profile, $master_pasword) = New-Profile "site.org" "my-login"
        It 'contains default <properties>' -TestCases @(
            @{property = "lowercase"}
            @{property = "uppercase"}
            @{property = "digits"}
            @{property = "symbols"}
            @{property = "length"}
            @{property = "counter"}
            @{property = "site"}
            @{property = "login"}
        ) {}
        It 'contains given `site` and `login` value' {
            $profile.site | Should -Be 'site.org'
            $profile.login | Should -Be 'my-login'
        }
    }
}