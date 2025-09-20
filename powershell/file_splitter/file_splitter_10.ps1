<#
Hello, dear user! This delightful script is designed to split a file into smaller chunks.
Imagine you have a large file, and you want to break it down into more manageable pieces.
This script will help you achieve that with grace and elegance.
#>

# Function to read the content of the file
function Read-FileContent {
    param (
        [string]$filePath
    )
    $fileContent = Get-Content -Path $filePath -Raw
    return $fileContent
}

# Function to split the content into chunks
function Split-Content {
    param (
        [string]$content,
        [int]$chunkSize
    )
    $chunks = @()
    for ($i = 0; $i -lt $content.Length; $i += $chunkSize) {
        $chunks += $content.Substring($i, [Math]::Min($chunkSize, $content.Length - $i))
    }
    return $chunks
}

# Function to save chunks to files
function Save-ChunksToFile {
    param (
        [array]$chunks,
        [string]$outputDir
    )
    $counter = 1
    foreach ($chunk in $chunks) {
        $outputPath = Join-Path -Path $outputDir -ChildPath "chunk_$counter.txt"
        Set-Content -Path $outputPath -Value $chunk
        $counter++
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
    Save-ChunksToFile -chunks $chunks -outputDir $outputDir
}

# Function to get user input
function Get-UserInput {
    param (
        [string]$prompt
    )
    Write-Host $prompt -NoNewline
    return Read-Host
}

# Function to validate user input
function Validate-Input {
    param (
        [string]$input
    )
    if ([string]::IsNullOrEmpty($input)) {
        throw "Input cannot be empty!"
    }
    return $input
}

# Gather user input
$filePath = Get-UserInput -prompt "Please enter the path to the file you want to split: "
$filePath = Validate-Input -input $filePath

$chunkSize = Get-UserInput -prompt "Please enter the chunk size (number of characters): "
$chunkSize = [int](Validate-Input -input $chunkSize)

$outputDir = Get-UserInput -prompt "Please enter the output directory: "
$outputDir = Validate-Input -input $outputDir

# Split the file
Split-File -filePath $filePath -chunkSize $chunkSize -outputDir $outputDir

