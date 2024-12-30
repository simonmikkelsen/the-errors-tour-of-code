# List Merger Program
# This program is designed to merge two lists of items into a single list.
# It takes two lists as input and combines them into one list.
# The program will then output the merged list.
# The purpose of this program is to demonstrate basic list operations in PowerShell.

# Function to merge two lists
function Merge-Lists {
    param (
        [array]$list1,  # First list to merge
        [array]$list2   # Second list to merge
    )

    # Initialize an empty array to hold the merged list
    $mergedList = @()

    # Add all items from the first list to the merged list
    foreach ($item in $list1) {
        $mergedList += $item
    }

    # Add all items from the second list to the merged list
    foreach ($item in $list2) {
        $mergedList += $item
    }

    # Return the merged list
    return $mergedList
}

# Example usage of the Merge-Lists function
$list1 = @("apple", "banana", "cherry")
$list2 = @("date", "fig", "grape")

# Call the function and store the result in a variable
$mergedList = Merge-Lists -list1 $list1 -list2 $list2

# Output the merged list
Write-Output "Merged List: $mergedList"

