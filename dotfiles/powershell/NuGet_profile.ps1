function Set-FontSize {
  param(
    [ValidateRange(6, 128)]
    [Parameter(position=0, mandatory=$true)]
    [int]$size
  )

  $dte.Properties("FontsAndColors", "TextEditor").Item("FontSize").Value = $size
}

function Increase-FontSize {
  $size = $dte.Properties("FontsAndColors", "TextEditor").Item("FontSize")
  $size.Value = $size.Value + 1
}

function Decrease-FontSize {
  $size = $dte.Properties("FontsAndColors", "TextEditor").Item("FontSize")
  $size.Value = $size.Value - 1
}

function Set-Theme {
  param(
    [Parameter(position=0, mandatory=$true)]
    [string]$name
  )

  $vsRegKey = Get-ItemProperty -Path "HKCU:\Software\Microsoft\VisualStudio\11.0"

  $vsLocation = $vsRegKey.PSObject.Properties["VisualStudioLocation"].Value
  $vsSettingsLocation = [System.IO.Path]::Combine($vsLocation, "Settings")
  $vsSettingsFile = [System.IO.Path]::Combine($vsSettingsLocation, "$name.vssettings")
  
  $dte.ExecuteCommand("Tools.ImportandExportSettings","/import:`"$vsSettingsFile`"")
}