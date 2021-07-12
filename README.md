# `jvm` (Java Version Manager)

A simple command line tool for installing and switching between Java versions.

## Prerequisites

It is recommended that you uninstall any previously installed versions of Java before using this tool. Failure to do so will result in the inability to conveniently switch versions.

## Installation
Linux:
- Run install.sh to set up JVM automatically. Restart your terminal afterwards, or type `source ~/.bashrc` to refresh it.
Windows:
- Run install.ps1 in Powershell to set up JVM automatically. Environment variables are already added to the terminal during installation, so there is no need to restart Powershell.
## Uninstalling
Linux:
- Run uninstall.sh to uninstall everything related to JVM. 
> Note this will break your `java` and `javac` commands, you will need to set them manually once more.
Windows:
- Run uninstall.ps1 in Powershell to uninstall everything related to JVM, including all installed versions of Java. 
> Note: this will break your `java` and `javac` commands, you will need to set them manually and reinstall them as the uninstallation process will remove all java versions installed with this tool.

## Usage
- Installing the latest version of Java (v16): `jvm install latest`
- Installing a specific version of Java: `jvm install #` (e.g. `jvm install 8`)
> Note, this command will not automatically set your version to the newly installed version. That needs to be done in the next step.
- Switch to another installed version: `jvm use #` (e.g. `jvm use 8`)

## Attribution
- The compressed binaries for Java v9 to Java v16 are provided by [OpenJDK](https://openjdk.java.net/)

## Limitations
- Known to work on Ubuntu 19 and 20. Should work on any Linux distribution.
- Windows version 10 and Windows server 2019
- The Java v8 compressed binaries for linux are provided by the developer of this tool. 
- Java 10 for windows is not currently available
- No support for Java v7 or below
