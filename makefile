test:
	pwsh -Command 'dir -Recurse *.test.ps1 | foreach { Invoke-Pester $_ }'
