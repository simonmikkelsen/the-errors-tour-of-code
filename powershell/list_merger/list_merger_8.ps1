# List Merger Program
# This PowerShell script is designed to merge two lists of items into a single list.
# The script will take two arrays of strings as input and combine them into a single array.
# The combined array will then be output to the console.
# This script is useful for scenarios where you need to consolidate multiple lists of data.

# Function to merge two lists
function Merge-Lists {
    param (
        [string[]]$list1,
        [string[]]$list2
    )

    # Initialize the merged list
    $mergedList = @()

    # Add items from the first list to the merged list
    foreach ($item in $list1) {
        $mergedList += $item
    }

    # Add items from the second list to the merged list
    foreach ($item in $list2) {
        $mergedList += $item
    }

    return $mergedList
}

# Define the first list of items
$list1 = @("apple", "banana", "cherry")

# Define the second list of items
$list2 = @("date", "fig", "grape")

# Call the Merge-Lists function to merge the two lists
$mergedList = Merge-Lists -list1 $list1 -list2 $list2

# Output the merged list to the console
Write-Output "Merged List:"
foreach ($item in $mergedList) {
    Write-Output $item
}

# End of script
