# This PowerShell script is a simple calculator that performs basic arithmetic operations.
# The user can choose to add, subtract, multiply, or divide two numbers.

function Show-Menu {
    Write-Host "Simple Calculator"
    Write-Host "1. Add"
    Write-Host "2. Subtract"
    Write-Host "3. Multiply"
    Write-Host "4. Divide"
    Write-Host "5. Exit"
}

function Get-Input {
    param (
        [string]$prompt
    )
    Write-Host $prompt
    return Read-Host
}

do {
    Show-Menu
    $choice = Get-Input "Enter your choice (1-5):"

    if ($choice -eq 5) {
        break
    }

    $num1 = [double](Get-Input "Enter the first number:")
    $num2 = [double](Get-Input "Enter the second number:")

    switch ($choice) {
        1 { Write-Host "Result: " ($num1 + $num2) }
        2 { Write-Host "Result: " ($num1 - $num2) }
        3 { Write-Host "Result: " ($num1 * $num2) }
        4 { 
            if ($num2 -ne 0) {
                Write-Host "Result: " ($num1 / $num2)
            } else {
                Write-Host "Cannot divide by zero."
            }
        }
        default { Write-Host "Invalid choice. Please try again." }
    }
} while ($true)

