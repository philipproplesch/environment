# Update Chocolatey
Invoke-Expression "chocolatey update"

# Update packages
Get-ChildItem -Path (Join-Path "$pwd" "packages") -Filter *.ps1 | ForEach {
    $packages = Invoke-Expression $_.FullName     
    foreach ($package in $packages) {
        Write-Host "Updating $package."
        Invoke-Expression "chocolatey update $package"
    }
}

Write-Host "Finished!"