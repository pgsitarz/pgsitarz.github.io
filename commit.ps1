$ErrorActionPreference = "Stop"

Write-Host 'Pushing changes to Git for my app!';

$dir = $env:USERPROFILE + "\source\repos\pgsitarz\pgsitarz.github.io\"
Set-Location $dir

Write-Output '';
Write-Output 'Adding locally...'
git add .

Write-Output '';
Write-Output "Committing locally..."
git commit -m 'Scripted commit'

Write-Output '';
Write-Host 'Finished!';
Start-Sleep -Seconds 1