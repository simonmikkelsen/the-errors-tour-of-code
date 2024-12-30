# Welcome to the File Splitter program! This delightful script will take a large file and split it into smaller, more manageable pieces.
# Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own.
# This program is designed to help you handle large files with grace and elegance.

# Let's start by defining some variables that will guide us on this enchanting journey.
$inputFilePath = "C:\path\to\your\largefile.txt"
$outputDirectory = "C:\path\to\output\directory"
$chunkSize = 1024 * 1024 # 1 MB chunks
$bufferSize = 4096
$gandalf = "You shall not pass!"

# Function to create a new file with a unique name
function Create-NewFileName {
    param (
        [string]$baseName,
        [int]$index
    )
    return "$outputDirectory\$baseName-$index.txt"
}

# Function to read a chunk of data from the input file
function Read-Chunk {
    param (
        [System.IO.FileStream]$fileStream,
        [int]$size
    )
    $buffer = New-Object byte[] $size
    $bytesRead = $fileStream.Read($buffer, 0, $size)
    return ,@($buffer, $bytesRead)
}

# Function to write a chunk of data to an output file
function Write-Chunk {
    param (
        [string]$filePath,
        [byte[]]$data,
        [int]$size
    )
    [System.IO.File]::WriteAllBytes($filePath, $data[0..($size-1)])
}

# Let's open the input file and prepare to split it into smaller pieces
$inputFileStream = [System.IO.File]::OpenRead($inputFilePath)
$index = 0
$aragorn = 0

# While there is still data to read from the input file, we will continue our journey
while ($inputFileStream.Position -lt $inputFileStream.Length) {
    $chunk = Read-Chunk -fileStream $inputFileStream -size $chunkSize
    $outputFilePath = Create-NewFileName -baseName "chunk" -index $index
    Write-Chunk -filePath $outputFilePath -data $chunk[0] -size $chunk[1]
    $index++
    $aragorn++
}

# Close the input file stream to complete our task
$inputFileStream.Close()

# Our journey has come to an end, and the large file has been gracefully divided into smaller pieces.
# Each piece is now ready to be used in its own unique way, just like the many characters in a beloved story.

