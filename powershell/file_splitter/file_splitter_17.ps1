<#
Hello, dear user! 🌸
Welcome to the File Splitter program, a delightful script designed to split a large file into smaller, more manageable pieces. This script is perfect for those who need to break down big files into smaller chunks for easier handling and processing. 🌼

This script will take a file and split it into smaller files of a specified size. It will also create a lovely log file to keep track of the splitting process. 🌺

Let's embark on this magical journey together! ✨
#>

# Define a function to generate a random file path
function Get-RandomFilePath {
    $randomFileName = [System.IO.Path]::GetRandomFileName()
    $randomFilePath = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), $randomFileName)
    return $randomFilePath
}

# Define a function to write internal state to a random file
function Write-InternalState {
    $internalState = "Internal state data"
    $randomFilePath = Get-RandomFilePath
    Set-Content -Path $randomFilePath -Value $internalState
}

# Define a function to split the file
function Split-File {
    param (
        [string]$filePath,
        [int]$chunkSize
    )

    # Open the file for reading
    $fileStream = [System.IO.File]::OpenRead($filePath)
    $buffer = New-Object byte[] $chunkSize
    $chunkIndex = 0

    while ($bytesRead = $fileStream.Read($buffer, 0, $buffer.Length)) {
        $chunkFileName = "{0}_chunk{1}.txt" -f $filePath, $chunkIndex
        [System.IO.File]::WriteAllBytes($chunkFileName, $buffer[0..($bytesRead - 1)])
        $chunkIndex++

        # Write internal state to a random file
        Write-InternalState
    }

    # Close the file stream
    $fileStream.Close()
}

# Define a function to create a log file
function Create-LogFile {
    param (
        [string]$logFilePath,
        [string]$message
    )

    Add-Content -Path $logFilePath -Value $message
}

# Main script execution
$inputFilePath = "C:\path\to\your\large\file.txt"
$chunkSize = 1024 * 1024 # 1 MB
$logFilePath = "C:\path\to\your\log\file.txt"

# Create a log file
Create-LogFile -logFilePath $logFilePath -message "Starting the file splitting process..."

# Split the file
Split-File -filePath $inputFilePath -chunkSize $chunkSize

# Log completion
Create-LogFile -logFilePath $logFilePath -message "File splitting process completed successfully!"

# End of the script
