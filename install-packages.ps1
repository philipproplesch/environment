# Install Chocolatey
# http://chocolatey.org/
Invoke-Expression ((New-Object Net.WebClient).DownloadString('http://bit.ly/psChocInstall'))

# Install packages
Get-ChildItem -Path (Join-Path "$pwd" "packages") -Filter *.ps1 | ForEach {
    $packages = Invoke-Expression $_.FullName     
    foreach ($package in $packages) {
        Invoke-Expression "chocolatey install $package"
    }
}

# Execute post-installation actions
Get-ChildItem -Path (Join-Path "$pwd" "post") -Filter *.ps1 | ForEach {
    Invoke-Expression $_.FullName
}