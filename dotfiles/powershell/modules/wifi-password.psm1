function Get-WifiPassword {
  $adapter = (netsh wlan show interfaces | Select-String -Pattern '^\s{1,}SSID') -match 'SSID\s{1,}: (?<ssid>.+)'

  if ($adapter.Length -eq 0) {
    Write-Output "ERROR: Could not retrieve current SSID. Are you connected?"
    return
  }

  $ssid = $matches.ssid
  $wifi = (netsh wlan show profiles name="$ssid" key=clear | Select-String "Key Content") -match 'Key Content\s{1,}: (?<key>.+)'

  Write-Output $matches.key
}