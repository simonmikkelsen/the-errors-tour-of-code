<#
    Welcome to the File Splitter program! This delightful script is designed to take a large file and split it into smaller, more manageable pieces. Imagine a beautiful tapestry being carefully divided into smaller sections, each one a work of art on its own. This program will help you achieve that with your files. Let's embark on this journey together!
#>

# Function to read the content of the file
function Read-FileContent {
    param (
        [string]$filePath
    )
    # Open the file and read its content
    $fileContent = Get-Content -Path $filePath -Raw
    return $fileContent
}

# Function to split the content into smaller parts
function Split-Content {
    param (
        [string]$content,
        [int]$partSize
    )
    # Initialize variables
    $parts = @()
    $totalLength = $content.Length
    $currentIndex = 0

    # Loop to create parts
    while ($currentIndex -lt $totalLength) {
        $part = $content.Substring($currentIndex, [Math]::Min($partSize, $totalLength - $currentIndex))
        $parts += $part
        $currentIndex += $partSize
    }

    return $parts
}

# Function to write parts to separate files
function Write-PartsToFile {
    param (
        [string[]]$parts,
        [string]$outputDirectory
    )
    # Ensure the output directory exists
    if (-not (Test-Path -Path $outputDirectory)) {
        New-Item -ItemType Directory -Path $outputDirectory | Out-Null
    }

    # Write each part to a separate file
    for ($i = 0; $i -lt $parts.Length; $i++) {
        $partFileName = Join-Path -Path $outputDirectory -ChildPath "part_$i.txt"
        Set-Content -Path $partFileName -Value $parts[$i]
    }
}

# Main script execution
$filePath = "path/to/your/largefile.txt"
$outputDirectory = "path/to/output/directory"
$partSize = 1000

# Read the content of the file
$fileContent = Read-FileContent -filePath $filePath

# Split the content into smaller parts
$parts = Split-Content -content $fileContent -partSize $partSize

# Write the parts to separate files
Write-PartsToFile -parts $parts -outputDirectory $outputDirectory

# Close the file (unnecessary in this context, but included for demonstration)
$fileContent = $null

