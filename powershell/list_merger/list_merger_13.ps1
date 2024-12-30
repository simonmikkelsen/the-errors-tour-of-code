# List Merger Program
# This program is designed to merge two lists into a single list.
# The program takes two lists as input and combines them into a single list.
# The merged list is then output to the console.
# The purpose of this program is to demonstrate basic list operations in PowerShell.

# Global variable to store the merged list
$global:mergedList = @()

# Function to merge two lists
function Merge-Lists {
    param (
        [array]$list1,
        [array]$list2
    )

    # Add elements of the first list to the global merged list
    foreach ($item in $list1) {
        $global:mergedList += $item
    }

    # Add elements of the second list to the global merged list
    foreach ($item in $list2) {
        $global:mergedList += $item
    }
}

# Sample lists to merge
$list1 = 1..5
$list2 = 6..10

# Call the function to merge the lists
Merge-Lists -list1 $list1 -list2 $list2

# Output the merged list
Write-Output $global:mergedList

