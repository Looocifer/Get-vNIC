# Get-vNIC

This PS1 script generates output in a TXT file listing all NICs in the vCenters it is connected to, categorized by Parent VM.
Once script has been run it will pop up the output via TXT Reader (typically Notepad in Windows).
Also has Active Runtime Status Reporting for the Console. User will know what is happening exactly when it happens.

Example Output below.
_____________________________________________________________________________________________________________________________

Output for VM1


Parent      : VM1
Name        : Network adapter 1
Type        : Vmxnet3
NetworkName : VLAN 400
MacAddress  : xx:xx:xx:xx:xx:xx

Parent      : VM1
Name        : Network adapter 2
Type        : Vmxnet3
NetworkName : VLAN 401
MacAddress  : xx:xx:xx:xx:xx:xx

_____________________________________________________________________________________________________________________________
