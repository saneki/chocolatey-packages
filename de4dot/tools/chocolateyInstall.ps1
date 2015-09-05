$packageName = 'de4dot'
$buildId = 'k1noivvgb93ju9y6'
$url = 'https://ci.appveyor.com/api/buildjobs/{0}/artifacts/de4dot.zip' `
       -f $buildId
$checksum = '67d2e6223084b910755d1cea55705ea253d9d3b2'
$checksumType = 'sha1'
$unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType" `
                             -UnzipLocation "$unzipLocation"
