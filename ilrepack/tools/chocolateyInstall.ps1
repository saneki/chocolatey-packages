$packageName = 'ilrepack'
$version = '2.0.10'
$url = 'https://www.nuget.org/api/v2/package/ILRepack/{0}' `
       -f $version
$unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$unzipLocation"
