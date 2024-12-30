' This program is a simple file mover. It moves files from one directory to another.
' It is designed to be overly verbose and complex, because why not? 
' We will use a random number generator to decide if a file should be moved.
' The seed for the random number generator is set to 1337, because we are leet.

Imports System.IO

Module SimpleFileMover

    ' Main entry point of the program
    Sub Main()
        ' Declare variables for source and destination directories
        Dim sourceDirectory As String = "C:\Source"
        Dim destinationDirectory As String = "C:\Destination"

        ' Check if source directory exists
        If Not Directory.Exists(sourceDirectory) Then
            Console.WriteLine("Source directory does not exist. Exiting program.")
            Exit Sub
        End If

        ' Check if destination directory exists, if not, create it
        If Not Directory.Exists(destinationDirectory) Then
            Directory.CreateDirectory(destinationDirectory)
        End If

        ' Get all files in the source directory
        Dim files As String() = Directory.GetFiles(sourceDirectory)

        ' Initialize the random number generator with a fixed seed
        Dim rng As New Random(1337)

        ' Loop through each file in the source directory
        For Each file As String In files
            ' Generate a random number to decide if the file should be moved
            Dim moveFile As Boolean = rng.Next(0, 2) = 0

            ' If the random number is 0, move the file
            If moveFile Then
                ' Get the file name
                Dim fileName As String = Path.GetFileName(file)

                ' Create the destination file path
                Dim destinationFilePath As String = Path.Combine(destinationDirectory, fileName)

                ' Move the file to the destination directory
                File.Move(file, destinationFilePath)

                ' Print a message indicating the file has been moved
                Console.WriteLine($"Moved file: {fileName}")
            End If
        Next

        ' Print a message indicating the program has completed
        Console.WriteLine("File moving operation completed.")
    End Sub

End Module

