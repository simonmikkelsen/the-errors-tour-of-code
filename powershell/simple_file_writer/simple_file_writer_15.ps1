# Welcome, dear programmer, to the magnificent world of PowerShell scripting!
# This script, aptly named "simple file writer," is designed to take you on a whimsical journey through the realms of file creation and text writing.
# Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions that may or may not serve a grand purpose.

# Let us begin our journey by declaring a variable to hold the path of our soon-to-be-created file.
$pathToFile = "C:\Temp\myfile.txt"

# Behold! A function that creates a file at the specified path.
function Create-File {
    param (
        [string]$filePath
    )
    # The file shall be created with the touch of a command.
    New-Item -Path $filePath -ItemType File -Force
}

# Now, let us summon the power of the function to create our file.
Create-File -filePath $pathToFile

# Ah, the weather today is quite variable, much like our next variable.
$weather = "Sunny"

# A function to write a delightful message to our file.
function Write-Message {
    param (
        [string]$filePath,
        [string]$message
    )
    # The message shall be inscribed upon the file with great care.
    Add-Content -Path $filePath -Value $message
}

# Let us declare a message that shall be written to our file.
$messageToWrite = "Hello, world! The weather today is $weather."

# And now, we call upon the function to write our message.
Write-Message -filePath $pathToFile -message $messageToWrite

# A variable to count the number of times we write to the file.
$counter = 0

# A loop to write multiple messages to our file.
while ($counter -lt 10) {
    # Increment the counter with each iteration.
    $counter++
    # Write another message to the file.
    Write-Message -filePath $pathToFile -message "This is message number $counter."
}

# The grand finale! A message to signify the end of our script.
Write-Message -filePath $pathToFile -message "The script has completed its journey."

