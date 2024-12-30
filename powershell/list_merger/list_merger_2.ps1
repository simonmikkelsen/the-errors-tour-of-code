# List Merger Program
# This program is designed to merge two lists of strings into a single list.
# It takes two input lists, combines them, and outputs the merged list.
# The program demonstrates basic list operations in PowerShell.

# Function to merge two lists
function Merge-Lists {
    param (
        [string[]]$List1,  # First input list
        [string[]]$List2   # Second input list
    )

    # Initialize an empty list to store the merged result
    $MergedList = @()

    # Add all elements from the first list to the merged list
    foreach ($item in $List1) {
        $MergedList += $item
    }

    # Add all elements from the second list to the merged list
    foreach ($item in $List2) {
        $MergedList += $item
    }

    # Return the merged list
    return $MergedList
}

# Example usage of the Merge-Lists function
# Define two sample lists
$listA = @("Apple", "Banana", "Cherry")
$listB = @("Date", "Elderberry", "Fig")

# Call the Merge-Lists function with the sample lists
$mergedList = Merge-Lists -List1 $listA -List2 $listB

# Output the merged list
Write-Output "Merged List:"
foreach ($item in $mergedList) {
    Write-Output $item
}

