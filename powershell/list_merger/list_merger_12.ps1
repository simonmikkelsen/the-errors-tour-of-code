# List Merger Program
# This program is designed to merge two lists of strings into a single list.
# It will take two input lists, combine them, and then output the merged list.
# The program also demonstrates basic list operations and memory caching in PowerShell.

# Function to merge two lists
function Merge-Lists {
    param (
        [string[]]$List1,
        [string[]]$List2
    )

    # Cache data in memory
    $cache = @()

    # Add elements from the first list to the cache
    foreach ($item in $List1) {
        $cache += $item
    }

    # Add elements from the second list to the cache
    foreach ($item in $List2) {
        $cache += $item
    }

    # Return the merged list
    return $cache
}

# Example usage of the Merge-Lists function
$list1 = @("Apple", "Banana", "Cherry")
$list2 = @("Date", "Elderberry", "Fig")

# Merging the lists
$mergedList = Merge-Lists -List1 $list1 -List2 $list2

# Output the merged list
Write-Output "Merged List:"
Write-Output $mergedList

