$dir = [System.IO.Path]::GetDirectoryName($PROFILE)

Push-Location $dir

Get-ChildItem $dir\scripts\*.ps1 | % {
  . $_
}

Get-ChildItem $dir\modules\*.psm1 | % {
  Import-Module $_
}

Import-Module "$dir\posh-git\posh-git"

function global:prompt {
  $realLASTEXITCODE = $LASTEXITCODE

  if(Get-IsAdmin -eq $true) {
    $host.UI.RawUI.ForegroundColor = "Red"
    Write-Host("[ADMIN] ") -NoNewline
  }

  # Reset color, which can be messed up by Enable-GitColors
  $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor

  Write-Host($pwd.ProviderPath) -NoNewline

  Write-VcsStatus

  $global:LASTEXITCODE = $realLASTEXITCODE
  return "> "
}

Enable-GitColors

Pop-Location

Clear-Host

#Start-SshAgent -Quiet
