<#
this is 
a 
multiline 
comment
#>

Write-Output "This is my first script"

#pwd
Get-Location 

#change working directory
Set-Location -Path C:\Users\cvte1\Desktop

#ls
Get-ChildItem
Get-ChildItem -File

# pull content from a file (cat)
Get-Content ./<file> 

# get all running services 
Get-Service | Where-Object {$_.Status -eq "Running"}
# Where-Object: object filtering
# $_: current object in the pipeline
# .Status = status property of the service
# -eq = equality operator

#Where-Object syntax 
Where-Object {$_.<property> <comparison operator> <pattern>}
#comparison operators:
-eq: checks for specified pattern, not case sensitive
-ceq: checks for pattern, case sensitive 
-ne: checks for not the specified pattern, not case sensitive
-match: similar to eq, but supports REGEX, not case sensitive
-cmatch: eq that supports REGEX, case sensitive
-notmatch: ne but supports REGEX, not case senhsitive 
-like: similar to eq but supports wildcards (not case sensitive)
-clike: like but case sensitive
-notlike: ne that supports wildcards (not case sensitive)

#another Where-Object example
Get-Service | Where-Object {$_.ServiceName -like "*host"}
Get-Service | Where-Object {$_.ServiceName -match "(host)$"

#help command
Get-Help -Name <cmdlet name>
#switch parameters:
-Detailed: adds parameter descriptions and examples 
-Examples: adds examples
-Full: Adds parameter attributes, I/O object types
-Online: online version of a help article
-ShowWindow: displauys help in a seperate window 

# get all commands installed on the computer, including cmdlets, aliases, functions, etc.
Get-Command
# filter for all Get commands:
Get-Command Get*

# displays important information about Powershell objects like properties and methods
<cmdlet> | Get-Member

#powershell uses built-in aliases like:
echo
write
pwd
cd
ls
dir
cls / clear
? or where

#get information about aliases 
Get-Alias 

# to find out if an alias is assigned to a command
Get-Alias -Name <alias> 

#find out if a command has any assigned aliases
Get-Alias -Definition <command> 

#create an alias or redefine an alias
Set-Alias -Name <alias> -Value <command>
# create a new alias 
New-Alias -Name <alias> -Value <command> 


#variables
ex: $my_variable 

#display all variables that are available in the current session
Get-Variable

# create a user-created variable
$<variable name> = <variable value> 

#read text-based input form the console
$<variable name> = Read-Host "<prompt>"
$username = Read.Host "Please enter your name"

#write the output of a variable
Write-Output "$variable"
# double quotes allow for a variable to be evaluated
# single quotes ignore the special value of $ and treat it like a literal character 

# Create a variable named $password and assign it to the value "Password!"

$password = "Password!"

# Then display $password

Write-Output "$password" 

#ask the user for their favorite meal and save it to a variable named $favemeal
$favemeal = Read-Host "Please enter your favorite meal"

#then output "your favorite meal is $favemeal"
Write-Output "your favorite meal is $favemeal"

# to run a powershell script
C:\Users\cvte1\Desktop\Powershell\Day1.ps1

# Set execution policy
Set-ExecutionPolicy Unrestricted
# other execution policy types:
AllSigned: scripts that are signed by a trusted publisher can run
Bypass: Nothing is blocked and there are no woarnings or prompts
Default: sets the default execution policy
RemoteSigned: Default execution policy for Windows server computers, scripts can run, but when downloaded from the internet a digital signature is required 
Restricted: Default execution policy for Windows client computers, permitting individual commands, but not scripts
Undefined: There is no execution policy 
Unrestricted: The default execution policy for non-Windows computers and cannot be changed 

# setting up a profile

#test the path of the $PROFILE to see if it exists
Test-Path $PROFILE
# if true is returned, the file exists, if false:

#create the profile file
New-Item -Path $PROFILE -ItemType File -Force

#edit the profile in notepad
notepad $PROFILE
notepad $PROFILE <ProfileName> 
notepad $PROFILE.AllUsersAllHosts
#$PROFILE is current user, current host

#save the profile file and restart powershell 

# remove an item
Remove-Item

#PEs

#PowerShell methods are 
# Actions objects can do

#T or F? Powershell ISE 7 will be cross platform, feature cloud functionality, and is currently in development
# False

# What additional condition must also be met for you to be able to change the execution policy?
# Must be running powershell as administrator 

#Automatic Variables 
$HOME # user's home directory
$_ #stores the current object in the pipeline
$PROFILE # stores the path of the powershell profile
$PSVERSIONTABLE # stores information about the current powershell verison 
$PWD # stores the full path of the current working directory 