$VMS = Get-VM
$VC = ($global:defaultviserver).Name
$User = ($global:defaultviserver).User
$i = 1
$OutputFile = 'C:\Users\<USERNAME>\Desktop\vNICs (' + $VC + ').txt'
$Date = Get-Date
$VMCount = (Get-VM | Measure).Count
Write-Host Total VMs : $VMCount
Write-Host Start : $Date | Out-File -FilePath $OutputFile -Append -ErrorAction Continue
Write-Host Running vNIC Query on vCenter Server $VC
Write-Host INFO : Perm Limits on Objects are subject to UPN : $User
Write-Host Target File to Remove : $OutputFile
Write-Host Attempting to remove previous output file. Errors between this message and the next can mean it has been already removed.

Remove-Item $OutputFile -ErrorAction Continue
Foreach ($VM in $VMS) {
'Output for ' + $VM | Out-File -FilePath $OutputFile -Append -ErrorAction Continue
Get-VM -Name $VM | Get-NetworkAdapter | Format-List -Property Parent, Name, Type, NetworkName, MacAddress | Out-File -FilePath $OutputFile -Append -ErrorAction Continue
Write-Host Querying : $VM -ErrorAction Continue
$i++ 
}
$Date = Get-Date
Write-Host End : $Date | Out-File -FilePath $OutputFile -Append -ErrorAction Continue
Write-Host ''
Write-Host Output File : $OutputFile
Write-Host ''
Write-Host Displaying Output..
notepad.exe $OutputFile
