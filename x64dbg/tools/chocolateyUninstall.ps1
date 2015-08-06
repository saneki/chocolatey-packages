# Currently copied from dnSpy chocolateyUninstall.ps1 script, unsure of a way
# to make this more portable/includable from an external file?
function Remove-CommonProgramsDirectory($path)
{
	if (!$path)
	{
		Write-Error "Unable to remove common programs shortcut, no path provided"
		return
	}

	$commonPrograms = [Environment]::GetFolderPath("CommonPrograms")
	if (!$commonPrograms)
	{
		Write-Error "Unable to remove common programs shortcut, could not get CommonPrograms path"
		return
	}

	$directory = Join-Path -Path "$commonPrograms" -ChildPath "$path"
	if ((Test-Path -Path "$directory") -and `
	([IO.Path]::GetFileName("$directory") -ceq "$path"))
	{
		Remove-Item -Recurse "$directory"
	}
}

# Remove the start menu (common programs) directory
Remove-CommonProgramsDirectory "x64dbg"
