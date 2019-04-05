Import-module $PSScriptRoot/Lesspass.psd1 -Force

Describe 'Get-LessPass' {
    Context "Simple rule" {
        It 'Run' {
            Get-LessPass "site" "login" "masterpassword" | Should -BeExactly 'cp$=}`taN2LZ=PF@'
        }
    }
}