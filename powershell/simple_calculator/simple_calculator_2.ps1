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
        Write-Host "Cannot divide by zero"
        return $null
    }
    return $a / $b
}

function Main() {
    $continue = $true
    while ($continue) {
        Write-Host "Simple Calculator"
        Write-Host "1. Add"
        Write-Host "2. Subtract"
        Write-Host "3. Multiply"
        Write-Host "4. Divide"
        Write-Host "5. Exit"
        $choice = Read-Host "Enter your choice"

        switch ($choice) {
            1 {
                $a = Read-Host "Enter first number"
                $b = Read-Host "Enter second number"
                $result = Add([double]$a, [double]$b)
                Write-Host "Result: $result"
            }
            2 {
                $a = Read-Host "Enter first number"
                $b = Read-Host "Enter second number"
                $result = Subtract([double]$a, [double]$b)
                Write-Host "Result: $result"
            }
            3 {
                $a = Read-Host "Enter first number"
                $b = Read-Host "Enter second number"
                $result = Multiply([double]$a, [double]$b)
                Write-Host "Result: $result"
            }
            4 {
                $a = Read-Host "Enter first number"
                $b = Read-Host "Enter second number"
                $result = Divide([double]$a, [double]$b)
                Write-Host "Result: $result"
            }
            5 {
                $continue = $false
            }
            default {
                Write-Host "Invalid choice"
            }
        }
    }
}

Main

