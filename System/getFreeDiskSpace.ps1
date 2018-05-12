Get-WMIObject Win32_Logicaldisk -filter "deviceid='C:'" -ComputerName localhost |
Select PSComputername,DeviceID,
@{Name="SizeGB";Expression={$_.Size/1GB -as [int]}},
@{Name="FreeGB";Expression={[math]::Round($_.Freespace/1GB,2)}}