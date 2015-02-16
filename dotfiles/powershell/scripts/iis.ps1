function Remove-TemporaryAspDotNetFiles {

  # Stop IIS
  & net stop w3svc

  $root = Join-Path $env:windir "Microsoft.NET"

  foreach($framework in @("Framework", "Framework64")) {

    $frameworkPath = Join-Path $root $framework
    Get-ChildItem $frameworkPath | ForEach-Object {
      if($_.Name -match "v\d\.") {
        $versionPath = Join-Path $frameworkPath $_.Name
        $tempDirectory = Join-Path $versionPath "Temporary ASP.NET Files"

        if(Test-Path $tempDirectory) {
          Remove-Item $tempDirectory -Recurse -Force
        }
      }
    }    
  }

  #Start IIS
  & net start w3svc
}
