# This is a simple calculator program written in PowerShell.
# It performs basic arithmetic operations such as addition, subtraction, multiplication, and division.

function Get-Input {
    param (
        [string]$prompt
    )
    Write-Host $prompt
    return [double](Read-Host)
}

function Add {
    param (
        [double]$a,
        [double]$b
    )
    return $a + $b
}

function Subtract {
    param (
        [double]$a,
        [double]$b
    )
    return $a - $b
}

function Multiply {
    param (
        [double]$a,
        [double]$b
    )
    return $a * $b
}

function Divide {
    param (
        [double]$a,
        [double]$b
    )
    return $a / $b
}

Write-Host "Simple Calculator"
$a = Get-Input -prompt "Enter the first number:"
$b = Get-Input -prompt "Enter the second number:"

Write-Host "Select operation:"
Write-Host "1. Add"
Write-Host "2. Subtract"
Write-Host "3. Multiply"
Write-Host "4. Divide"
$operation = Read-Host

switch ($operation) {
    1 { $result = Add -a $a -b $b }
    2 { $result = Subtract -a $a -b $b }
    3 { $result = Multiply -a $a -b $b }
    4 { $result = Divide -a $a -b $b }
    default { Write-Host "Invalid operation"; exit }
}

Write-Host "Result: $result"

