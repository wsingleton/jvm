# Delete jvm directories
Remove-Item -Recurse -Force (Resolve-Path ~/.jvm)

<#
    Will Take User, Process, or Machine for removing the .jvm directories out of the 
        Path variables. The terminal process is also done here to keep it in sync with
        the user.
#>
function Remove-PathVariables() {
    param (
        $userOrProcess
    )
    $oldPath = [Environment]::GetEnvironmentVariable("Path",$userOrProcess)
    $newPath = ""
    foreach ($path in $oldPath.split(';')){
        if($path -notlike "*.jvm*"){
            $newPath += $path += ";"
        }
    }
    [Environment]::SetEnvironmentVariable("Path","$newPath",$userOrProcess)
}

# Set new path environment variable for user and current terminal process
Remove-PathVariables "User"
Remove-PathVariables "Process"

Write-Output "completed uninstallation"