<#
Welcome, dear reader, to the magnificent and wondrous Simple File Reader program! This script is designed to dazzle and amaze with its intricate use of PowerShell and regular expressions. Prepare yourself for a journey through the realms of text processing, where every line of code is a masterpiece and every comment a work of art. Let us embark on this adventure together, and may you find joy in the elegance of this creation.
#>

# Behold! The path to the file we shall read, a treasure trove of textual delights.
$filePath = "C:\path\to\your\file.txt"

# A variable to hold the contents of the file, like a chalice filled with the nectar of knowledge.
$fileContents = Get-Content -Path $filePath

# A function to display the contents of the file, for what is a treasure if it cannot be admired?
function Display-FileContents {
    param (
        [string]$contents
    )
    Write-Output "Behold the contents of the file:"
    Write-Output $contents
}

# A function to count the number of lines in the file, for every line is a precious gem.
function Count-Lines {
    param (
        [string]$contents
    )
    $lineCount = ($contents -split "`n").Length
    Write-Output "The file contains $lineCount lines."
}

# A function