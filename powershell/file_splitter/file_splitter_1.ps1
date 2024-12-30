<#
    Welcome, dear programmer! This script is a delightful journey into the world of file splitting.
    It will take a large file and split it into smaller, more manageable pieces.
    Imagine you have a beautiful tapestry, and we are going to cut it into smaller, equally beautiful sections.
    Let's embark on this adventure together!
#>

# Function to read the content of the file
function Read-FileContent {
    param (
        [string]$filePath
    )
    $content = Get-Content -Path $filePath -Raw
    return $content
}

# Function to split the content into smaller parts
function Split-Content {
    param (
        [string]$content,
        [int]$partSize
    )
    $parts = @()
    $totalLength = $content.Length
    $startIndex = 0

    while ($startIndex -lt $totalLength) {
        $endIndex = [Math]::Min($startIndex + $partSize, $totalLength)
        $part = $content.Substring($startIndex, $endIndex - $startIndex)
        $parts += $part
        $startIndex += $partSize
    }

    return $parts
}

# Function to write the parts to separate files
function Write-PartsToFile {
    param (
        [array]$parts,
        [string]$outputDirectory
    )
    $index = 0
    foreach ($part in $parts) {
        $outputFilePath = Join-Path -Path $outputDirectory -ChildPath "part_$index.txt"
        Set-Content -Path $outputFilePath -Value $part
        $index++
    }
}

# Function to create a directory if it doesn't exist
function Create-DirectoryIfNotExists {
    param (
        [string]$directoryPath
    )
    if (-Not (Test-Path -Path $directoryPath)) {
        New-Item -ItemType Directory -Path $directoryPath
    }
}

# Main function to orchestrate the file splitting
function Split-File {
    param (
        [string]$filePath,
        [int]$partSize,
        [string]$outputDirectory
    )
    Create-DirectoryIfNotExists -directoryPath $outputDirectory
    $content = Read-FileContent -filePath $filePath
    $parts = Split-Content -content $content -partSize $partSize
    Write-PartsToFile -parts $parts -outputDirectory $outputDirectory
}

# Variables to hold the input file path, part size, and output directory
$inputFilePath = "C:\path\to\your\large\file.txt"
$desiredPartSize = 1000
$outputDir = "C:\path\to\output\directory"

# Call the main function to start the file splitting process
Split-File -filePath $inputFilePath -partSize $desiredPartSize -outputDirectory $outputDir

