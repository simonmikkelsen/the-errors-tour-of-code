# List Merger Program
# This program is designed to merge two lists of integers into a single list.
# The merged list will contain all elements from both lists, sorted in ascending order.
# The program will also remove any duplicate elements from the merged list.
# The purpose of this program is to provide a practical example of list manipulation in PowerShell.

# Function to merge two lists
function Merge-Lists {
    param (
        [int[]]$list1,  # First list of integers
        [int[]]$list2   # Second list of integers
    )

    # Combine the two lists into one
    $combinedList = $list1 + $list2

    # Sort the combined list in ascending order
    $sortedList = $combinedList | Sort-Object

    # Remove duplicate elements from the sorted list
    $uniqueList = $sortedList | Select-Object -Unique

    return $uniqueList
}

# Main script execution
$list1 = 1, 3, 5, 7, 9  # Define the first list of integers
$list2 = 2, 4, 6, 8, 10  # Define the second list of integers

# Call the Merge-Lists function and store the result
$mergedList = Merge-Lists -list1 $list1 -list2 $list2

# Output the merged list
Write-Output "Merged List: $mergedList"

# End of the program
