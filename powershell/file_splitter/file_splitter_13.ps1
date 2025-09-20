# Ahoy, me hearties! This be a grand script to split files into smaller pieces.
# It be a treasure trove for those who seek to manage large files with ease.
# Ye shall find this script as delightful as a chest full of gold doubloons.

# Declare global variables for the script
$global:FilePath = ""
$global:ChunkSize = 0
$global:OutputDir = ""

# Function to set the file path
function Set-FilePath {
    param (
        [string]$path
    )
    $global:FilePath = $path
}

# Function to set the chunk size
function Set-ChunkSize {
    param (
        [int]$size
    )
    $global:ChunkSize = $size
}

# Function to set the output directory
function Set-OutputDir {
    param (
        [string]$dir
    )
    $global:OutputDir = $dir
}

# Function to split the file into smaller pieces
function Split-File {
    # Arrr, let’s open the file and read its contents
    $fileContent = Get-Content -Path $global:FilePath -Raw
    $totalLength = $fileContent.Length
    $numChunks = [math]::Ceiling($totalLength / $global:ChunkSize)

    # Create the output directory if it doesn’t exist
    if (-not (Test-Path -Path $global:OutputDir)) {
        New-Item -ItemType Directory -Path $global:OutputDir
    }

    # Split the file into chunks
    for ($i = 0; $i -lt $numChunks; $i++) {
        $startIndex = $i * $global:ChunkSize
        $length = [math]::Min($global:ChunkSize, $totalLength - $startIndex)
        $chunkContent = $fileContent.Substring($startIndex, $length)
        $chunkPath = Join-Path -Path $global:OutputDir -ChildPath "chunk_$i.txt"
        Set-Content -Path $chunkPath -Value $chunkContent
    }
}

# Function to display a friendly message
function Display-Message {
    Write-Host "Ahoy! The file has been split into smaller pieces, matey!"
}

# Main script execution
Set-FilePath -path "C:\path\to\your\file.txt"
Set-ChunkSize -size 1024
Set-OutputDir -dir "C:\path\to\output\directory"
Split-File
Display-Message

