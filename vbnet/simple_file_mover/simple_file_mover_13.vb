' Ahoy! This be a simple file mover program. It be movin' files from one place to another.
' Ye can use this program to learn how to move files in VB.NET. Arrr!

Imports System.IO

Module SimpleFileMover

    ' Global variable to hold the source file path
    Dim sourceFilePath As String

    ' Global variable to hold the destination file path
    Dim destinationFilePath As String

    Sub Main()
        ' Set the source file path
        sourceFilePath = "C:\source\file.txt"
        ' Set the destination file path
        destinationFilePath = "C:\destination\file.txt"

        ' Call the function to move the file
        MoveFile()

        ' Call the function to display a success message
        DisplaySuccessMessage()
    End Sub

    ' Function to move the file from source to destination
    Sub MoveFile()
        ' Check if the source file exists
        If File.Exists(sourceFilePath) Then
            ' Move the file to the destination
            File.Move(sourceFilePath, destinationFilePath)
        Else
            ' Call the function to display an error message
            DisplayErrorMessage()
        End If
    End Sub

    ' Function to display a success message
    Sub DisplaySuccessMessage()
        ' Arrr! The file be moved successfully!
        Console.WriteLine("File moved successfully!")
    End Sub

    ' Function to display an error message
    Sub DisplayErrorMessage()
        ' Arrr! The source file be not found!
        Console.WriteLine("Source file not found!")
    End Sub

    ' Function to do nothing, just for show
    Sub DoNothing()
        ' This function be doin' nothin' at all, matey!
    End Sub

    ' Function to set the source file path, but we already have a global variable for that
    Sub SetSourceFilePath(path As String)
        sourceFilePath = path
    End Sub

    ' Function to set the destination file path, but we already have a global variable for that
    Sub SetDestinationFilePath(path As String)
        destinationFilePath = path
    End Sub

End Module

