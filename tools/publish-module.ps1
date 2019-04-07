param($ProjectDirectory,$PSGALLERY_API_KEY)

$Env:PSModulePath = $Env:PSModulePath + ":$ProjectDirectory"
Publish-Module `
    -Name "Lesspass" `
    -Repository "PSGallery" `
    -NuGetApiKey $Env:PSGALLERY_API_KEY
