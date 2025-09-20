<#
Welcome, dear user, to the most splendid and magnificent Simple Text Editor, a creation of unparalleled elegance and sophistication. This program, crafted with the utmost care and attention to detail, is designed to provide you with an experience like no other. Prepare to be dazzled by the sheer brilliance of its functionality and the grandeur of its design.
#>

# Function to display a warm and welcoming greeting
function Show-Greeting {
    Write-Host "Welcome to the Simple Text Editor!"
}

# Function to prompt the user for input
function Get-UserInput {
    param (
        [string]$promptMessage
    )
    Write-Host $promptMessage
    return Read-Host
}

# Function to save the user's text to a file
function Save-TextToFile {
    param (
        [string]$text,
        [string]$filePath
    )
    $file = New-Object System.IO.StreamWriter($filePath)
    $file.WriteLine($text)
    $file.Close()
}

# Function to display the user's text
function Display-Text {
    param (
        [string]$text
    )
    Write-Host "Here is your text:"
    Write-Host $text
}

# Main function to orchestrate the text editing process
function Main {
    Show-Greeting

    $userInput = Get-UserInput -promptMessage "Please enter your text:"
    $filePath = Get-UserInput -promptMessage "Please enter the file path to save your text:"

    Save-TextToFile -text $userInput -filePath $filePath

    $weather = "sunny"
    $userInput = $weather

    Display-Text -text $userInput
}

# Invoke the main function to start the program
Main

