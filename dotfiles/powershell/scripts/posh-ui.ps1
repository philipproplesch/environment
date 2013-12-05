$host.UI.RawUI.ForegroundColor = "Green"
$host.UI.RawUI.BackgroundColor = "Black"
$host.UI.RawUI.CursorSize = 25

$bufferSize = $host.UI.RawUI.BufferSize
$bufferSize.Width = 140
$bufferSize.Height = 3000
$host.UI.RawUI.BufferSize = $bufferSize

$windowSize = $host.UI.RawUI.WindowSize
$windowSize.Width = 140
$windowSize.Height = 40
$host.UI.RawUI.WindowSize = $windowSize

Clear-Host