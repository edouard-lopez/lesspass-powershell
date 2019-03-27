Import-Module $PSScriptRoot/Lesspass-Validator.psm1 -Force  # force code to be reloaded

Describe 'Validator' {
    Context "Simple rule" {
        It '-Lowercase is allowed' {
            {Confirm-Arguments "site.org" -Lowercase} | Should -Not -Throw
        }
        It '-Uppercase is allowed' {
            {Confirm-Arguments "site.org" -Uppercase} | Should -Not -Throw
        }
        It '-Digits is allowed' {
            {Confirm-Arguments "site.org" -Digits} | Should -Not -Throw
        }
        It '-Symbols is allowed' {
            {Confirm-Arguments "site.org" -Symbols} | Should -Not -Throw
        }
        It '-NoLowercase is allowed' {
            {Confirm-Arguments "site.org" -NoLowercase} | Should -Not -Throw
        }
        It '-NoUppercase is allowed' {
            {Confirm-Arguments "site.org" -NoUppercase} | Should -Not -Throw
        }
        It '-NoDigits is allowed' {
            {Confirm-Arguments "site.org" -NoDigits} | Should -Not -Throw
        }
        It '-NoSymbols is allowed' {
            {Confirm-Arguments "site.org" -NoSymbols} | Should -Not -Throw
        }
    }
    Context "Opposite rules" {
        It '-Lowercase and -NoLowercase are not allowed together' {
            {Confirm-Arguments "site.org" -Lowercase -NoLowercase} | Should -Throw
        }
        It '-Uppercase and -NoUppercase are not allowed together' {
            {Confirm-Arguments "site.org" -Uppercase -NoUppercase} | Should -Throw
        }
        It '-Digits and -NoDigits are not allowed together' {
            {Confirm-Arguments "site.org" -Digits -NoDigits} | Should -Throw
        }
        It '-Symbols and -NoSymbols are not allowed together' {
            {Confirm-Arguments "site.org" -Symbols -NoSymbols} | Should -Throw
        }
    }

    Context "`site` argument is required" {
        It 'when no argument provided' {
            {Confirm-Arguments} | Should -Throw
        }
        It 'when various arguments provided' {
            {Confirm-Arguments -Symbols -Lowercase -Uppercase -Digits} | Should -Throw
        }
    }

    Context "-Prompt argument" {
        It "make `site` argument optional" {
            {Confirm-Arguments -Prompt} | Should -Not -Throw
        }
    }

    Context "copy to clipboard" {
        It "is possible" {
            {Confirm-Arguments "site.org" -Clipboard} | Should -Not -Throw
        }
    }
}