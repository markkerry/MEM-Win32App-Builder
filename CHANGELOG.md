# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [0.1.3] - Released

### Changed

* Changed function output to user making it clearer what is happening
* Published to PowerShell Gallery

## [0.1.2] - Unreleased

### Added

* Pester test `MEM-Win32App-Builder.tests.ps1`

### Changed

* Renamed `output` folder in template to `outputIntuneWin` as was in .gitignore file

### Fixed

* CI.yaml issues
* Git tag version in `Manifest.test.ps1`

## [0.1.1] - Unreleased

### Added

* docs
* Template files

### Changed

* Private function `downloadWin32AppUtil.ps1` to public function `Download-Win32AppUtil.ps1`
* Removed Ubuntu and macOS from GitHub Actions CI

## [0.1.0] - Unreleased

### Added

* Created the module using [Stucco](https://github.com/devblackops/Stucco)
* Created public function `New-MemWin32AppBuild.ps1`
* Created private function `downloadWin32AppUtil.ps1`
* Created Windows Sandbox config for testing
