$dir = [System.IO.Path]::GetDirectoryName($PROFILE)

Push-Location $dir

Get-ChildItem $dir\scripts\*.ps1 | % {
  . $_
}

# Load posh-git & posh-hg
. "$dir\posh-git\profile.example.ps1"
. "$dir\posh-hg\profile.example.ps1"

function prompt {
  Write-Host ("$(Get-Location)") -NoNewline
  return "> "
}

Pop-Location