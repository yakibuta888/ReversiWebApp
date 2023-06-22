if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrators")) {
  Start-Process powershell.exe "-File `"$PSCommandPath`"" -Verb RunAs
  exit
}

$Results = netstat -ano | Select-String ":3306"
foreach( $Line in $Results ){
  if( $Line ){
    $Line -match "\d+$"
    break
  }
}

taskkill /F /PID $Matches[0]
