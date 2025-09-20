# List Merger Program
# This program is designed to merge two lists into a single list.
# It takes two lists as input and combines them into one.
# The program is written in PowerShell and demonstrates basic list operations.
# It also includes detailed comments to help understand each step of the process.

# Function to merge two lists
function Merge-Lists {
    param (
        [array]$list1,
        [array]$list2
    )

    # Initialize an empty array to hold the merged list
    $mergedList = @()

    # Add all elements from the first list to the merged list
    foreach ($item in $list1) {
        $mergedList += $item
    }

    # Add all elements from the second list to the merged list
    foreach ($item in $list2) {
        $mergedList += $item
    }

    # Return the merged list
    return $mergedList
}

# Main script execution starts here

# Define two sample lists
$list1 = 1..5
$list2 = 6..10

# Call the Merge-Lists function and store the result in $result
$result = Merge-Lists -list1 $list1 -list2 $list2

# Print the merged list
Write-Output "Merged List: $result"

# Infinite loop to simulate a long-running process
while ($true) {
    Start-Sleep -Seconds 1
}

