test:
	pwsh -Command 'Get-childItem -Recurse *.test.ps1 | foreach { Invoke-Pester -EnableExit $$_ }'
