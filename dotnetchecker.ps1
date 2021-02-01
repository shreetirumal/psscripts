#the below script is based on url, this allows admins to check the .NET version and if the NETFX feature is enabled - Courtesy: Srinath Pelluri
#https://docs.microsoft.com/en-us/dotnet/framework/migration-guide/how-to-determine-which-versions-are-installed#:~:text=Use%20PowerShell%20to%20check%20for,2%20or%20later%20is%20installed.

Start-Transcript -Path "C:\temp\dotnetcheck.log" -Force
$ireturn = 0
$dotnetminver = Get-ItempropertyValue -Path 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full' -Name 'Release'

Switch ($dotnetminver) {

  528040 {$ireturn = 4.8 }
  461808 {$ireturn = 4.7.2 }
  461308 {$ireturn = 4.7.1 }
  460798 {$ireturn = 4.7 }
  528372 {$ireturn = 4.8}
 }
  
  if($ireturn -eq 0){
    Write-Output "Error, wrong Dot Net Version Found"
    EXIT 1
} else {
    Write-Output ".NET Framework $ireturn found"
    EXIT 0
  }
