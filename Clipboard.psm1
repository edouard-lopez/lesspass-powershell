function Get-SystemCopyCommand {
    if ($IsWindows -and !(Get-Command "clip.exe" -ErrorAction SilentlyContinue)) {
        throw " * To use the option -c (--copy) you need clip.exe on Windows"
    }
    if ($IsMacOS -and !(Get-Command "pbcopy" -ErrorAction SilentlyContinue)) {
        throw " * To use the option -c (--copy) you need pbcopy on OSX"
    }
    if ($IsLinux -and !(Get-Command "xclip" -ErrorAction SilentlyContinue)) {
        throw " * To use the option -c (--copy) you need xsel or xclip on Linux"
    }
}

Export-ModuleMember -Function Get-SystemCopyCommand