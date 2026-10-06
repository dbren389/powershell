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

$operation = Read-Host "Please type one of the following operations: Addition, Subtraction, Multiplication, or Division"
$num1 = Read-Host "Please enter a first number"
$num2 = Read-Host "Please enter a second number"

function calculator{

param ($operation, $num1, $num2)

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