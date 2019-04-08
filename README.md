> ##### ✋ Psst! Create [issue on the lesspass/lesspass](https://github.com/lesspass/lesspass/issues/new) repo as I will [merge](https://github.com/lesspass/lesspass/issues/407) into it.
> 
# Lesspass-powershell

> LessPass open source password manager (powershell implementation)

## Install

```powershell
PS> Install-Module -Name Lesspass
```

## Usage

```powershell
PS> Get-LessPass "site" "login" "masterpassword"
```

**Help**

```powershell
PS> Get-LessPass -?
```


## Test

```make
make test
```