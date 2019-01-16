class NoOppositeRules {
    [String] $errorMessage = ""

    [Boolean] isValid() {
        $isValid = $true
        
        if ($PSBoundParameters.lowercase -and $PSBoundParameters.noLowercase) {
            $this.errorMessage = "* Can't have -l (--lowercase) and --no-lowercase at the same time"
            $isValid = $false
        }
        if ($PSBoundParameters.uppercase -and $PSBoundParameters.noUppercase) {
            $this.errorMessage = "* Can't have -u (--uppercase) and --no-uppercase at the same time"
            $isValid = $false
        }
        if ($PSBoundParameters.digits -and $PSBoundParameters.noDigits) {
            $this.errorMessage = "* Can't have -d (--digits) and --no-Digits at the same time"
            $isValid = $false
        }
        if ($PSBoundParameters.symbols -and $PSBoundParameters.noSymbols) {
            $this.errorMessage = "* Can't have -d (--symbols) and --no-Symbols at the same time"
            $isValid = $false
        }
        
        return $isValid
    }
    NoOppositeRules(
        [Switch]$lowercase=$false,
        [Switch]$uppercase=$false,
        [Switch]$digits=$false,
        [Switch]$symbols=$false,
        [Switch]$noLowercase=$false,
        [Switch]$noUppercase=$false,
        [Switch]$noDigits=$false,
        [Switch]$noSymbols=$false
    ){ }
}

class DefaultParameters {
    [String] $errorMessage = ""

    [Boolean] isValid() {
        $isValid = $true
        
        if (-Not $PSBoundParameters.site -and -not $PSBoundParameters.prompt) {
            $this.errorMessage = " * SITE is a required argument (unless in interactive mode with --prompt)"
            $isValid = $false
        }

        return $isValid
    }
    DefaultParameters($site, $prompt){ }
}

class ClipboardAvailable {
    [String] $errorMessage = ""

    [Boolean] isValid() {
        $isValid = $true
        
        $copyCommandAvailable = Get-SystemCopyCommand
        if ($PSBoundParameters.clipboard -and $null -eq $copyCommandAvailable) {
            $this.errorMessage = " * To use the option -c (--copy) you need pbcopy on OSX, xsel or xclip on Linux and clip on Windows"
            $isValid = $false
        }

        return $isValid
    }
    ClipboardAvailable($clipboard){ }
}

function Confirm-Arguments {
    param(
        $site,
        [Alias('l')][Switch]$lowercase=$false,
        [Alias('nl')][Switch]$noLowercase=$false,
        [Alias('u')][Switch]$uppercase=$false,
        [Alias('nu')][Switch]$noUppercase=$false,
        [Alias('d')][Switch]$digits=$false,
        [Alias('nd')][Switch]$noDigits=$false,
        [Alias('s')][Switch]$symbols=$false,
        [Alias('ns')][Switch]$noSymbols=$false,
        [Switch]$prompt=$false,
        [Switch]$clipboard=$false
    )

    $rules = [NoOppositeRules]::new(
        $lowercase, $noLowercase,
        $uppercase, $noUppercase,
        $digits,    $noDigits,
        $symbols,   $noSymbols
    ), [DefaultParameters]::new($site, $prompt), [ClipboardAvailable]::new($clipboard)

    $error = $false
    $errorMessage = ""

    ForEach ($rule in $rules) {
        If (-Not $rule.isValid()) {
            $error = $true
            $errorMessage += $rule.errorMessage
        }
    }

    return $error, $errorMessage
}

Export-ModuleMember -Function Confirm-Arguments