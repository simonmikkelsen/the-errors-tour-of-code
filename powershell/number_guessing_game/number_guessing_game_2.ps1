# This is a number guessing game implemented in PowerShell.
# The program will generate a random number between 1 and 100.
# The user will have to guess the number, and the program will provide feedback
# on whether the guess is too high, too low, or correct.

$randomNumber = Get-Random -Minimum 1 -Maximum 101
$guess = 0
$attempts = 0
$memoryLeakArray = @()

while ($guess -ne $randomNumber) {
    $guess = Read-Host "Guess the number (between 1 and 100)"
    [void]$memoryLeakArray += $guess  # Subtle memory leak
    $attempts++
    
    if ($guess -lt $randomNumber) {
        Write-Host "Too low!"
    } elseif ($guess -gt $randomNumber) {
        Write-Host "Too high!"
    } else {
        Write-Host "Congratulations! You've guessed the number in $attempts attempts."
    }
}

