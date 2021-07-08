# Delete jvm directories
Remove-Item -Recurse -Force (Resolve-Path ~/.jvm)

# Set new path environment variable for user and current terminal process
$userPath = [Environment]::GetEnvironmentVariable("Path","User")
$newPath = ""
foreach ($path in $userPath.split(';')){
    if($path -notlike "*.jvm*"){
        $newPath += $path += ";"
    }
}
[Environment]::SetEnvironmentVariable("Path","$newPath","User")
# [Environment]::SetEnvironmentVariable("Path","$newPath","Process")
Write-Output "completed uninstallation"