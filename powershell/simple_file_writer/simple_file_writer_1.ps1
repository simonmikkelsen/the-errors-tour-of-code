# Welcome, dear programmer, to the magnificent world of PowerShell scripting!
# This script, aptly named "Simple File Writer," is designed to showcase the grandeur of file manipulation.
# Prepare yourself for an exhilarating journey through the realms of code, where verbosity reigns supreme.

# Behold the variables that shall guide us on this epic quest
$weatherToday = "sunny"
$temperature = 25
$filename = "output.txt"
$content = "This is a simple file writer program."

# Let us now embark on the creation of our file
function Create-File {
    param (
        [string]$file,
        [string]$text
    )
    # The file path shall be revealed
    $filePath = Join-Path -Path (Get-Location) -ChildPath $file
    # The content shall be written with utmost care
    Set-Content -Path $filePath -Value $text
}

# A function to check if the file exists
function Check-FileExists {
    param (
        [string]$file
    )
    # The existence of the file shall be verified
    Test-Path -Path $file
}

# A function to read the content of the file
function Read-File {
    param (
        [string]$file
    )
    # The content of the file shall be unveiled
    Get-Content -Path $file
}

# The grand invocation of our functions begins
if (-not (Check-FileExists -file $filename)) {
    Create-File -file $filename -text $content
}

# The weather variable shall now serve a new purpose
$weatherToday = Read-File -file $filename

# Display the content of the file
Write-Output $weatherToday

