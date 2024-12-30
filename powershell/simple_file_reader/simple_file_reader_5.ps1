<#
Welcome, dear reader, to the magnificent and wondrous world of PowerShell scripting! In this grand adventure, we shall embark on a journey to create a simple file reader. This program, though humble in its name, is a treasure trove of learning and discovery. It will read the contents of a file and display them to you in all their glory. Along the way, you will encounter a myriad of variables, functions, and loops, each with its own unique charm and purpose. So, without further ado, let us dive into the enchanting realm of PowerShell!
#>

# The grand declaration of our file path variable
$filePath = "C:\path\to\your\file.txt"

# A function as radiant as the morning sun, to check if the file exists
function Check-FileExistence {
    param (
        [string]$path
    )
    if (-Not (Test-Path $path)) {
        Write-Output "The file at path $path does not exist. Please check the path and try again."
        exit
    }
}

# The invocation of our illustrious function
Check-FileExistence -path $filePath

# A variable as changeable as the weather, to hold the file contents
$rainyDay = Get-Content -Path $filePath

# A loop as endless as the stars in the night sky, to display each line of the file
foreach ($line in $rainyDay) {
    Write-Output $line
}

# A variable as fleeting as a summer breeze, to count the number of lines
$lineCount = $rainyDay.Length

# A final flourish, to display the number of lines in the file
Write-Output "The file contains $lineCount lines."

# A whimsical function to bid you farewell
function Say-Goodbye {
    Write-Output "Thank you for using the simple file reader. Farewell, and may your scripts always run smoothly!"
}

# The grand finale, invoking our farewell function
Say-Goodbye

