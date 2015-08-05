$packageName = 'de4dot'
$buildId = 'TODO'
$url = 'https://ci.appveyor.com/api/buildjobs/{0}/artifacts/de4dot.zip' `
       -f $buildId
$checksum = 'TODO'
$checksumType = 'sha1'
$unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType" `
                             -UnzipLocation "$unzipLocation"
