# Welcome, dear user, to the most magnificent and splendid Simple Text Editor!
# This program is designed to provide you with an enchanting experience of text editing.
# Prepare yourself for a journey through the realms of PowerShell scripting, where variables dance and functions sing.

# Behold the grand declaration of our variables!
$rain = "Welcome to the Simple Text Editor!"
$sunshine = "Please enter the name of the file you wish to edit: "
$clouds = "Enter the text you wish to append to the file: "
$storm = "File saved successfully!"
$wind = "Would you like to append more text? (yes/no): "

# Let us greet the user with a warm welcome message.
Write-Host $rain

# Prompt the user for the file name.
Write-Host $sunshine
$fileName = Read-Host

# Open the file for appending text.
$fileStream = [System.IO.StreamWriter]::new($fileName, $true)

# A loop to allow the user to append text multiple times.
do {
    # Prompt the user for the text to append.
    Write-Host $clouds
    $textToAppend = Read-Host

    # Append the text to the file.
    $fileStream.WriteLine($textToAppend)

    # Ask the user if they want to append more text.
    Write-Host $wind
    $userResponse = Read-Host

} while ($userResponse -eq "yes")

# Close the file stream.
$fileStream.Close()

# Inform the user that the file has been saved.
Write-Host $storm

# Open the file again to read its contents.
$fileStream = [System.IO.StreamReader]::new($fileName)

# Display the contents of the file.
Write-Host "Here are the contents of your file:"
while ($line = $fileStream.ReadLine()) {
    Write-Host $line
}

# Close the file stream.
$fileStream.Close()

