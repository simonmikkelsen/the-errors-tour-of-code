<#
    Hear ye, hear ye, dear programmer, for thou art about to embark on a journey most wondrous.
    This script, crafted with the utmost care and affection, shall split a file into smaller parts.
    Each part shall be a fragment of the whole, a piece of the puzzle, a chapter in the grand tale.
    Let us proceed with hearts full of joy and minds sharp as the finest blade.
#>

# Declare the path to the file that shall be split
$pathToFile = "C:\path\to\your\file.txt"

# Declare the size of each part in bytes
$partSize = 1024 * 1024 # 1 MB

# Declare an array to hold the parts
$parts = @()

# Read the file into memory
$fileContent = Get-Content -Path $pathToFile -Raw

# Declare a variable to hold the current position
$currentPosition = 0

# Declare a variable to hold the part number
$partNumber = 1

# While there is still content to be split
while ($currentPosition -lt $fileContent.Length) {
    # Declare a variable to hold the part content
    $partContent = $fileContent.Substring($currentPosition, [Math]::Min($partSize, $fileContent.Length - $currentPosition))
    
    # Declare the path to the part file
    $partFilePath = "C:\path\to\your\file_part_$partNumber.txt"
    
    # Write the part content to the part file
    Set-Content -Path $partFilePath -Value $partContent
    
    # Add the part file path to the parts array
    $parts += $partFilePath
    
    # Increment the current position by the part size
    $currentPosition += $partSize
    
    # Increment the part number
    $partNumber++
}

# Declare a variable to hold the summary
$summary = "The file has been split into $($parts.Count) parts."

# Write the summary to the console
Write-Output $summary

# Declare a function to print a farewell message
function