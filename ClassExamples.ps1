# rock paper scissors 
$r = Read-Host "Select Rock, Paper, or Scissors"
$comp = Get-Random -Minimum 1 -Maximum 4


#Lesson 1

#Write a line of code that will display the stopped services

Get-Service Where{$_.Status -like "Stopped"}

#Write a command that will change your current working directory to your home directory using the $HOME variable.
Set-Location $HOME

# What automatic variable stores the version of PowerShell you are running? 
$PSVersionTable

# Ask the user for their favorite meal and save it to a variable named $favemeal. Then output "Your favorite meal is $favemeal."
$favemeal = Read-Host "What is your favorite meal?"
Write-Output "Your favorite meal is $favemeal ? thats gross."


#Lesson 2

#Write a PowerShell one-liner that filters services whose ServiceNames start with "d" (case-sensitive) and outputs their ServiceName properties as strings.
Get-Service | Where-Object {$_.ServiceName -clike "d*"} | Select-Object -ExcludeProperty ServiceName

#Write a PowerShell one-liner that filters services whose names do not end with "svc" (case-insensitive) and outputs their ServiceName properties.
Get-Service | Where {$_.ServiceName -notlike "*svc"} | Select-Object -Property ServiceName
 
#Write a PowerShell one-liner that filters processes whose ProcessNames end with logon (case-insensitive) and outputs their sessionID properties as integers.
Get-Process | Where-Object {$_.ProcessName -like "*logon"} | Select-Object -ExpandProperty SessionId

#In the HR_Employee_list.txt file, what is the first name of the individual whose last name is Rines?
Get-Content .\HR_Employee_list.txt | Select-String -Pattern "\.Rines"

#In the HR_Employee_list.txt file, how many individuals have @army.mil as their email domain? 
Get-Content .\HR_Employee_list.txt | Select-String -Pattern "@army.mil" | Measure-Object

#In the HR_Employees_list.txt file, how many hyphens are there?
Get-Content .\HR_Employee_list.txt | Select-String -Pattern "-" -AllMatches | ForEach-Object {$_.matches.value} | Measure-Object

#In the HR_Employees_list.txt file, how many unique salaries are there? (Hints: All salaries are five figures, 1500 is incorrect)
Get-Content .\HR_Employee_list.txt | Select-String -Pattern "\$\d{2}\,\d{3}"| ForEach-Object {$_.matches.value} | Sort-Object -Unique | Measure-Object


<# Create a variable named temperature, and a variable named weather. Use conditional statements to satisfy the following requirements.

If the temperature is above 40 and the weather is sunny, print "It's a run day!"
If the temperature is above 40 and the weather is rainy, print "It's a wet run day!"
If the temperature is below 40 and the weather is sunny, print "It's a gym day!"
If the temperature is below 40 or the weather is rainy, print "ZONK!"
For anything else, print "It's a beautiful day for PT."
Your program should only print one line!
#>

$temperature = 50
$weather = "sunny"

if($temperature -gt 40 -and $weather -eq "sunny")
{
    Write-Output "It's a nice day for a run"
}
elseif ($temperature -gt 40 -and $weather -eq "rainy")
{
    Write-Output "It's a wet run day"
}
elseif ($temperature -lt 40 -and $weather-eq "sunny")
{
    Write-Output "It's a gym day"
}
else {
    Write-Output "It's a zonk day"
}



#Lesson 3

<#
Create an array called colors that contains the following values:

"red", "orange", "yellow", "green", "blue", "indigo", "violet"

Determine the index of the "orange" element.
Use indexing to display the "green" element.
Use negative indexing to display the "indigo" element.
Change the "red" element to "pink".
Display the length of the array.
#>

$colors = @("red", "orange", "yellow", "green", "blue", "indigo", "violet")
$colors[3]
$colors[-2]
$colors[0] = "pink"
$colors[1] = "orange"
$colors.Length

# get the index of green
$colors.IndexOf("green")

<#
Create a hash table called logins that contains the following username/password pairings:
James = P@ssw0rd!; Susan = C0113G3F00TB@11!!; Kim = qazwsx123!@#
#>

#create hash table 
$logins = @{"James" = "P@ssw0rd!"; "Susan" = "C0113G3F00TB@11!!"; "Kim" = "qazwsx123!@#"}

#determine if susan is a key
$logins.Keys | Select-String "Susan"

#determine which key is associated with P@ssw0rd!
$keys = $logins.Keys | Where-Object { $logins[$_] -eq "P@ssw0rd!"}
$keys

#use indexing to display the value associated with Kim
$logins["Kim"]

#Change James' password to "YOU'VEBEENHACKED"
$logins["James"] = "YOU'VEBEENHACKED"
$logins["James"]

#display all the passwords 
$logins.Values
#Display all of the usernames in alphabetical order.
$logins.Keys | Sort-Object 

# Create a for loop that prints numbers 1-20

for ($i = 1; $i -lt 21; $i++){
    Write-Output $i
    Sleep 1
}

#Create a for loop that prints numbers 20-1

for ($i = 20; $i -gt 0; $i--){
    Write-Output $i
    sleep 1
}

#Create a for each loop that takes an array of numbers 1-10 and prints only the even numbers
$numbers = @(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
foreach ($num in $numbers){

    if($num % 2 -eq 0){
        Write-Output $num
    }

}

#Create a for each loop that takes an array of animal names and prints the ones that start with the Letter "t"

$animals = @("tiger", "bear", "snake", "eagle", "goat")
foreach ($animal in $animals){
    if ($animal -match "^t"){
        Write-Output "$animal"
    }
    
}

# Create a program that generates a random number from 1-20 and continues to ask the user for guesses until they get it correct
function guessgame{
$random = 1..20 | Get-Random
while ($random -eq $random){
$guess = Read-Host "Please guess a number betwwen 1-20. Type 'quit' to give up"
if ($guess -eq $random){
    Write-Output "You win!"
    break
}
elseif ($guess -like "quit"){
    Write-Output "Please try again soon!"
    break
}
elseif ($guess -ne $random){
    Write-Output "try again!"
    continue
}}}


# Create a program that prints all even numbers 1-100 using a while loop
$x = 0
while ($x -lt 101){
if ($x % 2 -eq 0) {
Write-Output "$x"
}
$x++
}

#Create a function named Check-Even that takes a mandatory integer parameter named 'number' and prints whether or not 'number' is even.

function Check-Even{
    param(
    [Parameter(Mandatory)]
    [int]$number)

    if ($number % 2 -eq 0){
        Write-Output "$number is even"
    }
    else {
        Write-Output "$number is odd"
    }
}

#Create a function named Cube-Number that takes an integer parameter named 'my_number' and prints the cube of the number. The default value of 'my_number' should be 5.
function Cube-Number{
    param(
    [int]$my_number = 5)

    $cube = $my_number * $my_number *$my_number
    Write-Output "The cube of $my_number is $cube"

}


#Create a function named Check-Regex that takes a string parameter named 'text' and a string parameter named 'pattern'. It should print whether or not there is a regex match. 

function Check-Regex{
    param(
    [string]$text,
    [string]$pattern)

    if ($text -cmatch $pattern){
        Write-Output "The strings are a match!"
    }
    else {
        Write-Output "No match was found."
    }
}



function justsaywhen {
$when = $False
while (-not $when){
    $input = Read-Host "Would you like more cheese on your pasta? just say when."
    if ($input -eq "when"){
        $when = $True
    }
}
}

function make-Waves{
    param($count)
    $waves = 0
    $waveform = ""
    while ($count -gt 0){
        $waves++
        if ($waves % 3 -eq 2){
            $waveform += "_"
        }
        elseif($waves % 3 -eq 1){
           $waveform += "\"
        }
        else{
            $waveform += "/"
        }
        Write-Output "$waveform"
        sleep -Milliseconds 250 #pauses code execution for 250 milliseconds
        $count--
    }
}

#Consider the following array of greetings. If the greeting starts with 'Bad' replace it with 'Good' and diplay it
# if the greeting starts with 'Good' display it
#Expected Output:
# Good day
# Good morning
# Good afternoon
# Good evening

$arr = @("Bad day", "Bad morning", "Good afternoon", "Good evening")

foreach($greeting in $arr){
    if($greeting -like "*bad*"){
        $greeting -replace "Bad", "Good"
    }
    else{
        $greeting
    }
}


# jeopardy 























































