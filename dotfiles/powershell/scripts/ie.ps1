function Set-IeStartPage {
  param(
    [Parameter(position=0, mandatory=$false)]
    [string]$url = "about:blank"
  )

  Set-ItemProperty "HKCU:\Software\Microsoft\Internet Explorer\Main" -Name "Start Page" $url 
}