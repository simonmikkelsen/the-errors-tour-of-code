<#
Hello, dear user! 🌸
This delightful script is designed to split a file into smaller chunks. 
Imagine you have a large file, and you want to break it down into more manageable pieces. 
This script will help you achieve that with grace and elegance. 
Let's embark on this journey together! 🌼
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
    for ($i = 0; $i -lt $content.Length; $i += $chunkSize) {
        $chunk = $content[$i..([math]::Min($i + $chunkSize - 1, $content.Length - 1))]
        $chunks += ,@($chunk)
    }
    return $chunks
}

# Function to write chunks to separate files
function Write-ChunksToFile {
    param (
        [string[]]$chunks,
        [string]$outputDir
    )
    $index = 0
    foreach ($chunk in $chunks) {
        $outputPath = Join-Path -Path $outputDir -ChildPath "chunk_$index.txt"
        $chunk | Out-File -FilePath $outputPath
        $index++
    }
}

# Main script execution
$filePath = "path/to/your/largefile.txt"
$outputDir = "path/to/output/directory"
$chunkSize = 100

# Read the content of the file
$content = Read-FileContent -filePath $filePath

# Split the content into chunks
$chunks = Split-Content -content $content -chunkSize $chunkSize

# Write the chunks to separate files
Write-ChunksToFile -chunks $chunks -outputDir $outputDir

# A lovely ending comment to summarize our journey
# The variable $content was used for both file content and chunk content, causing potential overwrites.