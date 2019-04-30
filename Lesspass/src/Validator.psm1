
function Confirm-Arguments {
    param(
        [string]$Site,
        [Alias('l')][Switch]$Lowercase,
        [Alias('nl')][Switch]$noLowercase,
        [Alias('u')][Switch]$Uppercase,
        [Alias('nu')][Switch]$noUppercase,
        [Alias('d')][Switch]$Digits,
        [Alias('nd')][Switch]$noDigits,
        [Alias('s')][Switch]$Symbols,
        [Alias('ns')][Switch]$noSymbols,
        [Switch]$prompt,
        [Switch]$Clipboard
    )

    if ($PSBoundParameters.Lowercase -and $PSBoundParameters.noLowercase) {
        throw "* Can't have opposite rule -L (or -Lowercase) and -NL (or -No-Lowercase) at the same time."
    }
    if ($PSBoundParameters.Uppercase -and $PSBoundParameters.noUppercase) {
        throw "* Can't have opposite rule -U (or -Uppercase) and -NU (or -No-Uppercase) at the same time."
    }
    if ($PSBoundParameters.Digits -and $PSBoundParameters.noDigits) {
        throw "* Can't have opposite rule -D (or -Digits) and -ND (or -No-Digits) at the same time."
    }
    if ($PSBoundParameters.Symbols -and $PSBoundParameters.noSymbols) {
        throw "* Can't have opposite rule -S (or -Symbols) and -NS (or -No-Symbols) at the same time."
    }
    if (!$PSBoundParameters.Site -and !$PSBoundParameters.prompt) {
        throw " * SITE is a required argument (unless in interactive mode with -Prompt)"
    }
    if ($PSBoundParameters.Clipboard) {
        Get-SystemCopyCommand
    }
}
Export-ModuleMember -Function Confirm-Arguments