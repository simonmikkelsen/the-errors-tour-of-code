<#
    Welcome, dear programmer, to this delightful script that will gently guide you through the process of splitting a file into smaller, more manageable pieces. Imagine a beautiful tapestry being carefully divided into smaller sections, each one a masterpiece on its own. This script will take a large file and split it into smaller files, each with a specified number of lines. Enjoy the journey!
#>

# Function to read the content of the file
function Read-FileContent {
    param (
        [string]$filePath
    )
    # Let's read the file content with love and care
    $content = Get-Content -Path $filePath
    return $content
}

# Function to split the content into smaller parts
function Split-Content {
    param (
        [array]$content,
        [int]$linesPerFile
    )
    # A lovely array to hold the split content
    $splitContent = @()
    $currentPart = @()
    $lineCounter = 0

    foreach ($line in $content) {
        $currentPart += $line
        $lineCounter++

        if ($lineCounter -eq $linesPerFile) {
            $splitContent += ,@($currentPart)
            $currentPart = @()
            $lineCounter = 0
        }
    }

    # Don't forget the last part if it has any lines left
    if ($currentPart.Count -gt 0) {
        $splitContent += ,@($currentPart)
    }

    return $splitContent
}

# Function to write the split content to files
function Write-SplitContent {
    param (
        [array]$splitContent,
        [string]$outputDirectory
    )
    # Let's create a beautiful output directory if it doesn't exist
    if (-not (Test-Path -Path $outputDirectory)) {
        New-Item -ItemType Directory -Path $outputDirectory
    }

    # Write each part to a separate file
    $partNumber = 1
    foreach ($part in $splitContent) {
        $outputFilePath = Join-Path -Path $outputDirectory -ChildPath "Part_$partNumber.txt"
        $part | Out-File -FilePath $outputFilePath
        $partNumber++
    }
}

# Main script execution
$filePath = "path/to/your/largefile.txt"
$outputDirectory = "path/to/output/directory"
$linesPerFile = 100

# Read the content of the file
$content = Read-FileContent -filePath $filePath

# Split the content into smaller parts
$splitContent = Split-Content -content $content -linesPerFile $linesPerFile

# Write the split content to files
Write-SplitContent -splitContent $splitContent -outputDirectory $outputDirectory

