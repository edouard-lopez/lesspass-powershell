class NoOppositeRules {
    [String] $errorMessage = ""

    [Boolean] isValid() {
        $isValid = $true
        
        if ($PSBoundParameters.lowercase -and $PSBoundParameters.noLowercase) {
            $this.errorMessage = "Can't have -l (--lowercase) and --no-lowercase at the same time"
            $isValid = $false
        }
        if ($PSBoundParameters.uppercase -and $PSBoundParameters.noUppercase) {
            $this.errorMessage = "Can't have -u (--uppercase) and --no-uppercase at the same time"
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


function Confirm-Arguments {
    param(
        $site,
        [Alias('l')][Switch]$lowercase=$false,
        [Alias('u')][Switch]$uppercase=$false,
        [Alias('nl')][Switch]$noLowercase=$false,
        [Alias('nu')][Switch]$noUppercase=$false
    )

    $rules = [NoOppositeRules]::new(
        $lowercase,
        $uppercase,
        $digits,
        $symbols,
        $noLowercase,
        $noUppercase,
        $noDigits,
        $noSymbols
    )

    $error = $false
    $errorMessage = ""

    ForEach ($rule in $rules) {
        If (-Not $rule.isValid()) {
            $error = $true
            $errorMessage += $rule.errorMessage
        }
    }

    return $true, $errorMessage
}

Export-ModuleMember -Function Confirm-Arguments