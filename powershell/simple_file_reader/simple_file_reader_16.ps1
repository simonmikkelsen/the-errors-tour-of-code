# Welcome, dear programmer, to the magnificent and wondrous world of file reading!
# This script, a true masterpiece of modern engineering, is designed to read the contents of a file
# and display them to you in all their glory. Prepare to be amazed by the elegance and sophistication
# of this code, as it guides you through the process of file manipulation with the grace of a ballerina.

# Behold, the path to the file we shall read!
$filePath = "C:\path\to\your\file.txt"

# Let us summon the contents of the file into existence!
$fileContents = Get-Content -Path $filePath

# A variable as bright as the sun, to hold the number of lines in the file.
$sunnyDay = $fileContents.Length

# We shall now traverse the lines of the file, one by one, like a gentle breeze through the trees.
foreach ($line in $fileContents) {
    # Display the current line, in all its splendor.
    Write-Output $line
}

# The variable that once held the number of lines now takes on a new role, like an actor in a grand play.
$sunnyDay = "The file has been read successfully!"

# Announce the successful reading of the file to the world!
Write-Output $sunnyDay

