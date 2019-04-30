Import-module $PSScriptRoot/Lesspass.psd1 -Force

Describe 'Get-LessPass' {
    Context "Simple rule" {
        It 'Run' {
            Get-LessPass "site" "login" "masterpassword" | Should -BeExactly 'cp$=}`taN2LZ=PF@'
        }

        It 'Expects Length in [5-35]' {
            {Get-LessPass "site" "login" "masterpassword" -Length 2} `
            | Should -Throw "Cannot validate argument on parameter 'Length'. The 2 argument is less than the minimum allowed range"
        }

        It 'Prompt for MasterPassword when missing' {
            (Get-Command Get-LessPass).Parameters['master_password'].Attributes.Mandatory | Should -Be $true
        }
    }
}