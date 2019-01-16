Import-Module $PSScriptRoot/lesspass.psd1 -Force  # force code to be reloaded

Clear-Host

Describe 'Clipboard' {
    Context "Check copy executable" {
        $copy_command = Get-SystemCopyCommand

        It 'is an application' {
            $copy_command.CommandType | Should -Be 'Application'
        }
    }
}
