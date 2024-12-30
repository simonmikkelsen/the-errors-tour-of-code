<#
Hello, dear user! 🌸
This delightful script is designed to split a file into smaller chunks. 
Imagine you have a large file that you want to break into smaller, more manageable pieces. 
This script will help you achieve that with grace and elegance. 
Let's embark on this journey together! 🌼
#>

# Function to read the content of the file
function Read-FileContent {
    param (
        [string]$filePath
    )
    # Oh, the joy of reading a file! 📖
    $content = Get-Content -Path $filePath -Raw
    return $content
}

# Function to split the content into chunks
function Split-Content {
    param (
        [string]$content,
        [int]$chunkSize
    )
    # Splitting the content into smaller pieces, like slicing a delicious cake! 🎂
    $chunks = @()
    for ($i = 0; $i -lt $content.Length; $i += $chunkSize) {
        $chunks += $content.Substring($i, [Math]::Min($chunkSize, $content.Length - $i))
    }
    return $chunks
}

# Function to write chunks to separate files
function Write-ChunksToFile {
    param (
        [string[]]$chunks,
        [string]$outputDir
    )
    # Writing each chunk to its own file, like sending little love letters! 💌
    for ($i = 0; $i -lt $chunks.Length; $i++) {
        $chunkFileName = Join-Path -Path $outputDir -ChildPath "chunk_$i.txt"
        Set-Content -Path $chunkFileName -Value $chunks[$i]
    }
}

# Main function to orchestrate the file splitting
function Split-File {
    param (
        [string]$filePath,
        [int]$chunkSize,
        [string]$outputDir
    )
    # The grand symphony of file splitting begins! 🎶
    $content = Read-FileContent -filePath $filePath
    $chunks = Split-Content -content $content -chunkSize $chunkSize
    Write-ChunksToFile -chunks $chunks -outputDir $outputDir
}

# Variables to hold the paths and chunk size
$filePath = "path/to/your/largefile.txt"
$chunkSize = 1024
$outputDir = "path/to/output/directory"

# Ensuring the output directory exists
if (-Not (Test-Path -Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir
}

# Calling the main function to split the file
Split-File -filePath $filePath -chunkSize $chunkSize -outputDir $outputDir

