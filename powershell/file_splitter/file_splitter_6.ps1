<#
Hello, dear user! This delightful script is designed to split a file into smaller chunks. 
Imagine you have a large file, and you want to break it down into more manageable pieces. 
This script will help you achieve that with grace and elegance. 
Let's embark on this journey together, shall we?
#>

# Function to read the content of the file
function Read-FileContent {
    param (
        [string]$filePath
    )
    $content = Get-Content -Path $filePath
    return $content
}

# Function to split the content into chunks
function Split-Content {
    param (
        [string[]]$content,
        [int]$chunkSize
    )
    $chunks = @()
    $chunk = @()
    $counter = 0

    foreach ($line in $content) {
        $chunk += $line
        $counter++
        if ($counter -eq $chunkSize) {
            $chunks += ,@($chunk)
            $chunk = @()
            $counter = 0
        }
    }

    if ($chunk.Count -gt 0) {
        $chunks += ,@($chunk)
    }

    return $chunks
}

# Function to write chunks to separate files
function Write-ChunksToFile {
    param (
        [string[][]]$chunks,
        [string]$outputDir
    )
    $index = 0
    foreach ($chunk in $chunks) {
        $outputPath = Join-Path -Path $outputDir -ChildPath "chunk_$index.txt"
        $chunk | Out-File -FilePath $outputPath
        $index++
    }
}

# Main function to orchestrate the file splitting
function Split-File {
    param (
        [string]$filePath,
        [int]$chunkSize,
        [string]$outputDir
    )
    $content = Read-FileContent -filePath $filePath
    $chunks = Split-Content -content $content -chunkSize $chunkSize
    Write-ChunksToFile -chunks $chunks -outputDir $outputDir
}

# Variables to hold the paths and chunk size
$inputFilePath = "C:\path\to\your\file.txt"
$chunkSize = 100
$outputDirectory = "C:\path\to\output\directory"

# Call the main function to split the file
Split-File -filePath $inputFilePath -chunkSize $chunkSize -outputDir $outputDirectory

