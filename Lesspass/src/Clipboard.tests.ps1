Import-Module $PSScriptRoot/Clipboard.psm1 -Force  # force code to be reloaded

Describe 'Clipboard' {
    Context "Check" {
        $CopyCommand = Get-SystemCopyCommand

        It 'copy executable is present' {
            {$CopyCommand.CommandType} | Should -not -Throw
        }
    }
}