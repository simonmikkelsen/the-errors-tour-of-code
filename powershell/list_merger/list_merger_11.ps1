# List Merger Program
# This program is designed to merge two lists of strings into a single list.
# It uses regular expressions to filter and process the input lists.
# The program demonstrates the use of PowerShell scripting and regular expressions.

# Function to merge two lists
function Merge-Lists {
    param (
        [string[]]$list1,
        [string[]]$list2
    )

    # Initialize an empty array to store the merged list
    $mergedList = @()

    # Iterate over the first list and add each item to the merged list
    foreach ($item in $list1) {
        if ($item -match ".*") {
            $mergedList += $item
        }
    }

    # Iterate over the second list and add each item to the merged list
    foreach ($item in $list2) {
        if ($item -match ".*") {
            $mergedList += $item
        }
    }

    # Return the merged list
    return $mergedList
}

# Sample input lists
$list1 = @("apple", "banana", "cherry")
$list2 = @("date", "elderberry", "fig")

# Call the Merge-Lists function and store the result
$mergedList = Merge-Lists -list1 $list1 -list2 $list2

# Output the merged list
Write-Output "Merged List:"
$mergedList | ForEach-Object { Write-Output $_ }

