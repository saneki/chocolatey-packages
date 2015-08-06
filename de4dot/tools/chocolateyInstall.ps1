$packageName = 'de4dot'
$buildId = '0k17rd8uyhsh937o'
$url = 'https://ci.appveyor.com/api/buildjobs/{0}/artifacts/de4dot.zip' `
       -f $buildId
$checksum = '2bff89e1cb9e55108ec1499ce8cad1025f046238'
$checksumType = 'sha1'
$unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType" `
                             -UnzipLocation "$unzipLocation"
