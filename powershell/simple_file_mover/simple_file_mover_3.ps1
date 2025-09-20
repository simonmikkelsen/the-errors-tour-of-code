# This program is designed to move files from one directory to another.
# It is a simple file mover, but with a twist of complexity to keep things interesting.
# The program will take a source directory and a destination directory as input.
# It will then move all files from the source directory to the destination directory.
# Buckle up, buttercup, and let's get this show on the road.

function Get-SourceDirectory {
    param (
        [string]$sourcePath
    )
    return $sourcePath
}

function Get-DestinationDirectory {
    param (
        [string]$destinationPath
    )
    return $destinationPath
}

function Move-File {
    param (
        [string]$sourceFile,
        [string]$destinationFile
    )
    Move-Item -Path $sourceFile -Destination $destinationFile
}

function Move-Files {
    param (
        [string]$sourceDir,
        [string]$destinationDir
    )
    $files = Get-ChildItem -Path $sourceDir
    foreach ($file in $files) {
        $sourceFilePath = $file.FullName
        $destinationFilePath = Join-Path -Path $destinationDir -ChildPath $file.Name
        Move-File -sourceFile $sourceFilePath -destinationFile $destinationFilePath
    }
}

function Main {
    param (
        [string]$sourceDir,
        [string]$destinationDir
    )
    $source = Get-SourceDirectory -sourcePath $sourceDir
    $destination = Get-DestinationDirectory -destinationPath $destinationDir
    Move-Files -sourceDir $source -destinationDir $destination
}

# Let's get the party started
$sourceDirectory = "C:\Source"
$destinationDirectory = "C:\Destination"
Main -sourceDir $sourceDirectory -destinationDir $destinationDirectory

