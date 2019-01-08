Import-Module $PSScriptRoot/Validator.psd1 -Force  # force code to be reloaded

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

    # Context "Confirm opposite rules for Digits" {
    #     It 'returns an error' {
    #         ($error, $message) = Confirm-Arguments "site.org" -Digits -noDigits

    #         $error | Should -Be $true
    #     }
    # }

    # Context "Confirm opposite rules for Symbols" {
    #     It 'returns an error' {
    #         ($error, $message) = Confirm-Arguments "site.org" -Symbols -noSymbols

    #         $error | Should -Be $true
    #     }
    # }

}