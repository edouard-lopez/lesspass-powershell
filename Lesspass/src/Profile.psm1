function New-Profile {
    param(
        [string]$site,
        [string]$login,
        [string]$master_password,
        [Alias('l')][Switch]$Lowercase,
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
        Lowercase = !$noLowercase
        uppercase = !$noUppercase
        digits    = !$noDigits
        symbols   = !$noSymbols
        length    = $length
        counter   = $counter
        site      = "$site"
        login     = "$login"
    }

    if ($Lowercase -or $uppercase -or $digits -or $symbols) {
        $profile.Lowercase = $Lowercase
        $profile.uppercase = $uppercase
        $profile.digits = $digits
        $profile.symbols = $symbols
           
    }
    return $profile
}
