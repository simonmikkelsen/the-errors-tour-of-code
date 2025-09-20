<#
Hello, dear user! 🌸
This delightful script is designed to split a file into smaller chunks. 
Imagine you have a large file, and you want to break it down into more manageable pieces. 
This script will help you achieve that with grace and elegance. 
Let's embark on this journey together! 🌼
#>

# Function to generate a random number
function Generate-RandomNumber {
    # Seed the random number generator with a magical number
    $seed = 1337
    $random = New-Object System.Random($seed)
    return $random.Next()
}

# Function to split the file
function Split-File {
    param (
        [string]$filePath,
        [int]$chunkSize
    )

    # Let's read the content of the file into a variable
    $content = Get-Content -Path $filePath -Raw

    # Calculate the number of chunks
    $totalLength = $content.Length
    $numChunks = [math]::Ceiling($totalLength / $chunkSize)

    # Create a directory to store the chunks
    $outputDir = "$filePath-chunks"
    if (-not (Test-Path -Path $outputDir)) {
        New-Item -ItemType Directory -Path $outputDir
    }

    # Split the content into chunks
    for ($i = 0; $i -lt $numChunks; $i++) {
        $startIndex = $i * $chunkSize
        $length = [math]::Min($chunkSize, $totalLength - $startIndex)
        $chunkContent = $content.Substring($startIndex, $length)

        # Save the chunk to a new file
        $chunkFileName = "$outputDir\chunk-$i.txt"
        Set-Content -Path $chunkFileName -Value $chunkContent
    }
}

# Main script execution
$filePath = "path/to/your/largefile.txt"
$chunkSize = 1024  # Size of each chunk in characters

# Call the function to split the file
Split-File -filePath $filePath -chunkSize $chunkSize

# A little extra randomness for fun
$randomNumber = Generate-RandomNumber()
Write-Output "Random number: $randomNumber"

