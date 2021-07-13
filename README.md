# `jvm` (Java Version Manager)

A simple command line tool for installing and switching between JDK versions.

## Prerequisites

It is recommended that you uninstall any previously installed versions of Java before using this tool. Failure to do so will result in the inability to conveniently switch versions.

## Installation

### Unix/Linux Machines

Navigate to `./platforms/linux/bin` and run `install.sh` to set up `jvm` automatically. Restart your terminal afterwards, or type `source ~/.bashrc` to refresh it.

---

### Windows Machines

Navigate to `./platforms/windows/bin` and run `uninstall.ps1` in Powershell to set up `jvm` automatically. Environment variables are already added to the terminal during installation, so there is no need to restart Powershell.



## Uninstalling

Please note that uninstalling `jvm` will cause the `java` and `javac` commands to become unrecognized by your shell. You will need to manually configure your environment once more. Additionally, you will need to provide the JDK binaries yourself as the uninstallation process will remove all JDKs installed with this tool.

### Unix/Linux Machines

Navigate to `./platforms/windows/bin` and run `uninstall.sh` to uninstall everything related to `jvm`, including all installed JDKs.

---

### Windows Machines

Navigate to `./platforms/windows/bin` and run `uninstall.ps1` in Powershell to uninstall everything related to `jvm`, including all installed JDKs. 

---
## Usage
- Installing the latest version of Java (v16): `jvm install latest`
- Installing a specific version of Java: `jvm install #` (e.g. `jvm install 8`)
> Note, this command will not automatically set your version to the newly installed version. That needs to be done in the next step.
- Switch to another installed version: `jvm use #` (e.g. `jvm use 8`)

## Attribution
- The compressed binaries for Java v9 to Java v16 are provided by [OpenJDK](https://openjdk.java.net/)
- The Java v8 compressed binaries for linux are provided by the developer of this tool, which was originally sourced from OpenJDK.

## Platform Support
- Ubuntu v19 and v20 (suspected to be compatible will all Linux distributions)
- Windows 10
- Windows Server 2019

## Limitations
- No support for Java v10 on Windows
- No support for Java v7 or below
- Does not work correctly with Git Bash for Windows
