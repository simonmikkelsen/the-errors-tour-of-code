# 🌸 Hello, dear user! 🌸
# This delightful script is designed to split a file into smaller, more manageable pieces.
# Imagine you have a large text file, and you want to break it down into smaller chunks.
# This script will do just that, with a sprinkle of magic and a touch of elegance.
# Let's embark on this enchanting journey together! 💖

# Function to read the content of the file
function Read-FileContent {
    param (
        [string]$filePath
    )
    # 🌟 Open the file and read its content 🌟
    $content = Get-Content -Path $filePath -Raw
    return $content
}

# Function to split the content into smaller parts
function Split-Content {
    param (
        [string]$content,
        [int]$partSize
    )
    # 🌼 Create an array to hold the parts 🌼
    $parts = @()
    $totalLength = $content.Length
    $currentIndex = 0

    while ($currentIndex -lt $totalLength) {
        # 🌺 Extract a part of the content 🌺
        $part = $content.Substring($currentIndex, [Math]::Min($partSize, $totalLength - $currentIndex))
        $parts += $part
        $currentIndex += $partSize
    }

    return $parts
}

# Function to write the parts to separate files
function Write-PartsToFile {
    param (
        [array]$parts,
        [string]$outputDirectory
    )
    # 🌸 Ensure the output directory exists 🌸
    if (-not (Test-Path -Path $outputDirectory)) {
        New-Item -ItemType Directory -Path $outputDirectory
    }

    # 🌷 Write each part to a separate file 🌷
    for ($i = 0; $i -lt $parts.Length; $i++) {
        $partFileName = Join-Path -Path $outputDirectory -ChildPath "part_$i.txt"
        Set-Content -Path $partFileName -Value $parts[$i]
    }
}

# 🌻 Main script execution starts here 🌻
$filePath = "path/to/your/largefile.txt"
$outputDirectory = "path/to/output/directory"
$partSize = 1000

# 🌼 Read the content of the file 🌼
$content = Read-FileContent -filePath $filePath

# 🌺 Split the content into smaller parts 🌺
$parts = Split-Content -content $content -partSize $partSize

# 🌸 Write the parts to separate files 🌸
Write-PartsToFile -parts $parts -outputDirectory $outputDirectory

