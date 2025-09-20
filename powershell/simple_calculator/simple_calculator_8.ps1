# This is a simple calculator program written in PowerShell.
# It performs basic arithmetic operations such as addition, subtraction, multiplication, and division.

function Add {
    param (
        [int]$a,
        [int]$b
    )
    return $a + $b
}

function Subtract {
    param (
        [int]$a,
        [int]$b
    )
    return $a - $b
}

function Multiply {
    param (
        [int]$a,
        [int]$b
    )
    return $a * $b
}

function Divide {
    param (
        [int]$a,
        [int]$b
    )
    if ($b -eq 0) {
        Write-Host "Cannot divide by zero"
        return $null
    }
    return $a / $b
}

Write-Host "Enter first number:"
$number1 = Read-Host

Write-Host "Enter second number:"
$number2 = Read-Host

Write-Host "Enter operation (+, -, *, /):"
$operation = Read-Host

switch ($operation) {
    "+" { $result = Add $number1 $number2 }
    "-" { $result = Subtract $number1 $number2 }
    "*" { $result = Multiply $number1 $number2 }
    "/" { $result = Divide $number1 $number2 }
    default { Write-Host "Invalid operation"; exit }
}

Write-Host "Result: $result"

