function New-Profile {
    param(
        $site,
        $login,
        $master_password,
        $length=1,
        $counter=1,
    )
    [PSCustomObject]@{
      lowercase = 1
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
