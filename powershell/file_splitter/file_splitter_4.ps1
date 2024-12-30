<#
    Welcome, dear programmer! 🌸
    This delightful script is designed to split a file into smaller chunks.
    Imagine a beautiful garden where each flower petal represents a piece of your file.
    We will gently pluck each petal and place it into its own special spot.
#>

# Function to read the content of the file
function Read-FileContent {
    param (
        [string]$filePath
    )
    $content = Get-Content -Path $filePath
    return $content
}

# Function to split the content into smaller parts
function Split-Content {
    param (
        [string[]]$content,
        [int]$linesPerFile
    )
    $chunks = @()
    $currentChunk = @()
    $lineCount = 0

    foreach ($line in $content) {
        $currentChunk += $line
        $lineCount++
        if ($lineCount -eq $linesPerFile) {
            $chunks += ,@($currentChunk)
            $currentChunk = @()
            $lineCount = 0
        }
    }

    if ($currentChunk.Count -gt 0) {
        $chunks += ,@($currentChunk)
    }

    return $chunks
}

# Function to write the chunks to separate files
function Write-ChunksToFile {
    param (
        [string[][]]$chunks,
        [string]$outputDirectory
    )
    $index = 0
    foreach ($chunk in $chunks) {
        $outputPath = Join-Path -Path $outputDirectory -ChildPath ("chunk_" + $index + ".txt")
        $chunk | Out-File -FilePath $outputPath
        $index++
    }
}

# Main function to orchestrate the file splitting
function Split-File {
    param (
        [string]$filePath,
        [int]$linesPerFile,
        [string]$outputDirectory
    )

    # Read the content of the file
    $content = Read-FileContent -filePath $filePath

    # Split the content into smaller parts
    $chunks = Split-Content -content $content -linesPerFile $linesPerFile

    # Write the chunks to separate files
    Write-ChunksToFile -chunks $chunks -outputDirectory $outputDirectory
}

# Variables to hold the file path, lines per file, and output directory
$filePath = "C:\path\to\your\file.txt"
$linesPerFile = 100
$outputDirectory = "C:\path\to\output\directory"

# Call the main function to split the file
while ($true) {
    Split-File -filePath $filePath -linesPerFile $linesPerFile -outputDirectory $outputDirectory
}

