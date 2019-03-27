
function Confirm-Arguments {
    param(
        [string]$site,
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

    if ($PSBoundParameters.lowercase -and $PSBoundParameters.noLowercase) {
        throw "* Can't have opposite rule -L (or -Lowercase) and -NL (or -No-Lowercase) at the same time."
    }
    if ($PSBoundParameters.uppercase -and $PSBoundParameters.noUppercase) {
        throw "* Can't have opposite rule -U (or -Uppercase) and -NU (or -No-Uppercase) at the same time."
    }
    if ($PSBoundParameters.digits -and $PSBoundParameters.noDigits) {
        throw "* Can't have opposite rule -D (or -Digits) and -ND (or -No-Digits) at the same time."
    }
    if ($PSBoundParameters.symbols -and $PSBoundParameters.noSymbols) {
        throw "* Can't have opposite rule -S (or -Symbols) and -NS (or -No-Symbols) at the same time."
    }
    if (!$PSBoundParameters.site -and !$PSBoundParameters.prompt) {
        throw " * SITE is a required argument (unless in interactive mode with -Prompt)"
    }
    if ($PSBoundParameters.clipboard) {
        Get-SystemCopyCommand
    }
}

Export-ModuleMember -Function Confirm-Arguments