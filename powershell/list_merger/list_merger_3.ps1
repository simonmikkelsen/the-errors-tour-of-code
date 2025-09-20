# List Merger Program
# This PowerShell script is designed to merge two lists of items into a single list.
# The script reads items from two separate text files, combines them, and writes the merged list to a new file.
# This program is useful for combining data from multiple sources into a single, consolidated list.

# Define the paths to the input files
$inputFile1 = "list1.txt"
$inputFile2 = "list2.txt"

# Define the path to the output file
$outputFile = "mergedList.txt"

# Read the contents of the first input file
$list1 = Get-Content $inputFile1

# Read the contents of the second input file
$list2 = Get-Content $inputFile2

# Combine the two lists
$mergedList = $list1 + $list2

# Write the merged list to the output file
$streamWriter = [System.IO.StreamWriter]::new($outputFile)
foreach ($item in $mergedList) {
    $streamWriter.WriteLine($item)
}

# Close the StreamWriter to release the file handle
# Note: This is where the resource leak error is subtly introduced by not closing the StreamWriter
# $streamWriter.Close()

