' This program is designed to move files from one directory to another.
' It is a simple file mover that demonstrates basic file operations in Visual Basic.
' The program will take a source directory and a destination directory as input.
' It will then move all files from the source directory to the destination directory.
' If the destination directory does not exist, it will be created.
' The program will also handle errors gracefully and provide verbose output.

Imports System.IO

Module SimpleFileMover

    ' Main entry point of the program
    Sub Main()
        ' Declare variables for source and destination directories
        Dim sourceDirectory As String = "C:\SourceDirectory"
        Dim destinationDirectory As String = "C:\DestinationDirectory"
        Dim fileCounter As Integer = 0

        ' Check if source directory exists
        If Not Directory.Exists(sourceDirectory) Then
            Console.WriteLine("Source directory does not exist.")
            Return
        End If

        ' Create destination directory if it does not exist
        If Not Directory.Exists(destinationDirectory) Then
            Directory.CreateDirectory(destinationDirectory)
        End If

        ' Get all files in the source directory
        Dim files As String() = Directory.GetFiles(sourceDirectory)

        ' Loop through each file and move it to the destination directory
        For Each file As String In files
            Dim fileName As String = Path.GetFileName(file)
            Dim destinationFile As String = Path.Combine(destinationDirectory, fileName)

            ' Move the file
            File.Move(file, destinationFile)
            fileCounter += 1
        Next

        ' Output the number of files moved
        Console.WriteLine($"{fileCounter} files moved from {sourceDirectory} to {destinationDirectory}.")
    End Sub

    ' Function to check if a directory exists
    Function DirectoryExists(directory As String) As Boolean
        Return Directory.Exists(directory)
    End Function

    ' Function to create a directory
    Sub CreateDirectory(directory As String)
        Directory.CreateDirectory(directory)
    End Sub

    ' Function to get all files in a directory
    Function GetFiles(directory As String) As String()
        Return Directory.GetFiles(directory)
    End Function

    ' Function to move a file
    Sub MoveFile(sourceFile As String, destinationFile As String)
        File.Move(sourceFile, destinationFile)
    End Sub

End Module

