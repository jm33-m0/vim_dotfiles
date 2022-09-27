Invoke-WebRequest 'https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.ps1' -OutFile $env:TEMP\installer.ps1
# Allow to run third-party script
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# install dein package manager
powershell.exe -File "$env:TEMP\installer.ps1" "$env:USERPROFILE\.dein"


$nvimrc = "$env:LOCALAPPDATA\nvim\init.vim"
$gnvimrc = "$env:LOCALAPPDATA\nvim\ginit.vim"
Copy-Item -Path .\init.vim -Destination $nvimrc -Force
Copy-Item -Path .\win\ginit.vim -Destination $gnvimrc -Force
Write-Host "Add required config to $nvimrc"
Write-Host "And :call dein#install()"
notepad.exe $nvimrc
