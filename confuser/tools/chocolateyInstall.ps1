$packageName = 'confuser'
$url = 'https://confuser.codeplex.com/downloads/get/404433'
$unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$unzipLocation"
