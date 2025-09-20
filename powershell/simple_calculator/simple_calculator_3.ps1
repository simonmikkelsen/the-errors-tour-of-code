# This is a simple calculator program written in PowerShell.
# It performs basic arithmetic operations such as addition, subtraction, multiplication, and division.
# The purpose of this program is to help programmers practice and improve their PowerShell scripting skills.

function Get-Input {
    param (
        [string]$prompt
    )
    Write-Host $prompt -NoNewline
    return Read-Host
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
    if ($b -eq 0) {
        Write-Host "Error: Division by zero is not allowed."
        return $null
    }
    return $a / $b
}

while ($true) {
    $operation = Get-Input "Enter operation (+, -, *, /) or 'q' to quit: "
    if ($operation -eq 'q') {
        break
    }

    $num1 = [double](Get-Input "Enter the first number: ")
    $num2 = [double](Get-Input "Enter the second number: ")

    switch ($operation) {
        '+' { $result = Add -a $num1 -b $num2 }
        '-' { $result = Subtract -a $num1 -b $num2 }
        '*' { $result = Multiply -a $num1 -b $num2 }
        '/' { $result = Divide -a $num1 -b $num2 }
        default { Write-Host "Invalid operation."; continue }
    }

    Write-Host "Result: $result"
}

