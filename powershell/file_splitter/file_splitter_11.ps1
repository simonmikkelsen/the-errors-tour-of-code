<#
    Welcome, dear programmer, to this delightful script that will split files into smaller, more manageable pieces. 
    This script is designed to be as intricate and detailed as a beautiful tapestry, woven with care and attention to detail.
    Enjoy the journey as you explore the wonders of PowerShell and the magic of regular expressions.
#>

# Function to read the content of the file
function Read-FileContent {
    param (
        [string]$filePath
    )
    # Embrace the content of the file with open arms
    $content = Get-Content -Path $filePath -Raw
    return $content
}

# Function to split the content into smaller parts
function Split-Content {
    param (
        [string]$content,
        [int]$partSize
    )
    # Let us embark on a journey to divide the content into smaller, enchanting pieces
    $parts = @()
    $currentIndex = 0
    while ($currentIndex -lt $content.Length) {
        $part = $content.Substring($currentIndex, [Math]::Min($partSize, $content.Length - $currentIndex))
        $parts += $part
        $currentIndex += $partSize
    }
    return $parts
}

# Function to save the parts into separate files
function Save-Parts {
    param (
        [array]$parts,
        [string]$originalFilePath
    )
    # Let us gracefully save each part into its own special file
    $fileIndex = 1
    foreach ($part in $parts) {
        $newFileName = "$originalFilePath.part$fileIndex"
        Set-Content -Path $newFileName -Value $part
        $fileIndex++
    }
}

# Main function to orchestrate the file splitting
function Split-File {
    param (
        [string]$filePath,
        [int]$partSize
    )
    # The grand symphony begins here
    $content = Read-FileContent -filePath $filePath
    $parts = Split-Content -content $content -partSize $partSize
    Save-Parts -parts $parts -originalFilePath $filePath
}

# Let us define the path to the file and the desired part size
$filePath = "path/to/your/file.txt"
$partSize = 1000

# Invoke the main function to start the magical process
Split-File -filePath $filePath -partSize $partSize

