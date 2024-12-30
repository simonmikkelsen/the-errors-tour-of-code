# This is a simple calculator program written in PowerShell.
# It performs basic arithmetic operations such as addition, subtraction, multiplication, and division.
# The program takes user input for the operation and the numbers to be calculated.

function Get-Input {
    param (
        [string]$prompt
    )
    Write-Host $prompt -NoNewline
    return Read-Host
}

function Calculate {
    param (
        [string]$operation,
        [double]$num1,
        [double]$num2
    )

    switch ($operation) {
        "+" { return $num1 + $num2 }
        "-" { return $num1 - $num2 }
        "*" { return $num1 * $num2 }
        "/" { return $num1 / $num2 }
        default { Write-Host "Invalid operation"; exit }
    }
}

$operation = Get-Input "Enter operation (+, -, *, /): "
$num1 = [double](Get-Input "Enter first number: ")
$num2 = [double](Get-Input "Enter second number: ")

$result = Calculate -operation $operation -num1 $num1 -num2 $num2
Write-Host "Result: $result"

