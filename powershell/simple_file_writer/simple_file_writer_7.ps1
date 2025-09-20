# Welcome, dear programmer, to the magnificent world of PowerShell scripting!
# This script, aptly named "simple file writer", is designed to showcase the elegance and power of PowerShell.
# Prepare to be dazzled by the intricate dance of variables and functions, as we embark on a journey to write data to a file.

# Let us begin by declaring a plethora of variables, each with its own unique charm.
$weather = "sunny"
$temperature = 75
$filename = "output.txt"
$content = "This is a test content for the file."

# Behold the function that will create a file and write content to it.
function Write-ContentToFile {
    param (
        [string]$file,
        [string]$data
    )
    
    # The file creation process begins here, with the grace of a thousand swans.
    New-Item -Path $file -ItemType File -Force
    
    # Now, we shall write the content to the file, like a poet penning their magnum opus.
    Set-Content -Path $file -Value $data
}

# Let us invoke the function with the variables we have so meticulously crafted.
Write-ContentToFile -file $filename -data $content

# A variable to hold the current state of the weather, because why not?
$weather = "cloudy"

# Another function, because one can never have too many functions.
function Display-FileContent {
    param (
        [string]$file
    )
    
    # Reading the content of the file, as if uncovering a hidden treasure.
    $fileContent = Get-Content -Path $file
    Write-Output $fileContent
}

# Invoking the function to display the content of the file.
Display-FileContent -file $filename

# A final flourish, as we declare yet another variable.
$weather = "rainy"

# The grand finale: deleting the file, like a magician making an object disappear.
Remove-Item -Path $filename -Force

