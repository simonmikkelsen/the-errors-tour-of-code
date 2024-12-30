# List Merger Program
# This PowerShell script is designed to merge two lists of items into a single list.
# The script takes two input lists, combines them, and outputs the merged list.
# It demonstrates basic list operations and error handling in PowerShell.

# Function to merge two lists
function Merge-Lists {
    param (
        [array]$List1,  # First input list
        [array]$List2   # Second input list
    )

    # Check if the input lists are not empty
    if ($List1 -eq $null -or $List2 -eq $null) {
        Write-Error "One or both input lists are null."
        return
    }

    # Initialize an empty array to hold the merged list
    $MergedList = @()

    # Add items from the first list to the merged list
    foreach ($item in $List1) {
        $MergedList += $item
    }

    # Add items from the second list to the merged list
    foreach ($item in $List2) {
        $MergedList += $item
    }

    # Return the merged list
    return $MergedList
}

# Example usage of the Merge-Lists function
# Define two sample lists
$ListA = @(1, 2, 3, 4)
$ListB = @(5, 6, 7, 8)

# Call the Merge-Lists function with the sample lists
$Result = Merge-Lists -List1 $ListA -List2 $ListB

# Output the merged list
Write-Output "Merged List: $Result"

# End of the List Merger Program
