$packageName = 'dnspy'
$version = '1.1.2.1'
$url = 'https://github.com/0xd4d/dnSpy/releases/download/v{0}/dnSpy-v{0}.zip' `
       -f $version
$checksum = 'd6b1df754fcd640fb526ea2875caf6fe9a4d1199'
$checksumType = 'sha1'
$unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType" `
                             -UnzipLocation "$unzipLocation"
