function Get-SystemCopyCommand() {
    if ($IsWindows -and !(Get-Command "clip.exe" -ErrorAction SilentlyContinue)) {
        throw " * To use the option -C or -Clipboard you need `clip.exe` on Windows."
    }
    if ($IsMacOS -and !(Get-Command "pbcopy" -ErrorAction SilentlyContinue)) {
        throw " * To use the option -C or -Clipboard you need `pbcopy` on OSX."
    }
    if ($IsLinux -and !(Get-Command "xclip" -ErrorAction SilentlyContinue)) {
        throw " * To use the option -C or -Clipboard you need `xclip` on Linux."
    }
}
Export-ModuleMember -Function Get-SystemCopyCommand