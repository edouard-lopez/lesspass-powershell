test:
	pwsh -Command 'Invoke-Pester -EnableExit (Get-childItem -Recurse *.test.ps1).fullname'
