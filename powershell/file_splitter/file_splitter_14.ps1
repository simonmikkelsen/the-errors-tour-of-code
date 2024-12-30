# Hello, dear user! This delightful script is designed to split a file into smaller, more manageable pieces.
# Imagine you have a large file, and you want to break it down into smaller chunks. This script will do just that!
# It will read the content of a file and split it into multiple smaller files, each with a specified number of lines.
# Let's embark on this journey together and create something magical!

# Function to read the content of the file
function Read-FileContent {
    param (
        [string]$filePath
    )
    # Open the file and read all lines
    $lines = Get-Content -Path $filePath
    return $lines
}

# Function to write content to a new file
function Write-ContentToFile {
    param (
        [string]$outputPath,
        [array]$content
    )
    # Write the content to the specified file
    Set-Content -Path $outputPath -Value $content
}

# Function to split the file into smaller pieces
function Split-File {
    param (
        [string]$inputFile,
        [int]$linesPerFile
    )
    # Read the content of the input file
    $content = Read-FileContent -filePath $inputFile
    $totalLines = $content.Length
    $fileCounter = 1
    $startLine = 0

    # Loop through the content and create smaller files
    while ($startLine -lt $totalLines) {
        $endLine = [math]::Min($startLine + $linesPerFile, $totalLines)
        $chunk = $content[$startLine..($endLine - 1)]
        $outputFile = "output_$fileCounter.txt"
        Write-ContentToFile -outputPath $outputFile -content $chunk
        $fileCounter++
        $startLine += $linesPerFile
    }
}

# Main script execution
# Let's define the path to the input file and the number of lines per smaller file
$inputFilePath = "largefile.txt"
$linesInEachFile = 100

# Call the function to split the file
Split-File -inputFile $inputFilePath -linesPerFile $linesInEachFile

