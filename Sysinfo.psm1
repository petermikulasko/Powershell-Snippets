
function GetInfo{    
    param(        
        [Parameter(Mandatory=$true)]
        $ComputerName     
    )   

    Get-WmiObject -ComputerName $ComputerName -Class Win32_BIOS
}



function GetStatus{
    param($ComputerName)
    Test-Connection -ComputerName $ComputerName -Count 1 -Quiet
}


function LogedInUser{
    param($ComputerName)
    Get-WMIObject -class Win32_ComputerSystem -ComputerName $ComputerName | select username
}

function GetUptime {
    param($Computername)
   $os = Get-WmiObject win32_operatingsystem -ComputerName $Computername
   $uptime = (Get-Date) - ($os.ConvertToDateTime($os.lastbootuptime))
   $Display = "Uptime: " + $Uptime.Days + " days, " + $Uptime.Hours + " hours, " + $Uptime.Minutes + " minutes" 
   Write-Output $Display
}


#
#GetStatus -ComputerName localhost
#LogedInUser -ComputerName localhost
#GetUptime -ComputerName localhost

