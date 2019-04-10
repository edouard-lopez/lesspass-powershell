function New-Profile {
    param(
        [string]$site,
        [string]$login,
        [string]$master_password,
        [Alias('l')][Switch]$lowercase,
        [Alias('u')][Switch]$uppercase,
        [Alias('d')][Switch]$digits,
        [Alias('s')][Switch]$symbols,
        [Alias('nl')][Switch]$noLowercase,
        [Alias('nu')][Switch]$noUppercase,
        [Alias('nd')][Switch]$noDigits,
        [Alias('ns')][Switch]$noSymbols,
        $length=16,
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
    return $profile
}
