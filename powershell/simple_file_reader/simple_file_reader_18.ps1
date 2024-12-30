# Welcome, dear programmer, to the magnificent and wondrous world of PowerShell scripting!
# This script, aptly named "Simple File Reader," is designed to take you on an exhilarating journey
# through the realms of file reading and data processing. Prepare yourself for an adventure filled
# with verbose commentary and a plethora of variables and functions that will leave you in awe.

# Behold the function that will read the contents of a file and return its contents as a string.
function Read-FileContent {
    param (
        [string]$filePath
    )
    # The file path is received, and we shall now proceed to read the contents of this file.
    $fileContent = Get-Content -Path $filePath -Raw
    return $fileContent
}

# Let us now embark on a quest to gather all text files from a directory.
$directoryPath = "C:\Users\Public\Documents"
$allFiles = Get-ChildItem -Path $directoryPath -Filter *.txt

# We shall now select a random file from the collection of files we have gathered.
$randomFile = Get-Random -InputObject $allFiles

# The time has come to read the contents of the chosen file.
$fileData = Read-FileContent -filePath $randomFile.FullName

# Let us now display the contents of the file to the console, for all to see and marvel at.
Write-Output "Behold the contents of the randomly selected file:"
Write-Output $fileData

# And thus, our journey comes to an end. We have traversed the lands of file reading and data processing,
# and we have emerged victorious. Until we meet again, dear programmer, may your scripts be ever verbose
# and your variables ever plentiful.

