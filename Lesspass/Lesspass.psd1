@{

# Script module or binary module file associated with this manifest.
RootModule = 'Lesspass.psm1'

# Version number of this module.
ModuleVersion = '1.0.4'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = '9f32668d-508f-4640-bbdc-cdd4adbc4237'

# Author of this module
Author = 'Édouard Lopez, Alban Lopez'

# Company or vendor of this module
CompanyName = 'LessPass'

# Copyright statement for this module
Copyright = 'MIT'

# Description of the functionality provided by this module
Description = 'LessPass: Stateless Password Manager'

# Minimum version of the PowerShell engine required by this module
PowerShellVersion = '5.0'

# Name of the PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @(
    'src/Clipboard.psm1', 
    'src/Password.psm1', 
    'src/Profile.psm1', 
    'src/Validator.psm1'
)

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'Get-LessPass'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
# VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = 'lesspass'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @('Profile.psm1','Validator.psm1','Clipboard.psm1')

# List of all files packaged with this module
FileList =  'Lesspass.psd1', 
            'Lesspass.psm1', 
            'src/Clipboard.psm1', 
            'src/Clipboard.tests.ps1', 
            'src/Password.psm1', 
            'src/Password.tests.ps1', 
            'src/Profile.psm1', 
            'src/Profile.tests.ps1', 
            'src/Validator.psm1', 
            'src/Validator.tests.ps1'

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('Password', 'PasswordGenerator', 'PasswordManager', 'lesspass')

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/edouard-lopez/lesspass-powershell/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/edouard-lopez/lesspass-powershell'

        # A URL to an icon representing this module.
        IconUri = 'https://github.com/lesspass/lesspass/raw/master/packages/lesspass-web-extension/extension/icons/icon-128x128.png'

        # ReleaseNotes of this module
        ReleaseNotes = '-'

        # External dependent modules of this module
        ExternalModuleDependencies = 'ClipboardText'

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

