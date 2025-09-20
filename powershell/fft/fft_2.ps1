# 🌸✨ Welcome to the Fabulous Function Trainer (FFT)! ✨🌸
# This delightful script is designed to bring joy and learning to your programming journey.
# It will guide you through a magical world of PowerShell functions and variables.
# Let's embark on this enchanting adventure together! 🌟

# 🌼 Function to create a beautiful array of numbers 🌼
function Create-Array {
    param (
        [int]$size
    )
    $array = @()
    for ($i = 0; $i -lt $size; $i++) {
        $array += $i
    }
    return $array
}

# 🌺 Function to display the array in a charming way 🌺
function Display-Array {
    param (
        [array]$array
    )
    foreach ($item in $array) {
        Write-Output "🌟 Item: $item 🌟"
    }
}

# 🌷 Function to find the sum of the array elements 🌷
function Sum-Array {
    param (
        [array]$array
    )
    $sum = 0
    foreach ($item in $array) {
        $sum += $item
    }
    return $sum
}

# 🌻 Function to create a whimsical hash table 🌻
function Create-HashTable {
    $hashTable = @{}
    $hashTable["Frodo"] = "Baggins"
    $hashTable["Samwise"] = "Gamgee"
    $hashTable["Gandalf"] = "The Grey"
    return $hashTable
}

# 🌼 Function to display the hash table in a delightful manner 🌼
function Display-HashTable {
    param (
        [hashtable]$hashTable
    )
    foreach ($key in $hashTable.Keys) {
        Write-Output "🌟 $key: $($hashTable[$key]) 🌟"
    }
}

# 🌸 Main script execution starts here 🌸
$size = 10
$array = Create-Array -size $size
Display-Array -array $array

$sum = Sum-Array -array $array
Write-Output "🌟 The sum of the array is: $sum 🌟"

$hashTable = Create-HashTable
Display-HashTable -hashTable $hashTable

# 🌺 Function to simulate a memory-intensive operation 🌺
function Memory-IntensiveOperation {
    $largeArray = @()
    for ($i = 0; $i -lt 1000000; $i++) {
        $largeArray += $i
    }
    # The large array is not cleared, leading to a subtle memory leak
}

# 🌷 Call the memory-intensive operation 🌷
Memory-IntensiveOperation

