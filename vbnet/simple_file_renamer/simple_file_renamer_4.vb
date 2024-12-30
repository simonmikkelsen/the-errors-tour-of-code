' This program is a simple file renamer. It renames all files in a specified directory to a new name with an incrementing number.
' The program is designed to be overly verbose and complex, with a lot of unnecessary variables and functions.
' It is written in Visual Basic .NET and demonstrates basic file operations.

Imports System.IO

Module SimpleFileRenamer

    ' Main entry point of the program
    Sub Main()
        ' Declare variables
        Dim directoryPath As String = "C:\FilesToRename"
        Dim newName As String = "RenamedFile"
        Dim fileCounter As Integer = 1
        Dim fileArray() As String
        Dim fileName As String
        Dim fileExtension As String
        Dim newFileName As String
        Dim filePath As String
        Dim newFilePath As String
        Dim i As Integer = 0
        Dim j As Integer = 0
        Dim k As Integer = 0

        ' Check if the directory exists
        If Directory.Exists(directoryPath) Then
            ' Get all files in the directory
            fileArray = Directory.GetFiles(directoryPath)

            ' Loop through each file in the directory
            While i < fileArray.Length
                ' Get the file name and extension
                fileName = Path.GetFileNameWithoutExtension(fileArray(i))
                fileExtension = Path.GetExtension(fileArray(i))

                ' Create the new file name
                newFileName = newName & fileCounter.ToString() & fileExtension

                ' Create the full file paths
                filePath = Path.Combine(directoryPath, fileArray(i))
                newFilePath = Path.Combine(directoryPath, newFileName)

                ' Rename the file
                File.Move(filePath, newFilePath)

                ' Increment the file counter
                fileCounter += 1

                ' Increment the loop counter
                i += 1
            End While
        Else
            ' If the directory does not exist, display an error message
            Console.WriteLine("Directory does not exist: " & directoryPath)
        End If

        ' Display a message indicating the process is complete
        Console.WriteLine("File renaming process complete.")
    End Sub

    ' Function to get the file extension
    Function GetFileExtension(fileName As