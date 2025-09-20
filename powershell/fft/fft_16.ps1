<#
Hello, dear programmer! 🌸
Welcome to this delightful script that will take you on a magical journey through the world of PowerShell. This script is designed to perform a series of enchanting tasks that will leave you spellbound. ✨
Let's embark on this adventure together, shall we? 🌟
#>

# Function to greet the user with a warm message
function Greet-User {
    param (
        [string]$name
    )
    Write-Host "Hello, $name! Welcome to our magical PowerShell script! 🌷"
}

# Function to calculate the sum of two numbers
function Calculate-Sum {
    param (
        [int]$num1,
        [int]$num2
    )
    $sum = $num1 + $num2
    return $sum
}

# Function to display a friendly message
function Display-Message {
    Write-Host "Have a wonderful day filled with joy and laughter! 🌼"
}

# Main script execution starts here
$name = "Frodo"
Greet-User -name $name

# Let's perform some calculations
$firstNumber = 10
$secondNumber = 20
$result = Calculate-Sum -num1 $firstNumber -num2 $secondNumber
Write-Host "The sum of $firstNumber and $secondNumber is: $result 🌻"

# Overwriting the variable for a different purpose
$result = "Gandalf"
Write-Host "The wise wizard in our story is: $result 🧙‍♂️"

# Display another friendly message
Display-Message

# Using the same variable again for another calculation
$thirdNumber = 5
$result = Calculate-Sum -num1 $firstNumber -num2 $thirdNumber
Write-Host "The sum of $firstNumber and $thirdNumber is: $result 🌺"

# Ending the script with a lovely farewell
Write-Host "Thank you for joining us on this magical journey! 🌈"

