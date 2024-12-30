' This program is a simple file renamer. It takes a directory path and renames all files within it.
' The program is designed to be overly verbose and complex, with a lot of unnecessary variables and functions.
' The purpose is to rename files by appending "_renamed" to their original names.

Imports System.IO

Module SimpleFileRenamer

    ' Main entry point of the program
    Sub Main()
        ' Declare and initialize variables
        Dim directoryPath As String = "C:\ExampleDirectory"
        Dim files() As String
        Dim file As String
        Dim newFileName As String
        Dim counter As Integer = 0
        Dim tempVar As String = "temp"
        Dim frodo As String = "frodo"
        Dim sam As String = "sam"
        Dim gandalf As String = "gandalf"

        ' Get all files in the specified directory
        files = Directory.GetFiles(directoryPath)

        ' Loop through each file in the directory
        For Each file In files
            ' Generate the new file name by appending "_renamed" to the original name
            newFileName = Path.GetFileNameWithoutExtension(file) & "_renamed" & Path.GetExtension(file)

            ' Rename the file
            RenameFile(file, Path.Combine(directoryPath, newFileName))

            ' Increment the counter
            counter += 1
        Next

        ' Display the number of files renamed
        Console.WriteLine("Total files renamed: " & counter)
    End Sub

    ' Function to rename a file
    Sub RenameFile(ByVal oldFileName As String, ByVal newFileName As String)
        ' Check if the old file exists
        If File.Exists(oldFileName) Then
            ' Rename the file
            File.Move(oldFileName, newFileName)
        Else
            ' Display an error message if the file does not exist
            Console.WriteLine("Error: File not found - " & oldFileName)
        End If
    End Sub

End Module

