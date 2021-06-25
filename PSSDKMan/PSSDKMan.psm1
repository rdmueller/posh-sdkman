﻿<#
posh-gvm / POwerSHell Groovy enVironment Manager

https://github.com/flofreud/posh-gvm

Needed:
- Powershell 3.0 (For Windows 7 install Windows Management Framework 3.0)
#>

#region Config
if ( !(Test-Path Variable:Global:PGVM_DIR) ) {
	$Global:PSDK_DIR = "$env:USERPROFILE\.posh_gvm"
}
if ( !(Test-Path Variable:Global:PGVM_AUTO_ANSWER) ) {
	$Global:PSDK_AUTO_ANSWER = $false
}
if ( !(Test-Path Variable:Global:PGVM_AUTO_SELFUPDATE) ) {
	$Global:PSDK_AUTO_SELFUPDATE = $false
}

$Script:PGVM_INIT = $false
$Script:PSDK_SERVICE = 'https://api.sdkman.io/2'
$Script:PGVM_BROADCAST_SERVICE = $Script:PSDK_SERVICE
$Script:GVM_BASE_VERSION = '1.3.13'

$Script:PSDK_CANDIDATES_PATH = "$Global:PSDK_DIR\.meta\candidates.txt"
$Script:PSDK_BROADCAST_PATH = "$Global:PSDK_DIR\.meta\broadcast.txt"
$Script:PSDK_API_VERSION_PATH = "$Global:PSDK_DIR\.meta\version.txt"
$Script:PSDK_ARCHIVES_PATH = "$Global:PSDK_DIR\.meta\archives"
$Script:PSDK_TEMP_PATH = "$Global:PSDK_DIR\.meta\tmp"

$Script:PSDK_API_NEW_VERSION = $false
$Script:PSDK_NEW_VERSION = $false
$Script:PSDK_VERSION_PATH = "$psScriptRoot\VERSION.txt"
$Script:PSDK_VERSION_SERVICE = "https://raw.githubusercontent.com/flofreud/posh-gvm/master/VERSION.txt"

$Script:PSDK_AVAILABLE = $true
$Script:PSDK_ONLINE = $true
$Script:SDK_FORCE_OFFLINE = $false
$Script:SDK_CANDIDATES = $null
$Script:FIRST_RUN = $true

$Script:UNZIP_ON_PATH = $false
#endregion

Push-Location $psScriptRoot
. .\Utils.ps1
. .\Commands.ps1
. .\Init.ps1
. .\TabExpansion.ps1
Pop-Location

Init-Posh-SDK

Export-ModuleMember 'gvm'
