param ( [string[]]$LinkNames )
$SourceExe = "G:\Private_Server\RO\openkore"
$DestinationPath = "G:\Private_Server\RO\"
$WshShell = New-Object -COMObject WScript.Shell
foreach ($LinkName in $LinkNames) {
  $Shortcut = $WshShell.CreateShortcut($DestinationPath + $LinkName + ".lnk")
  $Shortcut.TargetPath = $SourceExe + "\wxstart.exe"
  $Shortcut.WorkingDirectory = $SourceExe
  $Shortcut.Arguments = "--control=control\" + $LinkName
  $Shortcut.Save()	
}