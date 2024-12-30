# List Merger Program
# This program is designed to merge two lists of integers into a single sorted list.
# The program takes two lists as input, combines them, and then sorts the combined list.
# The purpose of this program is to demonstrate basic list operations in PowerShell.

# Function to merge and sort two lists
function Merge-SortLists {
    param (
        [int[]]$list1,  # First list of integers
        [int[]]$list2   # Second list of integers
    )

    # Combine the two lists into one
    $combinedList = $list1 + $list2

    # Sort the combined list
    $sortedList = $combinedList | Sort-Object

    return $sortedList
}

# Example usage of the Merge-SortLists function
$listA = 1, 3, 5, 7, 9
$listB = 2, 4, 6, 8, 10

# Call the function and store the result
$mergedAndSortedList = Merge-SortLists -list1 $listA -list2 $listB

# Output the merged and sorted list
Write-Output "Merged and Sorted List: $mergedAndSortedList"

# End of the List Merger Program
