.PHONY: test
test:
	pwsh -Command 'Invoke-Pester -EnableExit (Get-childItem -Recurse *.tests.ps1).fullname'

.PHONY: publish
publish:
	pwsh -File ./tools/publish-module.ps1 "$$(pwd)" "${PSGALLERY_API_KEY}"
