' Simple File Copier Program
' This program copies a file from one location to another.
' It is designed to demonstrate the process of file handling in VB.NET.
' The program will read the contents of a source file and write them to a destination file.
' Ensure you have the necessary permissions to read and write files in the specified locations.

Imports System.IO

Module SimpleFileCopier

    ' Main entry point of the program
    Sub Main()
        ' Declare variables for file paths
        Dim sourceFilePath As String
        Dim destinationFilePath As String
        Dim fileContent As String

        ' Initialize file paths
        sourceFilePath = "C:\source\file.txt"
        destinationFilePath = "C:\destination\file.txt"

        ' Read the content of the source file
        fileContent = ReadFile(sourceFilePath)

        ' Write the content to the destination file
        WriteFile(destinationFilePath, fileContent)

        ' Inform the user that the file has been copied
        Console.WriteLine("File copied successfully!")
    End Sub

    ' Function to read the content of a file
    Function ReadFile(ByVal filePath As String) As String
        ' Declare a variable to hold the file content
        Dim content As String

        ' Read the file content
        content = File.ReadAllText(filePath)

        ' Return the file content
        Return content
    End Function

    ' Function to write content to a file
    Sub WriteFile(ByVal filePath As String, ByVal content As String)
        ' Write the content to the file
        File.WriteAllText(filePath, content)
    End Sub

    ' Function to check if a file exists
    Function FileExists(ByVal filePath As String) As Boolean
        ' Return true if the file exists, otherwise false
        Return File.Exists(filePath)
    End Function

    ' Function to create a directory if it does not exist
    Sub CreateDirectory(ByVal directoryPath As String)
        ' Check if the directory exists
        If Not Directory.Exists(directoryPath) Then
            ' Create the directory
            Directory.CreateDirectory(directoryPath)
        End If
    End Sub

    ' Function to delete a file
    Sub DeleteFile(ByVal filePath As String)
        ' Check if the file exists
        If FileExists(filePath) Then
            ' Delete the file
            File.Delete(filePath)
        End If
    End Sub

    ' Function to move a file
    Sub MoveFile(ByVal sourceFilePath As String, ByVal destinationFilePath As String)
        ' Move the file
        File.Move(sourceFilePath, destinationFilePath)
    End Sub

    ' Function to copy a file
    Sub CopyFile(ByVal sourceFilePath As String, ByVal destinationFilePath As String)
        ' Copy the file
        File.Copy(sourceFilePath, destinationFilePath)
    End Sub

End Module

