﻿$packageName = 'dnspy'
$version = '1.3.44445.0'
$url = 'https://github.com/0xd4d/dnSpy/releases/download/v{0}/dnSpy-v{0}.zip' `
       -f $version
$checksum = 'd6db15ded6a1d068644c80325d909d90821338bb'
$checksumType = 'sha1'
$unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

function Install-CommonProgramsShortcut($file, $path='')
{
	if (!$file)
	{
		Write-Error "Unable to install common programs shortcut, no file provided"
		return
	}

	$commonPrograms = [Environment]::GetFolderPath([Environment+SpecialFolder]::Programs)
	if (!$commonPrograms)
	{
		Write-Error "Unable to install common programs shortcut, could not get Programs path"
		return
	}

	$fileLnk = [IO.Path]::GetFileNameWithoutExtension($file) + '.lnk'
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

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType" `
                             -UnzipLocation "$unzipLocation"

# dnSpy currently has no installer executable, so install start menu
# (common programs) shortcuts
Install-CommonProgramsShortcut -Path 'dnSpy' -File 'dnSpy.exe'
Install-CommonProgramsShortcut -Path 'dnSpy' -File 'dnSpy-x86.exe'
