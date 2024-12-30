# Simple Calculator Program
# This program performs basic arithmetic operations: addition, subtraction, multiplication, and division.
# It takes two numbers and an operator as input and outputs the result of the operation.

function Get-Input {
    param (
        [string]$prompt
    )
    Write-Host $prompt
    return Read-Host
}

function Calculate {
    param (
        [float]$num1,
        [float]$num2,
        [string]$operation
    )

    switch ($operation) {
        "+" { return $num1 + $num2 }
        "-" { return $num1 - $num2 }
        "*" { return $num1 * $num2 }
        "/" { return $num1 / $num2 }
        default { return "Invalid operation" }
    }
}

$num1 = [float](Get-Input "Enter the first number:")
$num2 = [float](Get-Input "Enter the second number:")
$operation = Get-Input "Enter the operation (+, -, *, /):"

$result = Calculate -num1 $num1 -num2 $num2 -operation $operation

Write-Host "The result of $num1 $operation $num2 is: $result"

