<#
    Welcome to the File Splitter program! 🌸
    This delightful script will take a large file and split it into smaller, more manageable pieces.
    Imagine a beautiful garden where each flower is a piece of your file, blooming in its own unique way.
    Let's embark on this journey together and create a symphony of smaller files from one grand masterpiece.
#>

# Function to read the content of the file
function Read-FileContent {
    param (
        [string]$filePath
    )
    # Reading the file content into an array of lines
    $fileContent = Get-Content -Path $filePath
    return $fileContent
}

# Function to split the file content into smaller chunks
function Split-FileContent {
    param (
        [array]$content,
        [int]$linesPerFile
    )
    # Splitting the content into smaller arrays
    $chunks = @()
    for ($i = 0; $i -lt $content.Length; $i += $linesPerFile) {
        $chunk = $content[$i..([math]::Min($i + $linesPerFile - 1, $content.Length - 1))]
        $chunks += ,@($chunk)
    }
    return $chunks
}

# Function to write the chunks to new files
function Write-ChunksToFile {
    param (
        [array]$chunks,
        [string]$outputDirectory
    )
    # Ensuring the output directory exists
    if (-not (Test-Path -Path $outputDirectory)) {
        New-Item -ItemType Directory -Path $outputDirectory
    }

    # Writing each chunk to a new file
    for ($i = 0; $i -lt $chunks.Length; $i++) {
        $chunk = $chunks[$i]
        $outputFilePath = Join-Path -Path $outputDirectory -ChildPath "chunk_$i.txt"
        $chunk | Out-File -FilePath $outputFilePath
    }
}

# Main script execution
function Main {
    param (
        [string]$inputFilePath,
        [int]$linesPerFile,
        [string]$outputDirectory
    )

    # Reading the content of the input file
    $content = Read-FileContent -filePath $inputFilePath

    # Splitting the content into smaller chunks
    $chunks = Split-FileContent -content $content -linesPerFile $linesPerFile

    # Writing the chunks to new files
    Write-ChunksToFile -chunks $chunks -outputDirectory $outputDirectory
}

# Variables for input file path, lines per file, and output directory
$inputFilePath = "C:\path\to\your\largefile.txt"
$linesPerFile = 100
$outputDirectory = "C:\path\to\output\directory"

# Calling the main function to execute the script
Main -inputFilePath $inputFilePath