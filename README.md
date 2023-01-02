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
- Installing the latest version of Java (v19): `jvm install latest`
- Installing a specific version of Java: `jvm install #` (e.g. `jvm install 8`)
> Note, this command will not automatically set your version to the newly installed version. That needs to be done in the next step.
- List all installed version: `jvm list`
- Switch to another installed version: `jvm use #` (e.g. `jvm use 8`)

## Attribution
- The compressed binaries for Java v8 to Java v19 are provided by [OpenJDK](https://openjdk.java.net/)

## Platform Support
- Ubuntu v22 (suspected to be compatible will all Linux distributions)
- Windows 11
- Windows Server 2022

## Limitations
- No support for Java v10 on Windows (due to licence agreements)
- No support for Java v7 or below
- Does not work correctly with Git Bash for Windows
