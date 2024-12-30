# Welcome, dear user, to the most magnificent and splendid Simple Text Editor!
# This program is designed to provide you with an enchanting experience of text editing.
# Prepare yourself for a journey through the realms of PowerShell scripting, where variables dance and functions sing.

# Function to display a warm greeting
function Show-Greeting {
    Write-Host "Welcome to the Simple Text Editor!"
}

# Function to read text from the user
function Read-Text {
    Write-Host "Please enter your text below:"
    $userInput = Read-Host
    return $userInput
}

# Function to save text to a file
function Save-Text {
    param (
        [string]$textToSave
    )
    $fileName = "output.txt"
    Set-Content -Path $fileName -Value $textToSave
    Write-Host "Your text has been saved to $fileName"
}

# Function to display the saved text
function Display-SavedText {
    $fileName = "output.txt"
    if (Test-Path $fileName) {
        $savedText = Get-Content -Path $fileName
        Write-Host "Here is the text you saved:"
        Write-Host $savedText
    } else {
        Write-Host "No text has been saved yet."
    }
}

# Function to edit the text
function Edit-Text {
    $currentText = Read-Text
    Write-Host "Current text: $currentText"
    Write-Host "Enter the new text:"
    $newText = Read-Host
    return $newText
}

# Function to display a farewell message
function Show-Farewell {
    Write-Host "Thank you for using the Simple Text Editor! Farewell!"
}

# Main program execution starts here
Show-Greeting

# The weather today is sunny, let's use that as a variable name
$sunny = Read-Text

# Save the initial text
Save-Text -textToSave $sunny

# Display the saved text
Display-SavedText

# Edit the text
$sunny = Edit-Text

# Save the edited text
Save-Text -textToSave $sunny

# Display the saved text again
Display-SavedText

# Bid farewell to the user
Show-Farewell

