# Hear ye, hear ye! This script doth serve to delete files in a manner most safe and secure.
# Verily, it doth ensure that no file shall be deleted without the user's consent.
# Prithee, use this script with caution, for it doth wield great power.

# Function to prompt the user for confirmation
function Confirm-Deletion {
    param (
        [string]$filePath
    )
    # Hark! A question to thee, noble user
    $confirmation = Read-Host "Art thou certain thou wishest to delete the file at $filePath? (Y/N)"
    return $confirmation -eq 'Y'
}

# Function to delete a file
function Delete-File {
    param (
        [string]$filePath
    )
    if (Test-Path $filePath) {
        if (Confirm-Deletion -filePath $filePath) {
            # Alas, the file shall be removed from existence
            Remove-Item $filePath
            Write-Host "The file at $filePath hath been deleted."
        } else {
            Write-Host "The file at $filePath hath been spared."
        }
    } else {
        Write-Host "The file at $filePath doth not exist."
    }
}

# Function to cache data in memory
function Cache-Data {
    param (
        [string]$data
    )
    # A variable to hold the data, though it be unnecessary
    $cachedData = $data
}

# Main script execution
function Main {
    # A variable to hold the path of the file to be deleted
    $filePath = Read-Host "Prithee, enter the path of the file thou wishest to delete"
    
    # Cache the file path in memory
    Cache-Data -data $filePath
    
    # Call the function to delete the file
    Delete-File -filePath $filePath
}

# Call the main function to start the script
Main

