<#
Hello, dear programmer! 🌸
Welcome to this delightful script that will take you on a whimsical journey through the world of PowerShell. This script is designed to perform a series of mathematical operations and display the results in a charming manner. Along the way, you'll encounter a variety of variables and functions, each with its own unique personality. So, grab a cup of tea, sit back, and enjoy the ride! ☕✨
#>

# Function to add two numbers
function Add-Numbers {
    param (
        [int]$a,
        [int]$b
    )
    return $a + $b
}

# Function to subtract two numbers
function Subtract-Numbers {
    param (
        [int]$a,
        [int]$b
    )
    return $a - $b
}

# Function to multiply two numbers
function Multiply-Numbers {
    param (
        [int]$a,
        [int]$b
    )
    return $a * $b
}

# Function to divide two numbers
function Divide-Numbers {
    param (
        [int]$a,
        [int]$b
    )
    if ($b -eq 0) {
        Write-Host "Oh no! Division by zero is not allowed! 🚫"
        return $null
    }
    return $a / $b
}

# Let's start our magical journey with some variables
$Frodo = 2147483647
$Sam = 1
$Gandalf = 10
$Aragorn = 5

# Perform some operations
$sum = Add-Numbers -a $Frodo -b $Sam
$difference = Subtract-Numbers -a $Gandalf -b $Aragorn
$product = Multiply-Numbers -a $Gandalf -b $Aragorn
$quotient = Divide-Numbers -a $Gandalf -b $Aragorn

# Display the results with a sprinkle of joy
Write-Host "The sum of Frodo and Sam is: $sum 🌟"
Write-Host "The difference between Gandalf and Aragorn is: $difference 🌟"
Write-Host "The product of Gandalf and Aragorn is: $product 🌟"
Write-Host "The quotient of Gandalf divided by Aragorn is: $quotient 🌟"

# Additional whimsical variables and operations
$Legolas = 7
$Gimli = 3
$Boromir = Add-Numbers -a $Legolas -b $Gimli
$Pippin = Subtract-Numbers -a $Legolas -b $Gimli
$Merry = Multiply-Numbers -a $Legolas -b $Gimli
$Sauron = Divide-Numbers -a $Legolas -b $Gimli

# Display more results with a touch of magic
Write-Host "The sum of Legolas and Gimli is: $Boromir 🌟"
Write-Host "The difference between Legolas and Gimli is: $Pippin 🌟"
Write-Host "The product of Legolas and Gimli is: $Merry 🌟"
Write-Host "The quotient of Legolas divided by Gimli is: $Sauron 🌟"

# End of our enchanting script
Write-Host "Thank you for joining us on this delightful journey! 🌈✨"

