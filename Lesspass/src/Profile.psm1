function New-Profile {
    param(
        [string]$Site,
        [string]$Login,
        [string]$MasterPassword,
        [Alias('l')][Switch]$Lowercase,
        [Alias('u')][Switch]$Uppercase,
        [Alias('d')][Switch]$Digits,
        [Alias('s')][Switch]$Symbols,
        [Alias('nl')][Switch]$noLowercase,
        [Alias('nu')][Switch]$noUppercase,
        [Alias('nd')][Switch]$noDigits,
        [Alias('ns')][Switch]$noSymbols,
        $Length=16,
        $Counter=1
        # $prompt=$true
    )
    $profile = @{
        Lowercase = !$noLowercase
        Uppercase = !$noUppercase
        Digits    = !$noDigits
        Symbols   = !$noSymbols
        Length    = $Length
        Counter   = $Counter
        Site      = "$Site"
        Login     = "$Login"
    }

    if ($Lowercase -or $Uppercase -or $Digits -or $Symbols) {
        $profile.Lowercase = $Lowercase
        $profile.Uppercase = $Uppercase
        $profile.Digits = $Digits
        $profile.Symbols = $Symbols
           
    }
    return $profile
}
