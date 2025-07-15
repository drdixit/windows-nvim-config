
# Windows Neovim Configuration
clone to `~/.config/windows-nvim-config`
## 🛠️ Set Environment Variables Permanently (User Scope)
Open Command Prompt or PowerShell (no admin rights needed) and run:
```powershell
setx HOME "%USERPROFILE%"
setx XDG_CONFIG_HOME "%USERPROFILE%\.config"
setx XDG_DATA_HOME "%USERPROFILE%\.local\share"
setx XDG_STATE_HOME "%USERPROFILE%\.local\state"
setx XDG_CACHE_HOME "%USERPROFILE%\.cache"
setx NVIM_APPNAME windows-nvim-config
```

Don't Set this it's casing some problems
```powershell
setx XDG_RUNTIME_DIR "%TEMP%\nvim"
```

## 🛡️ Set Environment Variables Permanently (System-Wide) (Not Recommended its just for my reference)
"**/M** set system wide"<br>
To apply variables for all users, run Command Prompt or PowerShell as Administrator and add the /M flag:
```
setx HOME "%USERPROFILE%" /M
setx XDG_CONFIG_HOME "%USERPROFILE%\.config" /M
setx XDG_DATA_HOME "%USERPROFILE%\.local\share" /M
setx XDG_STATE_HOME "%USERPROFILE%\.local\state" /M
setx XDG_CACHE_HOME "%USERPROFILE%\.cache" /M
setx NVIM_APPNAME windows-nvim-config /M
```

Don't Set this it's casing some problems
```powershell
setx XDG_RUNTIME_DIR "%TEMP%\nvim" /M
```

# 🧹 Remove Environment Variables
To remove a variable, set its value to an empty string:
```
setx XDG_CONFIG_HOME ""
```
Note: This removes the variable from future sessions but doesn't affect the current session.
