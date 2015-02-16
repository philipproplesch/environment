# http://allen-mack.blogspot.de/2008/03/replace-visual-studio-command-prompt.html

$vsRegKey = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\VisualStudio\SxS\VS7"
$vsLocation = $vsRegKey.PSObject.Properties["12.0"].Value

Push-Location (Join-Path $vsLocation "VC")

cmd /c "vcvarsall.bat&set" | foreach {
  if ($_ -match "=") {
    $v = $_.split("=")
    Set-Item -Force -Path "ENV:\$($v[0])" -Value "$($v[1])"
  }
}

Pop-Location
