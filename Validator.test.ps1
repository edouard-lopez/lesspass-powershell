Import-Module $PSScriptRoot/lesspass.psd1 -Force  # force code to be reloaded

Clear-Host

Describe 'Validator' {
    Context "Confirm on simple rules " {
        It 'returns no error : Lowercase' {
            {Confirm-Arguments "site.org" -Lowercase} | Should -not -Throw
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
            {Confirm-Arguments "site.org" -Lowercase -NoLowercase} | Should -Throw
        }
        It 'returns an error : Uppercase' {
            {Confirm-Arguments "site.org" -Uppercase -NoUppercase} | Should -Throw
        }
        It 'returns an error : Digits' {
            {Confirm-Arguments "site.org" -Digits -noDigits} | Should -Throw
        }
        It 'returns an error : Symbols' {
            {Confirm-Arguments "site.org" -Symbols -noSymbols} | Should -Throw
        }
    }

    Context "Confirm `site` argument is required" {
        It 'returns an error missing site' {
            {Confirm-Arguments -Symbols -Lowercase -Uppercase -Digits} | Should -Throw
        }
    }

    Context "Confirm Prompt argument make `site` argument optional" {
        It "doesn't contains error message" {
            {Confirm-Arguments -Prompt} | Should -not -Throw
        }
    }

    Context "Confirm copy to clipboard is possible" {
        It "doesn't contains error message" {
            {Confirm-Arguments "site.org" -Clipboard} | Should -Not -Throw
        }
    }
}