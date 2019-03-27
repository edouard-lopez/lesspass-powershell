function New-Profile {
    param(
        [string]$site,
        [string]$login,
        [string]$master_password,
        [Alias('l')][Switch]$lowercase=$false,
        [Alias('u')][Switch]$uppercase=$false,
        [Alias('d')][Switch]$digits=$false,
        [Alias('s')][Switch]$symbols=$false,
        [Alias('nl')][Switch]$noLowercase=$false,
        [Alias('nu')][Switch]$noUppercase=$false,
        [Alias('nd')][Switch]$noDigits=$false,
        [Alias('ns')][Switch]$noSymbols=$false,
        $length=1,
        $counter=1
        # $prompt=$true
    )
    $profile = @{
        lowercase = !$noLowercase
        uppercase = !$noUppercase
        digits    = !$noDigits
        symbols   = !$noSymbols
        length    = $length
        counter   = $counter
        site      = "$site"
        login     = "$login"
    }

    if ($lowercase -or $uppercase -or $digits -or $symbols) {
        $profile.lowercase = $lowercase
        $profile.uppercase = $uppercase
        $profile.digits = $digits
        $profile.symbols = $symbols
           
    }
    return $profile, $master_password
}
