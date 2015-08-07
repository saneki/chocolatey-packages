$packageName = 'apktool'
$version = '2.0.1'
$url = 'https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_{0}.jar' `
       -f $version
$checksum = 'dc411df2fd6cdcb5e5efbbd407f45ab80969914c'
$checksumType = 'sha1'
$fileFullPath = Join-Path -Path $env:ChocolateyInstall -ChildPath 'lib' `
              | Join-Path -ChildPath "$packageName" `
              | Join-Path -ChildPath 'tools' `
              | Join-Path -ChildPath ('{0}.jar' -f $packageName)

Get-ChocolateyWebFile -PackageName "$packageName" `
                      -FileFullPath "$fileFullPath" `
                      -Url "$url" `
                      -Checksum "$checksum" `
                      -ChecksumType "$checksumType"
