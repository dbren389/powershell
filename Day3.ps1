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






































$animals
#while loop in a foreach loop

foreach ($animal in $animals){
    while ($animal.length -lt 5){
        Write-Output "$animal is less than 5 characters"
           break
}
}


