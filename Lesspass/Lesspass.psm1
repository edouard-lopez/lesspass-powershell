function Get-LessPass {
    [CmdletBinding()]
    [alias("lesspass")]
    param(
        [string]$Site,
        [string]$Login,
        [string][Parameter(Mandatory=$true)]$master_password,
        [Alias('l')][Switch]$Lowercase,
        [Alias('u')][Switch]$Uppercase,
        [Alias('d')][Switch]$Digits,
        [Alias('s')][Switch]$Symbols,
        [Alias('nl')][Switch]$noLowercase,
        [Alias('nu')][Switch]$noUppercase,
        [Alias('nd')][Switch]$noDigits,
        [Alias('ns')][Switch]$noSymbols,
        [ValidateRange(5, 35)]$Length=16,
        $Counter=1,
        # $prompt,
        # $Clipboard,
        [Switch]$version
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

        
        $PasswordProfile = New-Profile @PSBoundParameters
        
        return GeneratePassword $PasswordProfile $master_password
        # todo: if -Prompt flag is present copy to clipboard
        # todo: request master_password if not provided
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
LessPass computes a unique password using a Site, Login and a master password.
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
Add Lowercase in password

.PARAMETER Uppercase
Add Uppercase in password

.PARAMETER Digits
Add Digits in password

.PARAMETER Symbols
Add Symbols in password

.PARAMETER NoLowercase
Remove Lowercase from password

.PARAMETER NoUppercase
Remove Uppercase from password

.PARAMETER NoDigits
Remove Digits from password

.PARAMETER NoSymbols
Remove Symbols from password

.PARAMETER Length
Password Length (default: 16)

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
lesspass Site Login masterpassword -noSymbols

No Symbols

.EXAMPLE
lesspass Site Login masterpassword -L -U -D

No Symbols shortcut

.EXAMPLE
lesspass Site Login masterpassword -D -L 8

Only Digits and Length of 8

# .EXAMPLE # is it applicable to Powershell?
# LESSPASS_MASTER_PASSWORD="masterpassword" lesspass Site Login

# Master password in env variable
#>
}

Export-ModuleMember -Function Get-LessPass -Alias lesspass
