Import-Module $PSScriptRoot/Profile.psd1

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
          $profile.login | Should -Be 'my-login'
        }
    }
}
