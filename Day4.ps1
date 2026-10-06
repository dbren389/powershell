# string concatenation

$mystring = "This " + "is " + "a " + "string"
Write-Output $mystring


# join operator can also concatenate strings 
$mystring2 = "this", "is", "another", "way", "to", "concatenate" -join ","
Write-Output $mystring2

# replace operator substitures part of a string with something else 
"batman" -replace "bat", "cat"

# split operator splits a string into an array of strings based on a delimiter 
"Break,this,up,by,commas,please" -split ","

#String indexing is used to pull specific characters out of a string variable 
$stringx = "This is a PowerShell string"
$stringx[0]

# use negative indexing [-n] to get n characters from the end of the string
$stringx[-1]


#powershell obfuscation

#base54 encoding is a common form of obfuscation in powershell

#declare a variable
$secret = "Get-ChildItem"

#convert the tex from readable text into bytes
$secretbytes = [System.Text.Encoding]::Unicode.GetBytes($secret)

#converts the bytes into base64
$encodedsecret = [Convert]::ToBase64String($secretbytes)

#check the base64 representation of the command
write-host $encodedsecret

#execute the command with the -EncodedCommand parameter
powershell.exe -EncodedCommand $encodedsecret


#string manupulation with join

# the below command could signal an alert for notepad commands:
notepad "malicious.txt"

# we can potentially use -join to get around this alert 
$var1 = "not", "epad", " ma", "li", "cio", "us.", "tx", "t" -join ""
powershell.exe $var1

#string manipulation with replace
$var2 = "no~tep~ad ~mal~icio~us.t~xt" -replace "~", ""
$var2

#string manipulation with substrings 
#This could potentially avoid detection
$stringy = "the malt chicken from my pad is not delicious.x"
$secretstring = $stringy[32] + $stringy[33] + $stringy[34] + $stringy[14] + $stringy[25] + $stringy[26] + $stringy[27] + $stringy[3] + $stringy[4] + $stringy[5] + $stringy[6] + $stringy[11] + $stringy[40] + $stringy[41] + $stringy[42] + $stringy[43] + $stringy[44] + $stringy[45] + $stringy[0] + $stringy[46] + $stringy[0]
$secretstring

#powershell logs can be found in 2 places:
# applications and services logs -> windows powershell
# applications and services logs -> Microsoft -> Windows -> Powershell -> Operational Logs 

#logs can be viewed with the Get-WinEvent command
Get-WinEvent *

# module logging records command execution in Powershell 
# a new log entry is created for every command that is executed 
#log id of 4104

# script block logging records the processing of commands, functions, and scripts as a single script block 
# log id of 4104

#Get-WinEvent can be used to view these logs:

Get-WinEvent "Microsoft-Windows-PowerShell/Operational" | Select-Object -First 15 | Out-Gridview

#transcript logging involves keeping a detailed record of commands run in PowerShell in a separate transcript file
# starting and stoping a transcription from within powershell:
Start-Transcript
Write-Output "Try and catch me"
Get-Service
Write-Output "And I'm gone, without a trace"
Stop-Transcript

# the transcript should appear in the documents folder 