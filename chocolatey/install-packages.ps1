# Install Chocolatey
# http://chocolatey.org/
Invoke-Expression ((New-Object Net.WebClient).DownloadString('http://bit.ly/psChocInstall'))

# Install packages
Get-ChildItem -Path ([System.IO.Path]::Combine($PWD, "packages")) -Filter *.ps1 | ForEach {
    $packages = Invoke-Expression $_.FullName     
    foreach ($package in $packages) {
        Invoke-Expression "chocolatey install $package"
    }
}

# Execute post-installation actions
Get-ChildItem -Path ([System.IO.Path]::Combine($PWD, "post")) -Filter *.ps1 | ForEach {
    Invoke-Expression $_.FullName
}