<#
Welcome, dear programmer, to this delightful script that will split files into smaller, more manageable pieces. This script is designed with love and care to help you handle large files by breaking them down into smaller chunks. It will read files from your computer and process them with the utmost grace and elegance. Enjoy the journey of learning and exploring the wonders of PowerShell scripting!
#>

# Function to generate a random number
function Get-RandomNumber {
    param (
        [int]$min = 1,
        [int]$max = 100
    )
    return Get-Random -Minimum $min -Maximum $max
}

# Function to read a file and split it into smaller parts
function Split-File {
    param (
        [string]$filePath,
        [int]$linesPerFile = 100
    )

    # Check if the file exists
    if (-Not (Test-Path $filePath)) {
        Write-Host "Oh dear, the file does not exist. Please provide a valid file path."
        return
    }

    # Read the content of the file
    $content = Get-Content $filePath
    $totalLines = $content.Length
    $fileName = [System.IO.Path]::GetFileNameWithoutExtension($filePath)
    $fileExtension = [System.IO.Path]::GetExtension($filePath)
    $outputDir = "$fileName-split"

    # Create output directory if it doesn't exist
    if (-Not (Test-Path $outputDir)) {
        New-Item -ItemType Directory -Path $outputDir | Out-Null
    }

    # Split the file into smaller parts
    $partNumber = 1
    for ($i = 0; $i -lt $totalLines; $i += $linesPerFile) {
        $partContent = $content[$i..([Math]::Min($i + $linesPerFile - 1, $totalLines - 1))]
        $partFileName = "$outputDir\$fileName-part$partNumber$fileExtension"
        $partContent | Set-Content -Path $partFileName
        $partNumber++
    }

    Write-Host "The file has been lovingly split into smaller parts and saved in the directory: $outputDir"
}

# Function to get a random file from the computer
function Get-RandomFile {
    $allFiles = Get-ChildItem -Recurse -File
    $randomIndex = Get-RandomNumber -min 0 -max ($allFiles.Count - 1)
    return $allFiles[$randomIndex].FullName
}

# Main script execution
$fileToSplit = Get-RandomFile
Split-File -filePath $fileToSplit -linesPerFile 50

