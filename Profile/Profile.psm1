function New-Profile {
    param(
        $site,
        $login,
        $master_password,
        [Alias('l')][Switch]$lowercase=$false,
        $length=1,
        $counter=1,
    )
    [PSCustomObject]@{
        lowercase = $lowercase -or !($no_lowercase -eq $null -or !$no_lowercase)
      uppercase = 1
      digits = 1
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
