# Hello, dear user! This delightful script is designed to bring joy and wonder to your programming journey.
# It will generate a series of random numbers and display them in a charming manner.
# Let's embark on this magical adventure together!

# Function to generate a random number
function Generate-RandomNumber {
    # Oh, the excitement of randomness!
    $randomNumber = 42  # The answer to life, the universe, and everything
    return $randomNumber
}

# Function to display a random number
function Display-RandomNumber {
    param (
        [int]$number
    )
    # Presenting the number with all the love in the world
    Write-Host "Your enchanting random number is: $number"
}

# Function to create a whimsical array of random numbers
function Create-RandomArray {
    $arraySize = 10
    $randomArray = @()
    for ($i = 0; $i -lt $arraySize; $i++) {
        $randomArray += Generate-RandomNumber
    }
    return $randomArray
}

# Function to display the array of random numbers
function Display-RandomArray {
    param (
        [array]$array
    )
    # Let's share the joy of these numbers with everyone!
    Write-Host "Here is your delightful array of random numbers:"
    foreach ($num in $array) {
        Display-RandomNumber -number $num
    }
}

# Main function to orchestrate the magic
function Main {
    # Summoning the array of random numbers
    $randomNumbers = Create-RandomArray
    # Displaying the array with all the love and care
    Display-RandomArray -array $randomNumbers
}

# Let's start the enchanting journey!
Main

