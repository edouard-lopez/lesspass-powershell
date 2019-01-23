Import-Module $PSScriptRoot/lesspass.psd1 -Force  # force code to be reloaded

Clear-Host

Describe 'Validator' {
    Context "Confirm on simple rules " {
        It 'returns no error : Lowercase' {
            {Confirm-Arguments "site.org" -lowercase} | Should -not -Throw
        }
        It 'returns no error : Uppercase' {
            {Confirm-Arguments "site.org" -Uppercase} | Should -not -Throw
        }
        It 'returns no error : Digits' {
            {Confirm-Arguments "site.org" -Digits} | Should -not -Throw
        }
        It 'returns no error : Symbols' {
            {Confirm-Arguments "site.org" -Symbols} | Should -not -Throw
        }
        It 'returns no error : noLowercase' {
            {Confirm-Arguments "site.org" -Nolowercase} | Should -not -Throw
        }
        It 'returns no error : noUppercase' {
            {Confirm-Arguments "site.org" -NoUppercase} | Should -not -Throw
        }
        It 'returns no error : noDigits' {
            {Confirm-Arguments "site.org" -NoDigits} | Should -not -Throw
        }
        It 'returns no error : noSymbols' {
            {Confirm-Arguments "site.org" -NoSymbols} | Should -not -Throw
        }
    }
    Context "Confirm opposite rules " {
        It 'returns an error : Lowercase' {
            {Confirm-Arguments "site.org" -lowercase -noLowercase} | Should -Throw
        }
        It 'returns an error : Uppercase' {
            {Confirm-Arguments "site.org" -Uppercase -noUppercase} | Should -Throw
        }
        It 'returns an error : Digits' {
            {Confirm-Arguments "site.org" -Digits -noDigits} | Should -Throw
        }
        It 'returns an error : Symbols' {
            {Confirm-Arguments "site.org" -Symbols -noSymbols} | Should -Throw
        }
    }

    Context "Confirm Site argument is required" {
        It 'returns an error missing site' {
            {Confirm-Arguments -Symbols -lowercase -Uppercase -Digits} | Should -Throw
        }
    }

    Context "Confirm Prompt argument make Site argument optional" {
        It "doesn't contains error message" {
            {Confirm-Arguments -prompt} | Should -not -Throw
        }
    }

    Context "Confirm copy to clipboard is possible" {
        It "doesn't contains error message" {
            {Confirm-Arguments "Site" -Clipboard} | Should -Not -Throw
        }
    }
}