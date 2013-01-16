$host.ui.rawui.ForegroundColor 	= "Green"
$host.ui.rawui.BackgroundColor 	= "Black"
$host.ui.rawui.CursorSize 		= 25

$bufferSize = $host.ui.rawui.BufferSize
$bufferSize.Width = 140
$bufferSize.Height = 3000
$host.ui.rawui.BufferSize = $bufferSize

$windowSize = $host.ui.rawui.WindowSize
$windowSize.Width = 140
$windowSize.Height = 40
$host.ui.rawui.WindowSize = $windowSize

Clear-Host