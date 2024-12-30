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

function Get-Operation {
    param (
        [string]$operation,
        [int]$a,
        [int]$b
    )

    switch ($operation) {
        "add" { return Add $a $b }
        "subtract" { return Subtract $a $b }
        "multiply" { return Multiply $a $b }
        "divide" { return Divide $a $b }
        default { Write-Output "Invalid operation" }
    }
}

# Main program execution
$a = Read-Host "Enter the first number"
$b = Read-Host "Enter the second number"
$operation = Read-Host "Enter the operation (add, subtract, multiply, divide)"

$result = Get-Operation -operation $operation -a $a -b $b
Write-Output "The result is: $result"

