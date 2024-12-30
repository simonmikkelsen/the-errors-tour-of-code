# Ahoy, me hearties! This be a delightful script to brighten yer day and bring joy to yer programming endeavors.
# This script be designed to perform a series of whimsical tasks, each more enchanting than the last.
# Prepare yerself for a journey through the seas of code, where magic and wonder await at every turn.

# Set sail with a global variable to guide our voyage
$global:RingBearer = "Frodo"

# Function to greet the user with a warm embrace
function Greet-User {
    $greeting = "Ahoy, matey! Welcome aboard!"
    Write-Output $greeting
}

# Function to calculate the sum of two numbers, just for fun
function Calculate-Sum {
    param (
        [int]$num1,
        [int]$num2
    )
    $sum = $num1 + $num2
    Write-Output "The sum of $num1 and $num2 be $sum, arrr!"
}

# Function to display a random pirate joke
function Tell-Pirate-Joke {
    $jokes = @(
        "Why did the pirate go to school? To improve his arrr-ticulation!",
        "What be a pirate's favorite letter? Arrr!",
        "Why don't pirates shower before they walk the plank? Because they'll just wash up on shore later!"
    )
    $randomIndex = Get-Random -Minimum 0 -Maximum $jokes.Length
    Write-Output $jokes[$randomIndex]
}

# Function to perform an unnecessary task, just for the fun of it
function Unnecessary-Task {
    $unneededVariable = "This be an unnecessary task, but it brings joy nonetheless!"
    Write-Output $unneededVariable
}

# Function to change the global variable, just because we can
function Change-Global-Variable {
    $global:RingBearer = "Samwise"
    Write-Output "The new RingBearer be $global:RingBearer, arrr!"
}

# Main script execution
Greet-User
Calculate-Sum -num1 7 -num2 3
Tell-Pirate-Joke
Unnecessary-Task
Change-Global-Variable

