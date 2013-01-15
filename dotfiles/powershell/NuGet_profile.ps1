function Configure-Environment { 
  # Enable line numbers in ALL languages.
  $dte.Properties("TextEditor", "AllLanguages").Item("ShowLineNumbers").Value = $true

  # Show empty environment on startup.
  $dte.Properties("Environment", "Startup").Item("OnStartUp").Value = 4
  
  # Set indentations for web languages.
  foreach($language in @("JavaScript", "CSS", "HTML")) {
    Set-Indent 2 $language
  }
}

function Get-FontSize {
  Write-Host $dte.Properties("FontsAndColors", "TextEditor").Item("FontSize").Value
}

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
  
  if(Test-Path $vsSettingsFile) {
    $dte.ExecuteCommand("Tools.ImportandExportSettings","/import:`"$vsSettingsFile`"")
  }
  else {
    Write-Host "Could not find a theme with name '$name'."
  }
}

function Set-Indent([int] $size, [string] $language) {

  $dte.Properties("TextEditor", $language).Item("TabSize").Value = $size
  $dte.Properties("TextEditor", $language).Item("IndentSize").Value = $size
  
  if($size -eq 4) {
    $dte.Properties("TextEditor", $language).Item("InsertTabs").Value = $true
  }
  else {
    $dte.Properties("TextEditor", $language).Item("InsertTabs").Value = $false
  }
}