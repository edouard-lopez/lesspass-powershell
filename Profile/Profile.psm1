function New-Profile {
    param(
        $site,
        $login,
        $master_password,
        [Alias('l')][Switch]$lowercase=$false,
        [Alias('u')][Switch]$uppercase=$false,
        [Alias('d')][Switch]$digits=$false,
        $length=1,
        $counter=1,
    )
    [PSCustomObject]@{
        lowercase = $lowercase -or !($no_lowercase -eq $null -or !$no_lowercase)
        uppercase = $uppercase -or !($no_uppercase -eq $null -or !$no_uppercase)
        digits    = $digits -or !($no_digits -eq $null -or !$no_digits)
      symbols = 1
      length = 16
      login = $login
        length    = $length
        counter   = $counter
        site      = "$site"
        login     = "$login"
    }
    $master_password
}
