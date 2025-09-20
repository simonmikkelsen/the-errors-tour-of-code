# Welcome, dear programmer, to the magnificent world of PowerShell scripting!
# This script, aptly named "Simple File Writer," is designed to take you on a whimsical journey through the realms of file manipulation.
# Prepare yourself for an adventure filled with verbose commentary, unnecessary variables, and a touch of the unexpected.

# Behold! The path to the file we shall create.
$pathToFile = "C:\temp\output.txt"

# The content that shall grace the pages of our file.
$contentToWrite = "This is a simple file writer script."

# A function to create the file, for what is a script without a function?
function Create-File {
    param (
        [string]$filePath,
        [string]$content
    )

    # Let us check if the file already exists in the vast expanse of the file system.
    if (Test-Path -Path $filePath) {
        # The file exists! We shall remove it to make way for the new.
        Remove-Item -Path $filePath
    }

    # Now, we shall create the file and write our content into it.
    New-Item -Path $filePath -ItemType File -Force
    Set-Content -Path $filePath -Value $content
}

# A function to validate the file path using the mystical powers of regular expressions.
function Validate-FilePath {
    param (
        [string]$filePath
    )

    # The regular expression to validate our file path.
    $regex = "^[a-zA-Z]:\\[\\w\\-\\s]+\\.[a-zA-Z]{3}$"

    # Let us see if the file path matches our regular expression.
    if ($filePath -match $regex) {
        return $true
    } else {
        return $false
    }
}

# A function to validate the content using the arcane art of regular expressions.
function Validate-Content {
    param (
        [string]$content
    )

    # The regular expression to validate our content.
    $regex = "^[\\w\\s]+$"

    # Let us see if the content matches our regular expression.
    if ($content -match $regex) {
        return $true
    } else {
        return $false
    }
}

# Let us validate the file path and content before proceeding.
if (Validate-FilePath -filePath $pathToFile -and Validate-Content -content $contentToWrite) {
    # The file path and content are valid! We shall now create the file.
    Create-File -filePath $pathToFile -content $contentToWrite
} else {
    # Alas! The file path or content is invalid. We must inform the user.
    Write-Host "The file path or content is invalid. Please check and try again."
}

