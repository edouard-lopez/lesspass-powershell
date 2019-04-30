function New-Profile {
    param(
        [string]$site,
        [string]$login,
        [string]$master_password,
        [Alias('l')][Switch]$Lowercase,
        [Alias('u')][Switch]$Uppercase,
        [Alias('d')][Switch]$Digits,
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
        Uppercase = !$noUppercase
        Digits    = !$noDigits
        symbols   = !$noSymbols
        length    = $length
        counter   = $counter
        site      = "$site"
        login     = "$login"
    }

    if ($Lowercase -or $Uppercase -or $Digits -or $symbols) {
        $profile.Lowercase = $Lowercase
        $profile.Uppercase = $Uppercase
        $profile.Digits = $Digits
        $profile.symbols = $symbols
           
    }
    return $profile
}
