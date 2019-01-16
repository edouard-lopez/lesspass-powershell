function Get-SystemCopyCommand {
    if ($IsWindows) { Get-Command "clip.exe" -ErrorAction SilentlyContinue }
    if ($IsMacOS)   { Get-Command "pbcopy" -ErrorAction SilentlyContinue }
    if ($IsLinux)   { Get-Command "xclip" -ErrorAction SilentlyContinue }
}

Export-ModuleMember -Function Get-SystemCopyCommand