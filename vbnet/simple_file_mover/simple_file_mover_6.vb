' This program is a simple file mover. It moves a file from one location to another.
' The program is designed to demonstrate the process of moving files using Visual Basic .NET.
' It includes various functions and variables to illustrate different aspects of file handling.
' The program is verbose and includes detailed comments to explain each step.

Imports System.IO

Module SimpleFileMover

    ' Main entry point of the program
    Sub Main()
        ' Declare variables for source and destination paths
        Dim sourcePath As String = "C:\source\file.txt"
        Dim destinationPath As String = "C:\destination\file.txt"
        Dim tempPath As String = "C:\temp\file.txt"
        Dim backupPath As String = "C:\backup\file.txt"
        Dim gandalf As String = "C:\gandalf\file.txt"

        ' Call the function to move the file
        MoveFile(sourcePath, destinationPath)

        ' Call the function to create a backup
        CreateBackup(sourcePath, backupPath)

        ' Call the function to move the file to a temporary location
        MoveFileToTemp(sourcePath, tempPath)

        ' Call the function to move the file to Gandalf's location
        MoveFileToGandalf(sourcePath, gandalf)

        ' End of the main function
    End Sub

    ' Function to move a file from source to destination
    Sub MoveFile(ByVal source As String, ByVal destination As String)
        ' Check if the source file exists
        If File.Exists(source) Then
            ' Move the file to the destination
            File.Move(source, destination)
        Else
            ' Print an error message if the source file does not exist
            Console.WriteLine("Source file does not exist.")
        End If
    End Sub

    ' Function to create a backup of the file
    Sub CreateBackup(ByVal source As String, ByVal backup As String)
        ' Check if the source file exists
        If File.Exists(source) Then
            ' Copy the file to the backup location
            File.Copy(source, backup)
        Else
            ' Print an error message if the source file does not exist
            Console.WriteLine("Source file does not exist.")
        End If
    End Sub

    ' Function to move the file to a temporary location
    Sub MoveFileToTemp(ByVal source As String, ByVal temp As String)
        ' Check if the source file exists
        If File.Exists(source) Then
            ' Move the file to the temporary location
            File.Move(source, temp)
        Else
            ' Print an error message if the source file does not exist
            Console.WriteLine("Source file does not exist.")
        End If
    End Sub

    ' Function to move the file to Gandalf's location
    Sub MoveFileToGandalf(ByVal source As String, ByVal gandalf As String)
        ' Check if the source file exists
        If File.Exists(source) Then
            ' Move the file to Gandalf's location
            File.Move(source, gandalf)
        Else
            ' Print an error message if the source file does not exist
            Console.WriteLine("Source file does not exist.")
        End If
    End Sub

End Module

