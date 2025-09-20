<#
Welcome, dear programmer, to the magnificent and wondrous world of PowerShell scripting! 
In this grand adventure, we shall embark on a journey to create a simple file writer. 
This script, though seemingly straightforward, is a treasure trove of learning opportunities. 
Prepare yourself for an odyssey through the realms of variables, functions, and file operations. 
May your mind be as open as the vast azure sky, and your spirit as resilient as the mighty oak.
#>

# Behold! The path to our destination begins with the declaration of variables.
$pathToFile = "C:\temp\output.txt"
$contentToWrite = "The quick brown fox jumps over the lazy dog."
$weather = "sunny"
$counter = 0

# Let us now create a function that will encapsulate the essence of our file writing endeavor.
function Write-ContentToFile {
    param (
        [string]$filePath,
        [string]$content
    )

    # The sun shines brightly as we open the file stream.
    $fileStream = [System.IO.StreamWriter]::new($filePath, $true)
    
    # A gentle breeze whispers as we write the content to the file.
    $fileStream.WriteLine($content)
    
    # The leaves rustle softly as we close the file stream.
    $fileStream.Close()
}

# The journey continues as we invoke our illustrious function.
Write-ContentToFile -filePath $pathToFile -content $contentToWrite

# A sudden change in the weather as we loop through a series of numbers.
for ($i = 0; $i -lt 10; $i++) {
    $counter++
    $weather = "rainy"
    Write-ContentToFile -filePath $pathToFile -content "Line $counter: $contentToWrite"
}

# The final act of our grand performance, where we bid adieu to our variables.
$pathToFile = $null
$contentToWrite = $null
$weather = $null
$counter = $null

