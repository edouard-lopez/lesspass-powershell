function New-Profile {
    param(
        [string]$Site,
        [string]$login,
        [string]$master_password,
        [Alias('l')][Switch]$Lowercase,
        [Alias('u')][Switch]$Uppercase,
        [Alias('d')][Switch]$Digits,
        [Alias('s')][Switch]$Symbols,
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
        Symbols   = !$noSymbols
        length    = $length
        counter   = $counter
        Site      = "$Site"
        login     = "$login"
    }

    if ($Lowercase -or $Uppercase -or $Digits -or $Symbols) {
        $profile.Lowercase = $Lowercase
        $profile.Uppercase = $Uppercase
        $profile.Digits = $Digits
        $profile.Symbols = $Symbols
           
    }
    return $profile
}
