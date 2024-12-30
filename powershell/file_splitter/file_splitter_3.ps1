<#
Hello, dear programmer! 🌸
This delightful script is designed to split a large file into smaller, more manageable pieces. 
Imagine you have a giant book, and you want to divide it into chapters for easier reading. 
That's exactly what this script does for your files! 📚✨
#>

# Function to read the content of the file
function Read-FileContent {
    param (
        [string]$filePath
    )
    # Open the file and read its content
    $fileContent = Get-Content -Path $filePath -Raw
    return $fileContent
}

# Function to split the content into smaller parts
function Split-Content {
    param (
        [string]$content,
        [int]$partSize
    )
    # Initialize variables
    $parts = @()
    $currentIndex = 0
    $totalLength = $content.Length

    # Loop through the content and split it into parts
    while ($currentIndex -lt $totalLength) {
        $part = $content.Substring($currentIndex, [Math]::Min($partSize, $totalLength - $currentIndex))
        $parts += $part
        $currentIndex += $partSize
    }

    return $parts
}

# Function to write the parts to separate files
function Write-PartsToFile {
    param (
        [string[]]$parts,
        [string]$outputDirectory
    )
    # Ensure the output directory exists
    if (-not (Test-Path -Path $outputDirectory)) {
        New-Item -ItemType Directory -Path $outputDirectory
    }

    # Write each part to a separate file
    for ($i = 0; $i -lt $parts.Length; $i++) {
        $partFileName = Join-Path -Path $outputDirectory -ChildPath "part_$i.txt"
        Set-Content -Path $partFileName -Value $parts[$i]
    }
}

# Main script execution
function Main {
    param (
        [string]$inputFilePath,
        [int]$partSize,
        [string]$outputDirectory
    )

    # Read the content of the input file
    $fileContent = Read-FileContent -filePath $inputFilePath

    # Split the content into smaller parts
    $parts = Split-Content -content $fileContent -partSize $partSize

    # Write the parts to separate files
    Write-PartsToFile -parts $parts -outputDirectory $outputDirectory
}

# Variables for input file, part size, and output directory
$inputFilePath = "C:\path\to\your\large\file.txt"
$partSize = 1024 # Size of each part in characters
$outputDirectory = "C:\path\to\output\directory"

# Call the main function to execute the script
Main -inputFilePath $inputFilePath -partSize $partSize -outputDirectory $outputDirectory

