> ##### ✋ Psst! Create [issue on the lesspass/lesspass](https://github.com/lesspass/lesspass/issues/new) repo as I will [merge](https://github.com/lesspass/lesspass/issues/407) into it.
 
# Lesspass-powershell [![Build Status](https://travis-ci.org/edouard-lopez/lesspass-powershell.svg?branch=master)](https://travis-ci.org/edouard-lopez/lesspass-powershell)

> LessPass computes the same password given the same a `Site`, `Login` and a `master password`
>
> Privacy by default, Works offline, No sync, Visual fingerprint :closed_lock_with_key::heart::eyes:

## Install

```powershell
PS> Install-Module -Name Lesspass
```

## Usage

```powershell
PS> Get-LessPass "Site" "Login" "masterpassword"
```

#### Help

```powershell
PS> Get-LessPass -?
```

#### Syntax

```powershell
Get-LessPass
    -Site <String>
    -Login <String>
    -MasterPassword <String>

    [-Lowercase]
    [-Uppercase]
    [-Digits]
    [-Symbols]
    [-noLowercase]
    [-noUppercase]
    [-noDigits]
    [-noSymbols]
    [[-Length] <Object>]
    [[-Counter] <Object>]

    [-version]
    [<CommonParameters>]
```

## Test

```make
make test
```
