
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

    if ($PSBoundParameters.lowercase -and $PSBoundParameters.noLowercase) {
        throw "* Can't have -l (--lowercase) and --no-lowercase at the same time"
    }
    if ($PSBoundParameters.uppercase -and $PSBoundParameters.noUppercase) {
        throw "* Can't have -u (--uppercase) and --no-uppercase at the same time"
    }
    if ($PSBoundParameters.digits -and $PSBoundParameters.noDigits) {
        throw "* Can't have -d (--digits) and --no-Digits at the same time"
    }
    if ($PSBoundParameters.symbols -and $PSBoundParameters.noSymbols) {
        throw "* Can't have -d (--symbols) and --no-Symbols at the same time"
    }
    if (!$PSBoundParameters.site -and !$PSBoundParameters.prompt) {
        throw " * SITE is a required argument (unless in interactive mode with --prompt)"
    }
    if ($PSBoundParameters.clipboard) {
        Get-SystemCopyCommand
    }
}

Export-ModuleMember -Function Confirm-Arguments