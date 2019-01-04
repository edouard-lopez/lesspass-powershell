function New-Profile([string]$site='',[string]$login='')
{
    [PSCustomObject]@{
      lowercase = 1
      uppercase = 1
      digits = 1
      symbols = 1
      length = 16
      counter = 1
      site = 1
      login = 1
    }
}
