# Convenience variable to hold reference to location of primary jvm directory
$jvm= Resolve-Path ~\.jvm

#
# Prints a provided message to stderr and exits the script
#
# Arguments:
#    $1 = error message to be printed
#
function Exit-Error {
    Write-Error "$1"
    exit 1
}

#
# Attempts to install the specified version of Java using the provided link. If the
# specified version is already installed, it will not be reinstalled and the user
# will be notified. 
#
# Arguments:
#    $1 = version of Java to be downloaded
#    $2 = JDK download link (should provide a tarball)
#
function Install-JDK {
    version=$1
    downloadLink=$2
    $versionDir ="$jvm\installed-versions\open-jdk-$version"
    
    
    Write-Output "jvm: Attempting to install Java v$version..."
    
    if (Test-Path $versionDir){
        Write-Output "jvm: Java $version is already installed! Type 'jvm use $version' to switch to it!"
    } else {
        $zipped = "$jvm\tmp\openjdk-$version.zip"
        Invoke-WebRequest $downloadLink -OutFile $zipped -ErrorAction Exit-Error "Failed to download JDK zip from $downloadLink! Aborting installation!"
        $extracted = (Expand-Archive -Path $zipped -DestinationPath $jvm + "tmp" -ErrorAction Exit-Error "Failed to unzip JDK tarball! Aborting installation!")
        mkdir $versionDir
        Copy-Item -Recurse -Force $extracted\* $versionDir
        Remove-Item -Recurse -Force $extracted
        Remove-Item $zipped
        Write-Output "jvm: Java v$version installed!"
        
    }
}

#
# Attempts to change the currently used version of Java. If the targeted Java version
# is installed, then it will be used. If the targeted Java version is not installed,
# the user will be notified to install it first.
# 
# Arguments:
#    $1 = target version of Java to switch to
#
function Set-JDK {
    
    $currentDir = "$jvm\current"
    $desiredVersion = "$jvm \installed-versions\open-jdk-$1"
    if (Resolve-Path $desiredVersion){
        Remove-Item -Recurse -Force "$currentDir\*"
        Copy-Item -Recurse -Force "$desiredVersion\*" "$currentDir\"
        Write-Output "jvm: Switched to Java v$1"
    } else {
        Write-Output "jvm: You do not appear to have Java v$1 installed! Try running 'jvm install $1' first!"
    }
    
}

#
# Primary script logic
#
# Determines what command was given to the jvm invocation: install, use, uninstall, and if 
# none of these then usage information will be displayed.
# 
# Arguments:
#    $1 = provided command
#    $2 = specified Java version
#
$cmd=$1
$javaVersion=$2

switch ($cmd) {
    install {
        switch ($javaVersion){
            16 {
                Install-JDK 16 https://download.java.net/openjdk/jdk16/ri/openjdk-16+36_windows-x64_bin.zip
            }
            15 {
                Install-JDK 15 https://download.java.net/openjdk/jdk15/ri/openjdk-15+36_windows-x64_bin.zip
            }
            14 {
                Install-JDK 14 https://download.java.net/openjdk/jdk14/ri/openjdk-14+36_windows-x64_bin.zip
            }
            13 {
                Install-JDK 13 https://download.java.net/openjdk/jdk13/ri/openjdk-13+33_windows-x64_bin.zip
            }
            12 {
                Install-JDK 12 https://download.java.net/openjdk/jdk12/ri/openjdk-12+32_windows-x64_bin.zip
            }
            11 {
                Install-JDK 11 https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_windows-x64_bin.zip
            }
            10 {
                # Seems to be an issue with getting 
                Write-Output "jvm: JDK 10 is not currently supported"
            }
            9 {
                Install-JDK 9 https://download.java.net/openjdk/jdk9/ri/jdk-9+181_windows-x64_ri.zip
            }
            8 {
                Install-JDK 8 https://download.java.net/openjdk/jdk8u41/ri/openjdk-8u41-b04-windows-i586-14_jan_2020.zip
            }
            {$_ -lt 8} {
                Write-Output "jvm: No support for Java version 7 and below"
            }
            Default {
                Write-Output "jvm: Unknown version specified"
            }
        }
    }
    use {
        switch ($javaVersion) {
            16 {
                Set-JDK 16
            }
            15 {
                Set-JDK 15
            }
            14 {
                Set-JDK 14
            }
            13 {
                Set-JDK 13
            }
            12 {
                Set-JDK 12
            }
            11 {
                Set-JDK 11
            }
            10 {
                Set-JDK 10
            }
            9 {
                Set-JDK 9
            }
            8 {
                Set-JDK 8
            }
            {$_ -lt 8} {
                Write-Output "jvm: No support for Java version 7 and below"
            }
            Default {
                Write-Output "jvm: Unknown version specified"
            }
        }
    }
    uninstall {
        switch($javaVersion){
        {$_ -lt 17 -And $_ -gt 7} {
            Remove-Item -Recurse -Force "$jvm\installed-versions\open-jdk-$_"
        }
        {$_ -lt 8} {
            Write-Output "jvm: No support for Java version 7 and below"
        }
        Default {
            Write-Output "jvm: Unknown version specified"
        }
    }
}
    Default {
        Write-Output "usage: jvm [command] [version]\n\nCommands: use, install, uninstall"
    }
}
