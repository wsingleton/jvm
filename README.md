# `jvm` (Java Version Manager)

A simple command line tool for installing and switching between Java versions.

## Prerequisites

It is recommended that you uninstall any previously installed versions of Java before using this tool. Failure to do so will result in the inability to conveniently switch versions.

## Installation

Run install.sh to set up JVM automatically. Restart your terminal afterwards, or type `source ~/.bashrc` to refresh it.

## Uninstalling

Run uninstall.sh to uninstall everything related to JVM. Note this will break your `java` and `javac` commands, you will need to set them manually once more.

## Usage
- Installing the latest version of Java (v16): `jvm install latest`
- Installing a specific version of Java: `jvm install #` (e.g. `jvm install 8`)
- Switch to another installed version: `jvm use #` (e.g. `jvm use 8`)

## Attribution
- The compressed binaries for Java v9 to Java v16 are provided by [OpenJDK](https://openjdk.java.net/)

## Limitations
- Only known to work on Ubuntu 20.04.2 LTS
- The Java v8 compressed binaries are provided by the developer of this tool. 
- Windows version 10 and Windows server 2019
- Java 10 for windows is not currently available