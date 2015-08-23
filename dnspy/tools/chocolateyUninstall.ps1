function Remove-CommonProgramsDirectory($path)
{
	if (!$path)
	{
		Write-Error "Unable to remove common programs shortcut, no path provided"
		return
	}

	$commonPrograms = [Environment]::GetFolderPath([Environment+SpecialFolder]::Programs)
	if (!$commonPrograms)
	{
		Write-Error "Unable to remove common programs shortcut, could not get Programs path"
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
Remove-CommonProgramsDirectory "dnSpy"
