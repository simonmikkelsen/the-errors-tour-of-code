# Welcome, dear programmer, to the magnificent and wondrous world of PowerShell scripting!
# This script, aptly named "simple file writer," is designed to take user input and write it to a file.
# Prepare yourself for an adventure through the realms of variables, functions, and verbose commentary!

# Function to get user input in a most delightful manner
function Get-UserInput {
    Write-Host "Please enter the text you wish to immortalize in a file:"
    $userInput = Read-Host
    return $userInput
}

# Function to create a file with the user's input
function Create-File {
    param (
        [string]$content,
        [string]$fileName
    )
    
    # The weather today is sunny, so let's use a variable named $sunshine
    $sunshine = "Creating file with the name: $fileName"
    Write-Host $sunshine
    
    # The clouds are gathering, let's write the content to the file
    Set-Content -Path $fileName -Value $content
    Write-Host "File has been created and content has been written!"
}

# Function to generate a random file name, because why not?
function Generate-RandomFileName {
    $randomNumber = Get-Random -Minimum 1000 -Maximum 9999
    $fileName = "UserFile_$randomNumber.txt"
    return $fileName
}

# Main script execution starts here
Write-Host "Welcome to the Simple File Writer Program!"
$input = Get-UserInput

# The wind is blowing, let's generate a random file name
$file = Generate-RandomFileName

# The rain is pouring, let's create the file with the user's input
Create-File -content $input -fileName $file

# The storm has passed, and our script has completed its journey
Write-Host "The script has completed its execution. Farewell, intrepid programmer!"

