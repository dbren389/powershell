# Program Ideas

#Even or Odd: Create a program that asks the user for a number and determines if the number is even or odd

$unumber = Read-Host "Please enter a number"
if ($unumber % 2 -eq 0)
{
    Write-Output "The number is even"
}
else{
    Write-Output "The number is odd"
}

# Divisible by x

$num1 = Read-Host "Please enter a number"
$num2 = Read-Host "Please enter a number to divide by"

if ($num1 % $num2 -eq 0){
    Write-Output "$num1 is divisible by $num2"
    }
else {
    Write-Output "$num1 is not divisible by $num2"
}

#Calculator

function calculator{
$operation = Read-Host "Please type one of the following operations: Addition, Subtraction, Multiplication, or Division"
[int]$num1 = Read-Host "Please enter a first number"
[int]$num2 = Read-Host "Please enter a second number"
if ($operation -like "Addition"){
    $result = $num1 + $num2
}
elseif ($operation -like "Subtraction"){
    $result = $num1 - $num2
}
elseif ($operation -like "Multiplication"){
    $result = $num1 * $num2
}
elseif ($operation -like "Division"){
    $result = $num1 / $num2
}
Write-Output "The result is $result"
}

# letter reverse and palindrome checker

function palindrome{
param ($originalString)
$charArray = $originalString.ToCharArray()
[array]::Reverse($charArray)
$reversedString = -join $charArray
if ($originalString -like $reversedString){
    Write-Output "$originalString is a palindrome!"
}
else {
    Write-Output "$originalString is not a palindrome."
}
}

#countdown timer

function timer{
param([int]$time)

for ($i = $time; $i -ge 0; $i--){
    Write-Output "$i"
    sleep 1
}
}

#number guessing game
function guessinggame {
#select a difficulty
$difficulty = Read-Host "Please enter easy, medium, or hard diffuculty"
if ($difficulty -like "easy")
{
    $range = 5
}
elseif ($difficulty -like "medium")
{
    $range = 10
}
elseif ($difficulty -like "hard")
{
    $range = 100
}
else {
    Write-Output "Please enter easy, medium, or hard"
    guessinggame
}

# select a random number from the range
$random = 1..$range | Get-Random 

#ask user for a guess
$guess = Read-Host "Please enter a number between 1 and $range"

if ($guess -eq $random) {
    Write-Output "Congratulations! The number was $random and you guessed $guess !"
    $again = Read-Host "Would you like to play again? Type yes or no"
    if ($again -like "yes"){
        guessinggame
    }
    elseif ($again -like "no") {
        Write-Output "Thanks for playing!"
    }
}
elseif ($guess -eq 67) {
    while ($guess -eq 67) {
        Write-Output "67!"
        sleep 0.5
    }
}
else {
    Write-Output "Try again! The number was $random and you guessed $guess "
    $again = Read-Host "Would you like to play again? Type yes or no"
    if ($again -like "yes"){
        guessinggame
    }
    elseif ($again -like "no") {
        Write-Output "Thanks for playing!"
    }
}
}

#random password generator that takes a password length as input, with default length of 10
function password_generator{
param([int]$length = 10)
$characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789$%&()@!#'.ToCharArray()
[string]$password = ""
while($true){
$randomCharacter = $characters | Get-Random
$password += $randomCharacter
if ($password.Length -gt $length){
    break
}}
Write-Output "Password is $password"
}


#rock, paper, scissors

function rockpaperscissors {
Write-Output "Welcome to rock, paper, scissors"
Sleep 1

# get computer choice
$comp = 1..3 | Get-Random
if ($comp -eq 1){
    $comppick = "Rock"
}
elseif ($comp -eq 2){
    $comppick = "Paper"
}
else {
    $comppick = "Scissors"
}
# get user choice
while($true){
$userpick = Read-Host "Please pick Rock, Paper, or Scissors"
if($userpick -like "rock"){
    $userchoice = "Rock"
    break  
}
elseif ($userpick -like "paper"){
    $userchoice = "Paper"
    break
}
elseif($userpick -like "scissors"){
    $userchoice = "Scissors"
    break
}
else {
    Write-Output "Please enter rock, paper, or scissors only. Try again"
    continue
}
}
# win/loss conditions
if ($userchoice -eq $comppick){
    Write-Output "It is a tie! You picked $userchoice and the computer picked $comppick"
}
elseif ($userchoice -eq "Rock" -and $comppick -eq "Scissors"){
    Write-Output "You win! you picked $userchoice and the computer picked $comppick"
}
elseif ($userchoice -eq "Rock" -and $comppick -eq "Paper"){
    Write-Output "You lose :( you picked $userchoice and the computer picked $comppick"
}
elseif ($userchoice -eq "Scissors" -and $comppick -eq "Paper"){
    Write-Output "You win! you picked $userchoice and the computer picked $comppick"
}
elseif ($userchoice -eq "Scissors" -and $comppick -eq "Rock"){
    Write-Output "You lose :( you picked $userchoice and the computer picked $comppick"
}
elseif ($userchoice -eq "Paper" -and $comppick -eq "Scissors"){
    Write-Output "You win! you picked $userchoice and the computer picked $comppick"
}
elseif ($userchoice -eq "Paper" -and $comppick -eq "Rock"){
    Write-Output "You lose :( you picked $userchoice and the computer picked $comppick"
}
}

# Create a program that determines the max and min values of an array of integers
function minmax{
param ([Array] $numbers)
$max = 0
$min = 10000
foreach($number in $numbers){
    if($number -gt $max){
        $max = $number
    }
    if($number -lt $min){
        $min = $number
    }
}
 Write-Output "The max or the array is $max and the min of the array is $min"
}


#caeser cipher

function caesar{
param ([int]$shift,
       [string]$text)
       $text = $text.ToLower()
       $letter = ""
       $inputarray = $text.toCharArray()
       $length = $text.Length
       $result = @()
       $letters = @("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")
       for ($i = 0; $i -lt $length; $i++){
        #extract the letter
            $letter = $inputarray[$i]
        #get the index of the letter
            [int]$index = $letters.IndexOf($letter)
        #get the index of the shifted letter 
            [int]$shiftedletter = ($index + $shift) % 26
        #get the new letter
            $result += $letters[$shiftedletter]
       }

       # turn result array back into string
            $resultstring = -join $result

            Write-Output "The result of the caesar cipher is $resultstring"

}




















































