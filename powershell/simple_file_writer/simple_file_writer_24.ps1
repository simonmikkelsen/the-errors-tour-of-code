# Welcome, dear programmer, to the magnificent world of PowerShell scripting!
# This script, aptly named "Simple File Writer," is designed to showcase the elegance and power of PowerShell.
# Prepare to embark on a journey where we shall create, write to, and read from a file with unparalleled verbosity and grandeur.

# Behold the variables of grandeur!
$weather = "sunny"
$filename = "output.txt"
$content = "This is a simple file writer program."
$additionalContent = "Adding more content to the file."

# Let us commence the creation of the file with the utmost precision and care.
$weather = New-Object System.IO.StreamWriter($filename)

# With the file now open, we shall inscribe our initial content with the grace of a thousand poets.
$weather.WriteLine($content)

# And now, we shall close the file, for it has served its initial purpose.
$weather.Close()

# But wait! The journey is not yet complete. We shall now reopen the file to append more content.
$weather = [System.IO.StreamWriter]::new($filename, $true)
$weather.WriteLine($additionalContent)

# The file, now brimming with content, shall be closed once more.
$weather.Close()

# Let us now read from the file to bask in the glory of our written words.
$reader = [System.IO.StreamReader]::new($filename)
while ($reader.Peek() -ne -1) {
    $line = $reader.ReadLine()
    Write-Output $line
}

# And thus, we close the reader, for its duty is fulfilled.
$reader.Close()

