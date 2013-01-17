function Remove-TemporaryAspDotNetFiles {
  
  # Stop IIS
  & net stop w3svc

  $root = Join-Path $env:windir "Microsoft.NET"
  
  foreach($framework in @("Framework", "Framework")) {  
    
    foreach($version in @("v2.0.50727", "v4.0.30319")) {  
        
      $path = [System.IO.Path]::Combine($root, $framework, $version, "Temporary ASP.NET Files")
      if(Test-Path $path) {
        Remove-Item $path -Recurse -Force
      }
    }
  }

  #Start IIS
  & net start w3svc
}