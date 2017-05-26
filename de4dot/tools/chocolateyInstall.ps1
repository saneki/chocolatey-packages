$packageName = 'de4dot'
$buildId = '8ej2vtftstr9v4yw'
$url = 'https://ci.appveyor.com/api/buildjobs/{0}/artifacts/de4dot.zip' `
       -f $buildId
$unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$unzipLocation"
