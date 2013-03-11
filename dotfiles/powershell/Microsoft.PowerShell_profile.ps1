$dir = [System.IO.Path]::GetDirectoryName($PROFILE)

Push-Location $dir

Get-ChildItem $dir\scripts\*.ps1 | % {
  . $_
}

Import-Module "$dir\posh-hg\posh-hg"
Import-Module "$dir\posh-git\posh-git"

function prompt {
  $realLASTEXITCODE = $LASTEXITCODE

  # Reset color, which can be messed up by Enable-GitColors
  $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor

  Write-Host($pwd) -nonewline
  
  Write-VcsStatus
  
  $global:LASTEXITCODE = $realLASTEXITCODE
  return "> "
}

Enable-GitColors
Start-SshAgent -Quiet

Pop-Location