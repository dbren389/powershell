# select specified properties of an object
Select-Object  -Property <Property Name> 
Get-Service | Where-Object {$_.Status -eq "Running"} | Select-Object -Property ServiceType, CanStop, Status
Get-Service | Where-Object{$_.ServiceName -like "*host"} | 
Select-Object -Property ServiceName | Get-Member
#get-member here tells us we are looking at service controller objects here since we are looking at Get-Service Objects 

# get the members (properties and attributes) of an object 
[Object] | Get-Member 
Get-Service | Get-Member

# access the value of a property
Select-Object -ExpandProperty <property name> 
# list all running services 
Get-Service | Where-Object {$_.Status -eq "Running"} | Select-Object -ExpandProperty ServiceName |
Get-Member
# Get-Member here tells us the properties and methods of string objects since we are looking at the property ServiceName

#syntax for Powershell Kata problems
<cmdlet> | Where-Object {$_.<property> <comparison operator> <pattern>} | Select-Object -Property/-ExpandProperty <property>

#Write a PowerShell one-liner that filters services whose ServiceNames start with "d" (case-sensitive) and outputs their ServiceName properties as strings.
Get-Service | Where-Object {$_.ServiceName -clike "d*"} | Select-Object -ExpandProperty ServiceName
#Write a PowerShell one-liner that filters services whose names do not end with "svc" (case-insensitive) and outputs their ServiceName properties.
Get-Service | Where {$_.ServiceName -notlike "*svc"} | Select-Object -Property ServiceName 
#Write a PowerShell one-liner that filters processes whose ProcessNames end with logon (case-insensitive) and outputs their sessionID properties as integers.
Get-Process | Where-Object {$_.ProcessName -like "*logon"} | Select-Object -ExpandProperty SessionId
#property is used to access specific properties
#expandproperty is used to access the values of specific properties 

#REGEX 

# select-string is the main cmdlet used to implement regex to find patterns in strings 
Get-Content <file path> | Select-String "<REGEX>" [-CaseSensitive] [-AllMatches] [-NotMatch]
# -casesensitive, -allmatches, and -notmatch are all switch parameters 
# -casesensitive: turns on case sensitivity
# -allmatches: allows for a pattern to be found multiple times per line
# -NotMatch: finds all lines that don't match the specified pattern 

#retrieve the contents of a file
Get-Content C:\Users\cvte1\Desktop\Day1.ps1

#filter for regex matches within a file (grep)
Get-Content C:\Users\cvte1\Desktop\Day1.ps1 | Select-String "(Detailed)"

# filter for IPs that have 250 as the second octet
Get-Content .\HR_Employee_list.txt| Select-String -Pattern "\d{1,3}\.250\.\d{1,3}\.\d{1,3}"

# count the number of objects with Measure- Object
Get-Content .\HR_Employee_list.txt| Select-String -Pattern "\d{1,3}\.250\.\d{1,3}\.\d{1,3}" | Measure-Object

# count the lines with unique values in the middle two digits of the ssn
# ForEach-Object part isolates the match itself instead of the entire line
Get-Content .\HR_Employee_list.txt| Select-String -Pattern "-\d{2}-" | ForEach-Object {$_.matches.value}
# Sort-Object removes any duplicate entries 
Get-Content .\HR_Employee_list.txt| Select-String -Pattern "-\d{2}-" | ForEach-Object {$_.matches.value} | Sort-Object -Unique

#standard format for REGEX Kata
Get-Content <file path> | Select-String <REGEX pattern> | ForEach-Object {$_.matches.value} | Sort-Object -Unique | Measure-Object

#In the HR_Employee_list.txt file, what is the first name of the individual whose last name is Rines?
Get-Content .\HR_Employee_list.txt | Select-String -Pattern "\.Rines"
#In the HR_Employee_list.txt file, how many individuals have @army.mil as their email domain? 
Get-Content .\HR_Employee_list.txt | Select-String -Pattern "@army.mil" | Measure-Object
#In the HR_Employees_list.txt file, how many hyphens are there?
Get-Content .\HR_Employee_list.txt | Select-String -Pattern "-" -AllMatches | ForEach-Object {$_.matches.value} | Measure-Object
#In the HR_Employees_list.txt file, how many unique salaries are there? (Hints: All salaries are five figures, 1500 is incorrect)
Get-Content .\HR_Employee_list.txt | Select-String -Pattern "\$\d{2}\,\d{3}"| ForEach-Object {$_.matches.value} | Sort-Object -Unique | Measure-Object


#PowerShell Conditionals 
# common comparison operators
-eq : equal to
-ne: not equal to
-gt: greater than
-ge greater than or equal to
-lt: less than
-le: less than or equal to

#if statement
if (<condition>){
    <code to execute>
}
#ex
$x = 5
if ($x -eq 5){
    Write-Output "That was true."
}

#elseif statement and else statement, elseif only evaluates if the if statement fails 
if (<condition A>) {
    <code a>
}
elseif (<condition B>){
    <code B>
}
else {
    <code c>
}

#ex
$grade = Read-Host "Please enter your number grade"
if ($grade -ge 90){
    Write-Output "You got an A"
}
elseif ($grade -ge 80){
    Write-Output "You got a B"
}
elseif ($grade -ge 70){
    Write-Output "You got a C"
}
else {
    Write-Output "You failed. Please study harder"
}

#Logical Operators

-and #true if both conditions are true
-or #true if at least one condition is true
-not/! #negation 


#Arithmetic Operators
+: addition 
$sum = 10 + 2

-: subtraction
$diff = 10 - 2

*: multiplication
$prod = 10 * 2

/: division
$quot = 10 / 2

%: modulus (remainder)
$mod = 10 % 2


$number = Read-Host "Please input a number"
if ($number % 2 -eq 0) {
    Write-Output "The number is even"
}
else {
    Write-Output "The number is odd"
}


function evenorodd {
    param ($num)
    if ($num % 2 -eq 0) {
        Write-Output "The number is even"
}
    else {
       Write-Output "The number is odd" 
}
}

# PES

#Write a PowerShell one-liner that filters processes whose ProcessNames end with "broker" (case-insensitive) and outputs their BasePriority properties as integers.
#  get-process | Where-Object {$_.ProcessName -like "*broker"} | Select-Object -expandproperty BasePriority

#Write a PowerShell one-liner that filters services whose ServiceTypes are 224 and displays their CanShutdown properties.
# get-service | where-object {$_.ServiceType -eq "224"} | Select-object -property CanShutdown


#What cmdlet do we use to display specific properties of an object
# Select-Object 

#The Property parameter of Select-Object allows us to choose which properties to display, and the ExpandProperty parameter of Select-Object allows us to display the specific values stored within the chosen properties.

# True

#***Pipelines cannot be at the start of a line, they can be at the end of a line however***

# else ifs do not execute when the if statement preceding them executes
# True 



























































