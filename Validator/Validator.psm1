class NoOppositeRules {
    [String] $errorMessage = ""

    [Boolean] isValid() {
        return $false
    }
}

function Confirm-Arguments {
    param(
        $site,
        [Alias('l')][Switch]$lowercase=$false,
        [Alias('u')][Switch]$uppercase=$false,
        [Alias('nl')][Switch]$noLowercase=$false,
        [Alias('nu')][Switch]$noUppercase=$false
    )
     # instanciation de NoOppositeRules avec les arguments passés à Confirm-Arguments
    # Write-Host @PsBoundParameters "//" $args 
    # $NoOppositeRules = New-Object NoOppositeRules @PSBoundParameters $args
    $rules = $NoOppositeRules

    $error = $false
    $errorMessage = "Can't have -l (--lowercase) and --no-lowercase at the same time"

    ForEach ($rule in $rules) {
        If (-Not $rule.isValid()) {
            $error = $true
            $errorMessage += $rule.errorMessage
        }
    }

    return $true, $errorMessage
}

Export-ModuleMember -Function Confirm-Arguments