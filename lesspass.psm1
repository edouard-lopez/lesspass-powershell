function Get-LessPass {
    [CmdletBinding()]
    [alias("lesspass")]
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
        $counter=1,
        # $prompt=$true
        [Switch]$version=$false
    )
    process {
        if ($version) {
            (Get-Module Lesspass).Version | Write-Host
            return 
        }
        $Error, $HelpMessage = Confirm-Arguments @PSBoundParameters
        if ($Error) {
            Write-Host $HelpMessage
        }

        
        $x = (New-Profile @PSBoundParameters)
        return GeneratePassword -PasswordProfile $x[0] -MasterPassword $master_password
        # todo: if -Prompt flag is present copy to clipboard
        # todo: request master_password if not provided
        # todo: generate password
        # todo: if -Clipboard flag is present copy to clipboard
    }
    end {
    }

<#
.SYNOPSIS
LessPass - stateless password generator

.LINK
Website: http://lesspass.com/
Github:  https://github.com/lesspass/lesspass/          

.DESCRIPTION
LessPass computes a unique password using a site, login and a master password.
You don't need to sync a password vault across every device because LessPass works offline!

LINUX REQUIREMENT: 
The `xclip` utility must be installed to support the copy to clipboard feature; 
Debian-based platforms such as Ubuntu/Linux Mint, install it with: 

    sudo apt install xclip

.PARAMETER Site
Site used in the password generation (required)

.PARAMETER Login
Login used in the password generation
default to '' if not provided.

.PARAMETER MasterPassword
Master password used in password generation
default to LESSPASS_MASTER_PASSWORD env variable or prompt

.PARAMETER Lowercase
Add lowercase in password

.PARAMETER Uppercase
Add uppercase in password

.PARAMETER Digits
Add digits in password

.PARAMETER Symbols
Add symbols in password

.PARAMETER NoLowercase
Remove lowercase from password

.PARAMETER NoUppercase
Remove uppercase from password

.PARAMETER NoDigits
Remove digits from password

.PARAMETER NoSymbols
Remove symbols from password

.PARAMETER Length
Password length (default: 16)

.PARAMETER Counter
Get a new version for an existing password (default: 1)

# .PARAMETER Prompt
# Interactively prompt SITE and LOGIN (prevent leak to shell history)

# .PARAMETER Clipboard
# Copy generated password to clipboard rather than displaying it.
# Need pbcopy (OSX), xsel or xclip (Linux) or clip (Windows).

# .PARAMETER Version
# lesspass version number

.EXAMPLE
lesspass site login masterpassword --no-symbols

No symbols

.EXAMPLE
lesspass site login masterpassword -L -U -D

No symbols shortcut

.EXAMPLE
lesspass site login masterpassword -D -L8

Only digits and length of 8

# .EXAMPLE # is it applicable to Powershell?
# LESSPASS_MASTER_PASSWORD="masterpassword" lesspass site login

# Master password in env variable
#>
}

Export-ModuleMember -Function Get-LessPass -Alias lesspass
