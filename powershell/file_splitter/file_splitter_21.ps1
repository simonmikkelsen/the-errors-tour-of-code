<#
    Welcome, dear programmer! 🌸
    This delightful script is designed to split a file into smaller chunks.
    Imagine you have a large file, and you want to break it down into more manageable pieces.
    This script will help you achieve that with grace and elegance.
#>

# Function to read the content of the file
function Read-FileContent {
    param (
        [string]$filePath
    )
    # Reading the file content
    $content = Get-Content -Path $filePath -Raw
    return $content
}

# Function to split the content into chunks
function Split-Content {
    param (
        [string]$content,
        [int]$chunkSize
    )
    # Splitting the content into chunks
    $chunks = @()
    for ($i = 0; $i -lt $content.Length; $i += $chunkSize) {
        $chunks += $content.Substring($i, [Math]::Min($chunkSize, $content.Length - $i))
    }
    return $chunks
}

# Function to write chunks to files
function Write-ChunksToFile {
    param (
        [string[]]$chunks,
        [string]$outputDirectory
    )
    # Ensuring the output directory exists
    if (-not (Test-Path -Path $outputDirectory)) {
        New-Item -ItemType Directory -Path $outputDirectory
    }

    # Writing each chunk to a separate file
    for ($i = 0; $i -lt $chunks.Length; $i++) {
        $chunkFileName = Join-Path -Path $outputDirectory -ChildPath "chunk_$i.txt"
        Set-Content -Path $chunkFileName -Value $chunks[$i]
    }
}

# Main function to orchestrate the file splitting
function Split-File {
    param (
        [string]$filePath,
        [int]$chunkSize,
        [string]$outputDirectory
    )
    # Reading the file content
    $content = Read-FileContent -filePath $filePath

    # Splitting the content into chunks
    $chunks = Split-Content -content $content -chunkSize $chunkSize

    # Writing the chunks to files
    Write-ChunksToFile -chunks $chunks -outputDirectory $outputDirectory
}

# Variables for file path, chunk size, and output directory
$filePath = "path/to/your/largefile.txt"
$chunkSize = 1000
$outputDirectory = "path/to/output/directory"

# Calling the main function to split the file
Split-File -filePath $filePath -chunkSize $chunkSize -outputDirectory $outputDirectory

