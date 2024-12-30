<#
Welcome, dear user, to the File Splitter program! This delightful script is designed to take a large file and split it into smaller, more manageable pieces. Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own. This program will help you achieve just that with your files. Enjoy the journey of splitting and reassembling your files with grace and elegance.
#>

# Function to read the content of the file
function Read-FileContent {
    param (
        [string]$filePath
    )
    # Let's open the file and read its content
    $fileContent = Get-Content -Path $filePath -Raw
    return $fileContent
}

# Function to split the content into smaller parts
function Split-Content {
    param (
        [string]$content,
        [int]$partSize
    )
    # We will use an array to store the parts
    $parts = @()
    for ($i = 0; $i -lt $content.Length; $i += $partSize) {
        $part = $content.Substring($i, [Math]::Min($partSize, $content.Length - $i))
        $parts += $part
    }
    return $parts
}

# Function to write the parts to separate files
function Write-PartsToFile {
    param (
        [array]$parts,
        [string]$outputDirectory
    )
    # Let's create the output directory if it doesn't exist
    if (-not (Test-Path -Path $outputDirectory)) {
        New-Item -ItemType Directory -Path $outputDirectory
    }
    # Write each part to a separate file
    for ($i = 0; $i -lt $parts.Length; $i++) {
        $partFileName = Join-Path -Path $outputDirectory -ChildPath "part_$i.txt"
        Set-Content -Path $partFileName -Value $parts[$i]
    }
}

# Main script execution
$filePath = "path/to/your/large/file.txt"
$outputDirectory = "path/to/output/directory"
$partSize = 1000

# Read the content of the file
$fileContent = Read-FileContent -filePath $filePath

# Split the content into smaller parts
$parts = Split-Content -content $fileContent -partSize $partSize

# Write the parts to separate files
Write-PartsToFile -parts $parts -outputDirectory $outputDirectory

# The end of our beautiful journey
