$packageName = 'confuserex'
$version = '1.0.0'
$url = 'https://github.com/yck1509/ConfuserEx/releases/download/v{0}/ConfuserEx_bin.zip' `
       -f $version
$unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$unzipLocation"
