# `jvm` (Java Version Manager)

A simple command line tool for installing and switching between JDK versions.

## Prerequisites

It is recommended that you uninstall any previously installed versions of Java before using this tool. Failure to do so will result in the inability to conveniently switch versions.

## Installation

### Unix/Linux Machines

Navigate to `./platforms/linux/bin` and run `install.sh` to set up JVM automatically. Restart your terminal afterwards, or type `source ~/.bashrc` to refresh it.

---

### Windows Machines

Installation instructions for Windows machines coming soon!



## Uninstalling

### Unix/Linux Machines

Run uninstall.sh to uninstall everything related to JVM. Note this will break your `java` and `javac` commands, you will need to set them manually once more.

---

### Windows Machines

JVM removal instructions for Windows machines coming soon!

## Usage
- Installing the latest version of Java (v16): `jvm install latest`
- Installing a specific version of Java: `jvm install #` (e.g. `jvm install 8`)
- Switch to another installed version: `jvm use #` (e.g. `jvm use 8`)

## Attribution
- The compressed binaries for Java v9 to Java v16 are provided by [OpenJDK](https://openjdk.java.net/)

## Platform Support
- Ubuntu v19 and v20 (suspected to be compatible will all Linux distributions)
- Windows 10
- Windows Server 2019

## Limitations
- The Java v8 compressed binaries are provided by the developer of this tool. 
- Java 10 for Windows 10 is not currently available
- No support for Java v7 or below on any platforms
