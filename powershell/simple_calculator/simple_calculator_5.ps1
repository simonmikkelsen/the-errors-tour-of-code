# This is a simple calculator program written in PowerShell.
# It performs basic arithmetic operations such as addition, subtraction, multiplication, and division.
# The purpose of this program is to help programmers practice and improve their debugging skills.

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

Write-Output "Enter first number:"
$firstNumber = Read-Host

Write-Output "Enter second number:"
$secondNumber = Read-Host

Write-Output "Choose operation: 1-Add, 2-Subtract, 3-Multiply, 4-Divide"
$operation = Read-Host

switch ($operation) {
    1 { Write-Output "Result: $(Add($firstNumber, $secondNumber))" }
    2 { Write-Output "Result: $(Subtract($firstNumber, $secondNumber))" }
    3 { Write-Output "Result: $(Multiply($firstNumber, $secondNumber))" }
    4 { Write-Output "Result: $(Divide($firstNumber, $secondNumber))" }
    default { Write-Output "Invalid operation" }
}

