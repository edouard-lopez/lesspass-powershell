function New-Profile {
    param(
        $site,
        $login,
        $master_password,
        [Alias('l')][Switch]$lowercase=$false,
        [Alias('u')][Switch]$uppercase=$false,
        [Alias('d')][Switch]$digits=$false,
        [Alias('s')][Switch]$symbols=$false,
        $length=1,
        $counter=1,
    )
    [PSCustomObject]@{
        lowercase = $lowercase -or !($no_lowercase -eq $null -or !$no_lowercase)
        uppercase = $uppercase -or !($no_uppercase -eq $null -or !$no_uppercase)
        digits    = $digits -or !($no_digits -eq $null -or !$no_digits)
        symbols   = $symbols -or !($no_symbols -eq $null -or !$no_symbols)
        length    = $length
        counter   = $counter
        site      = "$site"
        login     = "$login"
    }
    $master_password
}
