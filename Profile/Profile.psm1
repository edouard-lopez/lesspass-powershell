function New-Profile {
    param(
        $site,
        $login,
        $master_password,
    )
    [PSCustomObject]@{
      lowercase = 1
      uppercase = 1
      digits = 1
      symbols = 1
      length = 16
      counter = 1
      login = $login
        site      = "$site"
        login     = "$login"
    }
    $master_password
}
