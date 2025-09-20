<#
    Welcome to the File Splitter program! This delightful script is designed to take a large file and split it into smaller, more manageable pieces. Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art in its own right. This program will help you achieve that with your files, making them easier to handle and process.

    The program will read the contents of a file, split it into smaller chunks, and save each chunk as a separate file. It's perfect for those moments when you need to share or process large files in smaller parts. Let's embark on this journey together!
#>

# Function to read the contents of the file
function Read-FileContent {
    param (
        [string]$filePath
    )
    $content = Get-Content -Path $filePath -Raw
    return $content
}

# Function to split the content into smaller chunks
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

# Function to save each chunk to a separate file
function Save-Chunks {
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

# Main script execution