$packageName = 'x64dbg'
$mirror = 'iweb'
$snapshotDate = '2015-07-14_02-09'
$url = 'http://{0}.dl.sourceforge.net/project/x64dbg/snapshots/snapshot_{1}.7z' `
       -f $mirror, $snapshotDate
$checksum = '09e2864088ba2c19e1d6dd82231e3b8049611f02'
$checksumType = 'sha1'
$unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType" `
                             -UnzipLocation "$unzipLocation"
