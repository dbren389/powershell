# arrays

# an array is a data structure that is designed to store a collection of items
#arrays have a fixed length (immutable)
#items in an array can have the same type of different types
#standard format for arrays

#create an array format
$<array name> = @(<array element 1>, <array element 2>,...)

#create an array of strings 
$animals = @("tiger", "shark", "hawk", "bear", "whale", "eagle")
Write-Output $animals

#add an element to an array
$animals += "penguin"
Write-Output $animals

#accessing array elements 
$<array name>[index]

#ex
$animals[0]

#assign new values to an array
$animals[0] = "monkey"

$animals[1..3]

$animals[3..1]

#display the length of the array
$animals.Length

#hash tables

#a hash table is a data structure that stores data in key-value pairs, also known as a dictionary or asoociative array

#create a hash table
$<hash table name> = @{<key 1> = <value 1>; <key 2> = <value 2>;...}
$phonebook = @{"Bob" = "123-456-7890"; "Alice" = "111-111-111"; "Steve" = "890-567-1234"}

#add a new key-value pair once the hash has been created
$phonebook["Empey"] = "911"
$phonebook 

# access a hash table value of a specified key
$phonebook["Empey"]

# change a hash table value of a specified key
$phonebook["Empey"] = "411"
$phonebook

#view .keys and .values properties of hash tables
$phonebook.keys
$phonebook.Values

#for loop
# great for use cases where the exact number of times a code needs to run is known 

for ($i = 0; $i -lt 5; $i++) {
    Write-Output "Bet you can't count to $i!"
    Write-Output "$i"
}

#for each loop

foreach ($i in $animals){
    Write-Output "What sound does a(n) $i make?"
}

# while loop

$x = 0
while ($x -lt 10){
Write-Output "$x"
$x++
}

#break is used to immediately end a while loop

#continue is used to immeidately return to the top of the loop 

$mylist = ""
while ($true){
    $addition = Read-Host "Type an item to add, 'end' to exit, or 'list' to see the list."
    if ($addition -eq "end"){
        Write-Output "Ending loop"
        break
    }
    if ($addition -eq "list"){
        Write-Output "$mylist"
        continue
    }

    $mylist += $addition + ", "
}
Write-Output "The final list: $mylist"

# functions are self-contained blocks of code that perform a specific task 

# function declaration
function Write-Greeting {
    Write-Output "Hello!"
}


#function call
Write-Greeting


# parameters are used to specify function inputs
function Write-GreetingP {
    param(
        $value
    )
    Write-Output "Hello $value!"
}

#named function call
Write-GreetingP -value "Army Soldier"

#positional function call
Write-GreetingP "Army Soldier"


# multiple parameters

function Add-Numbers{
    param(
        $num1,
        $num2
        )
    $sum = $num1 + $num2
    Write-Output "The sum is $sum"
}

#paramater type can be specified 
function Add-Strings{
    param(
        [string]$string1,
        [string]$string2
        )
    $newstring = $string1 + " " + $string2
    Write-Output "The combined string is $newstring"
}

#mandatory parameters can be specified 
function Get-Remainder{
    param(
        [Parameter(Mandatory)]
        $num1,
        [Parameter(Mandatory)]
        $num2
        )
        $remainder = $num1 % $num2
        Write-Output "The remainder is $remainder"

}

#default parameter values can be specified 

function add-numbers {
    param(
        $num1 = 6,
        $num2 = 7
        )
        $sum = $num1 + $num2
        Write-Output "The sum is $sum"
}



$animals
#while loop in a foreach loop

foreach ($animal in $animals){
    while ($animal.length -lt 5){
        Write-Output "$animal is less than 5 characters"
           break
}
}


