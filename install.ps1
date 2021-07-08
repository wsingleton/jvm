# Direct copy from shell script
# Create application directories if they do not exist
if(-not (Test-Path ~\.jvm)) {
    mkdir ~\.jvm
    mkdir ~\.jvm\bin
    mkdir ~\.jvm\current
    mkdir ~\.jvm\installed-versions
    mkdir ~\.jvm\tmp
}
# Copy jvm file to created bin directory and make it an executable
Copy-Item .\jvm.ps1 ~\.jvm\bin\jvm.ps1

# change file ACL permissions for user
$acl = Get-Acl .\jvm.ps1
$AccessRule = New-Object System.Security.AccessControl.fileSystemAccessRule($env:UserName, "ReadAndExecute", "Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl ~\.jvm

# Set the environment Path variable to add in the new .jvm bin directory
[Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path","User") + ";"+(Resolve-Path ~\.jvm\bin) + (Resolve-Path ~\.jvm\current), "User")
[Environment]::SetEnvironmentVariable("Path",[Environment]::GetEnvironmentVariable("Path","User") + ";"+(Resolve-Path ~\.jvm\bin), "Process")
Write-Output 'finished installing'