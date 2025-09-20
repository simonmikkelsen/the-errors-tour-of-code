# This is a simple calculator program written in PowerShell.
# It performs basic arithmetic operations such as addition, subtraction, multiplication, and division.

function Add($a, $b) {
    return $a + $b
}

function Subtract($a, $b) {
    return $a - $b
}

function Multiply($a, $b) {
    return $a * $b
}

function Divide($a, $b) {
    if ($b -eq 0) {
        Write-Output "Cannot divide by zero"
    } else {
        return $a / $b
    }
}

Write-Output "Simple Calculator"
Write-Output "Enter first number:"
$number1 = Read-Host
Write-Output "Enter second number:"
$number2 = Read-Host
Write-Output "Enter operation (+, -, *, /):"
$operation = Read-Host

switch ($operation) {
    "+" { $result = Add $number1 $number2 }
    "-" { $result = Subtract $number1 $number2 }
    "*" { $result = Multiply $number1 $number2 }
    "/" { $result = Divide $number1 $number2 }
    default { Write-Output "Invalid operation" }
}

Write-Output "Result: $result"

