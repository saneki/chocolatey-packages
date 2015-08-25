$packageName = 'toxy'
$jobId = '442'
$url = 'https://jenkins.impy.me/job/Toxy%20x86/{0}/artifact/toxy_x86.zip' `
       -f $jobId
$checksum = '46ef0e1fbbfd9f8702951dd30b04ca7d23a90ebc'
$checksumType = 'sha1'
$unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType" `
                             -UnzipLocation "$unzipLocation"
