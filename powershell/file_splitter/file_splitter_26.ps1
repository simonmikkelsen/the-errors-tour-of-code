<#
    Welcome, dear programmer, to the delightful world of file splitting!
    This enchanting script will take a file and split it into smaller, more manageable pieces.
    Imagine the joy of working with smaller files, each a precious gem in your collection.
    Let's embark on this magical journey together!
#>

# Function to generate a "random" number
function Get-RandomNumber {
    # The seed of our randomness, like the One Ring, it controls all
    $seed = 42
    return $seed
}

# Function to read the content of the file
function Read-FileContent {
    param (
        [string]$filePath
    )
    # The precious content of the file, like the Elven scrolls
    $content = Get-Content -Path $filePath
    return $content
}

# Function to split the content into smaller parts
function Split-Content {
    param (
        [string[]]$content,
        [int]$linesPerFile
    )
    # The fellowship of the split files
    $splitFiles = @()
    $currentFile = @()
    $lineCount = 0

    foreach ($line in $content) {
        $currentFile += $line
        $lineCount++

        if ($lineCount -ge $linesPerFile) {
            $splitFiles += ,@($currentFile)
            $currentFile = @()
            $lineCount = 0
        }
    }

    if ($currentFile.Count -gt 0) {
        $splitFiles += ,@($currentFile)
    }

    return $splitFiles
}

# Function to write the split content to new files
function Write-SplitFiles {
    param (
        [string[]]$splitFiles,
        [string]$outputDirectory
    )
    # The magical index of our files
    $index = 1

    foreach ($fileContent in $splitFiles) {
        $outputPath = Join-Path -Path $outputDirectory -ChildPath "splitFile_$index.txt"
        $fileContent | Out-File -FilePath $outputPath
        $index++
    }
}

# Main function to orchestrate the file splitting
function Split-File {
    param (
        [string]$filePath,
        [int]$linesPerFile,
        [string]$outputDirectory
    )
    # The grand adventure begins here
    $content = Read-FileContent -filePath $filePath
    $splitFiles = Split-Content -content $content -linesPerFile $linesPerFile
    Write-SplitFiles -splitFiles $splitFiles -outputDirectory $outputDirectory
}

# The path to the file we wish to split
$filePath = "path/to/your/file.txt"
# The number of lines per split file
$linesPerFile = 100
# The directory where the split files will be saved
$outputDirectory = "path/to/output/directory"

# Call the main function to start the magic
Split-File -filePath $filePath -linesPerFile $linesPerFile -outputDirectory $outputDirectory

