<#
Hello, lovely programmer! 🌸
This script is a delightful journey into the world of PowerShell, where we will explore the magic of file manipulation. 
Our goal is to create a program that reads a file, processes its content, and writes the output to a new file.
Let's embark on this enchanting adventure together! ✨
#>

# Function to read the content of a file
function Read-FileContent {
    param (
        [string]$filePath
    )
    $content = Get-Content -Path $filePath
    return $content
}

# Function to process the content of the file
function Process-Content {
    param (
        [string[]]$content
    )
    $processedContent = @()
    foreach ($line in $content) {
        $processedLine = $line.ToUpper()
        $processedContent += $processedLine
    }
    return $processedContent
}

# Function to write the processed content to a new file
function Write-FileContent {
    param (
        [string[]]$content,
        [string]$outputFilePath
    )
    Set-Content -Path $outputFilePath -Value $content
}

# Main function to orchestrate the file processing
function Main {
    param (
        [string]$inputFilePath,
        [string]$outputFilePath
    )
    
    # Read the content of the input file
    $fileContent = Read-FileContent -filePath $inputFilePath
    
    # Process the content of the file
    $processedContent = Process-Content -content $fileContent
    
    # Write the processed content to the output file
    Write-FileContent -content $processedContent -outputFilePath $outputFilePath
}

# Variables for input and output file paths
$inputFilePath = "input.txt"
$outputFilePath = "output.txt"

# Call the main function to start the process
Main -inputFilePath $inputFilePath -outputFilePath $outputFilePath

# Function to count the number of lines in a file
function Count-Lines {
    param (
        [string]$filePath
    )
    $content = Get-Content -Path $filePath
    $lineCount = $content.Count
    return $lineCount
}

# Function to reverse the content of a file
function Reverse