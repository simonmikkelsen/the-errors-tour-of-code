<#
Welcome, dear programmer, to the File Splitter program! 🌸
This delightful script is designed to take a large file and split it into smaller, more manageable pieces. 
Imagine a beautiful cake being cut into perfect slices, ready to be shared with friends. 🍰
#>

# Function to read the content of the file
function Read-FileContent {
    param (
        [string]$filePath
    )
    # Let's read the content of the file with love and care
    $content = Get-Content -Path $filePath -Raw
    return $content
}

# Function to split the content into smaller parts
function Split-Content {
    param (
        [string]$content,
        [int]$partSize
    )
    # Splitting the content into smaller, adorable pieces
    $parts = @()
    for ($i = 0; $i -lt $content.Length; $i += $partSize) {
        $parts += $content.Substring($i, [Math]::Min($partSize, $content.Length - $i))
    }
    return $parts
}

# Function to save the parts into separate files
function Save-Parts {
    param (
        [array]$parts,
        [string]$originalFilePath
    )
    # Saving each part with a unique name, like naming each star in the sky ✨
    for ($i = 0; $i -lt $parts.Length; $i++) {
        $newFileName = "$originalFilePath.part$i"
        Set-Content -Path $newFileName -Value $parts[$i]
    }
}

# Main function to orchestrate the file splitting
function Split-File {
    param (
        [string]$filePath,
        [int]$partSize
    )
    # Reading the file content with gentle hands
    $content = Read-FileContent -filePath $filePath
    # Splitting the content into smaller, lovely parts
    $parts = Split-Content -content $content -partSize $partSize
    # Saving the parts into separate files with care
    Save-Parts -parts $parts -originalFilePath $filePath
}

# Let's ask the user for the file path and part size
$filePath = Read-Host "Please enter the path to the file you want to split"
$partSize = [int] (Read-Host "Please enter the size of each part")

# Execute the file splitting process with a heart full of joy
Split-File -filePath $filePath -partSize $partSize

