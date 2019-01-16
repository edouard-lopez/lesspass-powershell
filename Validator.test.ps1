Import-Module $PSScriptRoot/lesspass.psd1 -Force  # force code to be reloaded

Clear-Host

Describe 'Validator' {
    Context "Confirm opposite rules for Lowercase" {
        ($error, $message) = Confirm-Arguments "site.org" -lowercase -noLowercase

        It 'returns an error' {
            $error | Should -Be $true
        }
        It 'contains error message' {
            "Can't have -l (--lowercase) and --no-lowercase at the same time" | Should -BeIn $message
        }
    }

    Context "Confirm opposite rules for Uppercase" {
        ($error, $message) = Confirm-Arguments "site.org" -Uppercase -noUppercase
        
        It 'returns an error' {
            $error | Should -Be $true
        }
        It 'contains error message' {
            "Can't have -u (--uppercase) and --no-uppercase at the same time" | Should -BeIn $message
        }
    }

    Context "Confirm opposite rules for Digits" {
        ($error, $message) = Confirm-Arguments "site.org" -Digits -noDigits

        It 'returns an error' {
            $error | Should -Be $true
        }
        It 'contains error message' {
            "Can't have -d (--digits) and --no-digits at the same time" | Should -BeIn $message
        }
    }

    Context "Confirm opposite rules for Symbols" {
        ($error, $message) = Confirm-Arguments "site.org" -Symbols -noSymbols
        
        It 'returns an error' {
            $error | Should -Be $true
        }
        It 'contains error message' {
            "Can't have -d (--symbols) and --no-symbols at the same time" | Should -BeIn $message
        }
    }

    Context "Confirm Site argument is required" {
        ($error, $message) = Confirm-Arguments

        It 'returns an error' {
            $error | Should -Be $true
        }
        It 'contains error message' {
            "Site is a required argument" | Should -BeIn $message
        }
    }

    Context "Confirm Prompt argument make Site argument optional" {
        ($error, $message) = Confirm-Arguments -Prompt

        It 'returns an error' {
            $error | Should -Be $false
        }
        It 'contains error message' {
            " * SITE is a required argument (unless in interactive mode with --prompt)" | Should -Not -BeIn $message
        }
    }

}