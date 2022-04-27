# MEM-Win32App-Builder

![main](https://github.com/markkerry/MEM-Win32App-Builder/actions/workflows/CI.yaml/badge.svg)

![intune](media/Intune.png)

Creates an organised directory structure for building Microsoft Endpoint Manager Win32 Apps

## Overview

Module version 0.1.3 contains IntuneWinAppUtil.exe version 6.2107.52.0

## Installation

PowerShell Gallery download/install

```powershell
Install-Module -Name "MEM-Win32App-Builder"
```

To update the module

```powershell
Update-Module -Name "MEM-Win32App-Builder"
```

## Usage

```powershell
New-MemWin32AppBuild -Name "Sublime-Text-4113" -Path "C:\AppPackages"
```

```powershell
Invoke-DownloadWin32AppUtil -Path "C:\AppPackages"
```

## Example Scripts

Example install, detection and requirements scripts for Win32 apps TBC.
