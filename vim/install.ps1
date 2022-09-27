Invoke-WebRequest 'https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.ps1' -OutFile $env:TEMP\installer.ps1
# Allow to run third-party script
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# install dein package manager
powershell.exe -File $env:TEMP\installer.ps1 $env:USERPROFILE\.dein

# install scoop package manager
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
scoop.exe install ripgrep fzf

$vimrc = "$env:USERPROFILE\nvim\.vimrc"
Copy-Item -Path ..\nvim\init.vim -Destination $vimrc -Force
Write-Host "Add required config to $vimrc"
Write-Host "And :call dein#install()"
Write-Host "dein#install() will be run automatically after you open gvim"
notepad.exe $vimrc