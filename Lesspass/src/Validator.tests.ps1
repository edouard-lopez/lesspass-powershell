Import-Module $PSScriptRoot/Validator.psm1 -Force  # force code to be reloaded
Describe 'Validator' {
    Context "Simple rule" {
        It '-Lowercase is allowed' {
            {Confirm-Arguments "Site.org" -Lowercase} | Should -Not -Throw
        }
        It '-Uppercase is allowed' {
            {Confirm-Arguments "Site.org" -Uppercase} | Should -Not -Throw
        }
        It '-Digits is allowed' {
            {Confirm-Arguments "Site.org" -Digits} | Should -Not -Throw
        }
        It '-Symbols is allowed' {
            {Confirm-Arguments "Site.org" -Symbols} | Should -Not -Throw
        }
        It '-NoLowercase is allowed' {
            {Confirm-Arguments "Site.org" -NoLowercase} | Should -Not -Throw
        }
        It '-NoUppercase is allowed' {
            {Confirm-Arguments "Site.org" -NoUppercase} | Should -Not -Throw
        }
        It '-NoDigits is allowed' {
            {Confirm-Arguments "Site.org" -NoDigits} | Should -Not -Throw
        }
        It '-NoSymbols is allowed' {
            {Confirm-Arguments "Site.org" -NoSymbols} | Should -Not -Throw
        }
    }
    Context "Opposite rules" {
        It '-Lowercase and -NoLowercase are not allowed together' {
            {Confirm-Arguments "Site.org" -Lowercase -NoLowercase} | Should -Throw
        }
        It '-Uppercase and -NoUppercase are not allowed together' {
            {Confirm-Arguments "Site.org" -Uppercase -NoUppercase} | Should -Throw
        }
        It '-Digits and -NoDigits are not allowed together' {
            {Confirm-Arguments "Site.org" -Digits -NoDigits} | Should -Throw
        }
        It '-Symbols and -NoSymbols are not allowed together' {
            {Confirm-Arguments "Site.org" -Symbols -NoSymbols} | Should -Throw
        }
    }

    Context "`Site` argument is required" {
        It 'when no argument provided' {
            {Confirm-Arguments} | Should -Throw
        }
        It 'when various arguments provided' {
            {Confirm-Arguments -Symbols -Lowercase -Uppercase -Digits} | Should -Throw
        }
    }

    Context "-Prompt argument" {
        It "make `Site` argument optional" {
            {Confirm-Arguments -Prompt} | Should -Not -Throw
        }
    }

    Context "copy to clipboard" {
        It "is possible" {
            {Confirm-Arguments "Site.org" -Clipboard} | Should -Not -Throw
        }
    }
}