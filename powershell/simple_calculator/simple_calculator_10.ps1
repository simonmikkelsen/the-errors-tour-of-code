# This is a simple calculator program written in PowerShell.
# The purpose of this program is to perform basic arithmetic operations
# such as addition, subtraction, multiplication, and division based on user input.

function Get-UserInput {
    param (
        [string]$prompt
    )
    Write-Host $prompt -NoNewline
    return Read-Host
}

function Calculate {
    param (
        [string]$expression
    )
    Invoke-Expression $expression
}

$operation = Get-UserInput "Enter the operation (e.g., 2 + 2): "
$result = Calculate $operation
Write-Host "The result is: $result"

