Import-Module $PSScriptRoot/lesspass.psd1 -Force  # force code to be reloaded

Clear-Host

Describe 'Clipboard' {
    Context "Check copy executable" {
        $CopyCommand = Get-SystemCopyCommand

        It 'does not throws error when executable is present' {
            {$CopyCommand.CommandType} | Should -not -Throw
        }
    }
}
