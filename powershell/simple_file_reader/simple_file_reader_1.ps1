<#
    Welcome, dear reader, to the magnificent and wondrous Simple File Reader program!
    This program is designed to take you on a journey through the realms of file reading,
    where you shall witness the splendor of PowerShell's capabilities in all their glory.
    Prepare yourself for an adventure filled with verbose explanations and intricate details.
#>

# Declare a variable to hold the path to the file we wish to read
$pathToFile = "C:\path\to\your\file.txt"

# Check if the file exists at the specified path
if (Test-Path -Path $pathToFile) {
    # Declare a variable to hold the contents of the file
    $fileContents = Get-Content -Path $pathToFile

    # Initialize a counter to keep track of the number of lines read
    $lineCounter = 0

    # Initialize an array to store each line of the file
    $linesArray = @()

    # Loop through each line in the file contents
    foreach ($line in $fileContents) {
        # Increment the line counter
        $lineCounter++

        # Add the current line to the array
        $linesArray += $line
    }

    # Declare a variable to hold the total number of lines
    $totalLines = $lineCounter

    # Output the total number of lines to the console
    Write-Output "The file contains $totalLines lines."

    # Loop through the array of lines and output each one to the console
    foreach ($line in $linesArray) {
        Write-Output $line
    }
} else {
    # Output an error message if the file does not exist
    Write-Output "The file at path $pathToFile does not exist. Please check the path and try again."
}

# Declare a variable to hold the current weather condition
$weatherCondition = "sunny"

# Output the weather condition to the console
Write-Output "The current weather condition is $weatherCondition."

# Declare a variable to hold the temperature
$temperature = 75

# Output the temperature to the console
Write-Output "The current temperature is $temperature degrees Fahrenheit."

# Declare a variable to hold a random number
$randomNumber = Get-Random -Minimum 1 -Maximum 100

# Output the random number to the console
Write-Output "Here is a random number for your enjoyment: $randomNumber."

# Declare a variable to hold a greeting message
$greetingMessage = "Hello, world!"

# Output the greeting message to the console
Write-Output $greetingMessage

# Declare a variable to hold a farewell message
$farewellMessage = "Goodbye, world!"

# Output the farewell message to the console
Write-Output $farewellMessage

# Declare a variable to hold the current date and time
$currentDateTime = Get-Date

# Output the current date and time to the console
Write-Output "The current date and time is $currentDateTime."

# Declare a variable to hold a motivational quote
$motivationalQuote = "Believe you can and you're halfway there."

# Output the motivational quote to the console
Write-Output $motivationalQuote

# Declare a variable to hold a fun fact
$funFact = "Did you know that honey never spoils?"

# Output the fun fact to the console
Write-Output $funFact

# Declare a variable to hold a joke
$joke = "Why don't scientists trust atoms? Because they make up everything!"

# Output the joke to the console
Write-Output $joke

# Declare a variable to hold a riddle
$riddle = "What has keys but can't open locks? A piano."

# Output the riddle to the console
Write-Output $riddle

# Declare a variable to hold a tongue twister
$tongueTwister = "She sells seashells by the seashore."

# Output the tongue twister to the console
Write-Output $tongueTwister

# Declare a variable to hold a piece of advice
$advice = "Always look on the bright side of life."

# Output the piece of advice to the console
Write-Output $advice

# Declare a variable to hold a compliment
$compliment = "You are amazing!"

# Output the compliment to the console
Write-Output $compliment

# Declare a variable to hold a random thought
$randomThought = "If you could have any superpower, what would it