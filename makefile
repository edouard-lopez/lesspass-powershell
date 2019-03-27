test:
	pwsh -Command 'Invoke-Pester -EnableExit (Get-childItem -Recurse *.tests.ps1).fullname'
