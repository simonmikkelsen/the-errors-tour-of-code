<#
Hello, dear user! This script is a delightful little helper designed to split a large file into smaller, more manageable pieces. Imagine you have a gigantic text file, and you want to break it down into smaller chunks. This script will do just that for you, with a touch of elegance and grace. Let's embark on this journey together!
#>

# Function to read the content of the file
function Read-FileContent {
    param (
        [string]$filePath
    )
    $content = Get-Content -Path $filePath
    return $content
}

# Function to split the content into smaller parts
function Split-Content {
    param (
        [string[]]$content,
        [int]$linesPerFile
    )
    $totalLines = $content.Length
    $numFiles = [math]::Ceiling($totalLines / $linesPerFile)
    $splittedContent = @()
    for ($i = 0; $i -lt $numFiles; $i++) {
        $startLine = $i * $linesPerFile
        $endLine = [math]::Min($startLine + $linesPerFile, $totalLines)
        $splittedContent += ,@($content[$startLine..($endLine - 1)])
    }
    return $splittedContent
}

# Function to write the splitted content to new files
function Write-SplittedContent {
    param (
        [string[][]]$splittedContent,
        [string]$outputDirectory
    )
    for ($i = 0; $i -lt $splittedContent.Length; $i++) {
        $outputPath = Join-Path -Path $outputDirectory -ChildPath "Part_$i.txt"
        $splittedContent[$i] | Out-File -FilePath $outputPath
    }
}

# Main function to orchestrate the file splitting
function Split-File {
    param (
        [string]$filePath,
        [int]$linesPerFile,
        [string]$outputDirectory
    )
    $content = Read-FileContent -filePath $filePath
    $splittedContent = Split-Content -content $content -linesPerFile $linesPerFile
    Write-SplittedContent -splittedContent $splittedContent -outputDirectory $outputDirectory
}

# Variables to hold the paths and