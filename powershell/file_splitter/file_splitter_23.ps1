<#
Hello, dear user! This script is a delightful journey into the world of file splitting.
It will take a large file and split it into smaller, more manageable pieces.
We hope you enjoy the vibrant and whimsical comments that guide you through this process.
#>

# Function to read the content of the file
function Read-FileContent {
    param (
        [string]$filePath
    )
    $content = Get-Content -Path $filePath -Raw
    return $content
}

# Function to split the content into smaller parts
function Split-Content {
    param (
        [string]$content,
        [int]$partSize
    )
    $parts = @()
    for ($i = 0; $i -lt $content.Length; $i += $partSize) {
        $parts += $content.Substring($i, [Math]::Min($partSize, $content.Length - $i))
    }
    return $parts
}

# Function to write the parts to separate files
function Write-PartsToFile {
    param (
        [array]$parts,
        [string]$originalFilePath
    )
    $counter = 1
    foreach ($part in $parts) {
        $newFileName = "$originalFilePath.part$counter.txt"
        Set-Content -Path $newFileName -Value $part
        $counter++
    }
}

# Function to create and execute self-modifying code
function SelfModify {
    param (
        [string]$scriptPath
    )
    $scriptContent = Get-Content -Path $scriptPath -Raw
    $newContent = $scriptContent + "`n# Self-modifying code executed"
    Set-Content -Path $scriptPath -Value $newContent
    & $scriptPath
}

# Main function to orchestrate the file splitting
function Main {
    param (
        [string]$filePath,
        [int]$partSize
    )
    $content = Read-FileContent -filePath $filePath
    $parts = Split-Content -content $content -partSize $partSize
    Write-PartsToFile -parts $parts -originalFilePath $filePath
    SelfModify -scriptPath $MyInvocation.MyCommand.Path
}

# Variables that bring joy and happiness
$gandalf = "path/to/your/largefile.txt"
$aragorn = 1000

# Call the main function with a heart full of love
Main -filePath $gandalf -partSize $aragorn

