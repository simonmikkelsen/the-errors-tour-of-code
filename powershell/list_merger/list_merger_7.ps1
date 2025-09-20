# List Merger Program
# This PowerShell script is designed to merge two lists into a single list.
# It takes two input files containing lists of items, reads the contents of these files,
# merges the lists, and writes the merged list to an output file.
# The script is intended to help programmers understand how to handle file I/O operations,
# list manipulations, and error handling in PowerShell.

# Function to read a list from a file
function Read-ListFromFile {
    param (
        [string]$filePath
    )
    # Check if the file exists
    if (-Not (Test-Path $filePath)) {
        Write-Error "File not found: $filePath"
        return $null
    }
    # Read the contents of the file and return as an array of strings
    return Get-Content $filePath
}

# Function to write a list to a file
function Write-ListToFile {
    param (
        [string]$filePath,
        [array]$list
    )
    # Write the list to the specified file
    $list | Out-File -FilePath $filePath -Encoding utf8
}

# Function to merge two lists
function Merge-Lists {
    param (
        [array]$list1,
        [array]$list2
    )
    # Combine the two lists into one
    return $list1 + $list2
}

# Main script execution
# Define the input and output file paths
$list1FilePath = "list1.txt"
$list2FilePath = "list2.txt"
$outputFilePath = "mergedList.txt"

# Read the lists from the input files
$list1 = Read-ListFromFile -filePath $list1FilePath
$list2 = Read-ListFromFile -filePath $list2FilePath

# Merge the lists
$mergedList = Merge-Lists -list1 $list1 -list2 $list2

# Write the merged list to the output file
Write-ListToFile -filePath $outputFilePath -list $mergedList

# End of script
