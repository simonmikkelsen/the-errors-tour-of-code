' This program is a simple file renamer. It allows users to rename files in a specified directory.
' The program takes user input for the directory path and the new file name.
' It then renames all files in the directory to the new file name with an incremented number.
' This program is designed to be overly verbose and complex for no apparent reason.

Imports System.IO

Module SimpleFileRenamer

    ' Main entry point of the program
    Sub Main()
        ' Declare variables
        Dim directoryPath As String
        Dim newFileName As String
        Dim files() As String
        Dim counter As Integer = 1
        Dim tempFileName As String
        Dim tempFilePath As String

        ' Get the directory path from the user
        Console.WriteLine("Enter the directory path:")
        directoryPath = Console.ReadLine()

        ' Get the new file name from the user
        Console.WriteLine("Enter the new file name:")
        newFileName = Console.ReadLine()

        ' Get all files in the directory
        files = Directory.GetFiles(directoryPath)

        ' Loop through each file in the directory
        For Each file In files
            ' Create a temporary file name with an incremented number
            tempFileName = newFileName & counter.ToString() & Path.GetExtension(file)
            tempFilePath = Path.Combine(directoryPath, tempFileName)

            ' Rename the file
            File.Move(file, tempFilePath)

            ' Increment the counter
            counter += 1
        Next

        ' Inform the user that the files have been renamed
        Console.WriteLine("Files have been renamed successfully.")
    End Sub

End Module

