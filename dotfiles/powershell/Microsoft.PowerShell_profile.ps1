$dir = [System.IO.Path]::GetDirectoryName($PROFILE)

Get-ChildItem $dir\scripts\*.ps1 | % {
  . $_
}

# Load posh-git & posh-hg
. "$dir\posh-git\profile.example.ps1"
. "$dir\posh-hg\profile.example.ps1"