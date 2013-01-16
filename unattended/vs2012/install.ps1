# http://powershell.com/cs/blogs/tips/archive/2009/05/07/finding-cd-rom-drives.aspx
function Get-IsoDrive {
  Get-WmiObject win32_logicaldisk -Filter 'DriveType=5' | ForEach-Object { 
    if($_.VolumeName.StartsWith('VS2012')) {
      return $_.DeviceID
    }
  }
}

$installer = (Get-ChildItem (Get-IsoDrive) -Filter 'vs_*.exe').FullName
$script = Join-Path $PWD 'VS2012_AdminDeployment.xml'

#Start-Process $installer -ArgumentList "/adminfile $script /quiet /norestart"
Start-Process $installer -ArgumentList "/adminfile $script /norestart"