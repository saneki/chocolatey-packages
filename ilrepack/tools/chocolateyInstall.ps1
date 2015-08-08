$packageName = 'ilrepack'
$version = '2.0.4'
$url = 'https://www.nuget.org/api/v2/package/ILRepack/{0}' `
       -f $version
$checksum = '4b3c2116b8fcd7980f40ec75cb29f99fec9a9c96'
$checksumType = 'sha1'
$unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType" `
                             -UnzipLocation "$unzipLocation"
