# Copies the latest screenshot from its folder to the assets of this site

# Define your source and destination paths
$sourcePath      = $env:USERPROFILE + "\OneDrive\Pictures\Screenshots 1"
$destinationPath = $env:USERPROFILE + "\source\repos\pgsitarz\pgsitarz.github.io\assets"

# Get the latest PNG file from the specific source folder
$latestPng = Get-ChildItem -Path $sourcePath -Filter *.png | 
             Sort-Object LastWriteTime | 
             Select-Object -Last 1

# If a file was found, copy it to the destination
if ($latestPng) {
    Copy-Item -Path $latestPng.FullName -Destination $destinationPath -Verbose
    Write-Host "Successfully copied $($latestPng.Name) to $destinationPath" -ForegroundColor Green
} else {
    Write-Warning "No .png files found in $sourcePath"
}