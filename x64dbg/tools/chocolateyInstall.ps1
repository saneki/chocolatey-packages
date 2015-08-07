﻿$packageName = 'x64dbg'
$mirror = 'iweb'
$snapshotDate = '2015-07-14_02-09'
$url = 'http://{0}.dl.sourceforge.net/project/x64dbg/snapshots/snapshot_{1}.7z' `
       -f $mirror, $snapshotDate
$checksum = '09e2864088ba2c19e1d6dd82231e3b8049611f02'
$checksumType = 'sha1'
$unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Currently copied from dnSpy chocolateyInstall.ps1 script, unsure of a way
# to make this more portable/includable from an external file?
function Install-CommonProgramsShortcut($file, $path='')
{
	if (!$file)
	{
		Write-Error 'Unable to install common programs shortcut, no file provided'
		return
	}

	$commonPrograms = [Environment]::GetFolderPath("CommonPrograms")
	if (!$commonPrograms)
	{
		Write-Error 'Unable to install common programs shortcut, could not get CommonPrograms path'
		return
	}

	$fileLnk = [IO.Path]::GetFileNameWithoutExtension($file) + '.lnk'
	$fileLnk = [IO.Path]::GetFileName($fileLnk)
	$targetPath = Join-Path -Path "$unzipLocation" -ChildPath "$file"
	$shortcutPath = Join-Path -Path "$commonPrograms" -ChildPath "$path" `
	              | Join-Path -ChildPath "$fileLnk"

	# Create shortcut directory if it doesn't exist
	$shortcutDir = [IO.Path]::GetDirectoryName($shortcutPath)
	if (!(Test-Path -Path "$shortcutDir"))
	{
		New-Item -ItemType "directory" -Path "$shortcutDir"
	}

	Install-ChocolateyShortcut -ShortcutFilePath "$shortcutPath" `
	                           -TargetPath "$targetPath"
}

function Get-X64DbgExecutablePath($x)
{
	if (!$x)
	{
		Write-Error 'No parameter provided'
		return
	}

	return Join-Path -Path 'release' -ChildPath "$x" `
	     | Join-Path -ChildPath ('{0}dbg.exe' -f $x)
}

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType" `
                             -UnzipLocation "$unzipLocation"

# Install common programs shortcuts for x32dbg.exe, x64dbg.exe
$x32Path = Get-X64DbgExecutablePath 'x32'
$x64Path = Get-X64DbgExecutablePath 'x64'
Install-CommonProgramsShortcut -Path 'x64dbg' -File "$x32Path"
Install-CommonProgramsShortcut -Path 'x64dbg' -File "$x64Path"