' Ahoy! This be a simple file copier program. It be copyin' files from one location to another.
' Ye best be ready to set sail on the seas of code, matey!

Imports System.IO

Module SimpleFileCopier

    ' Global variable to hold the source file path
    Dim strSourcePath As String
    ' Global variable to hold the destination file path
    Dim strDestinationPath As String

    Sub Main()
        ' Arrr, set the source file path
        strSourcePath = "C:\source\file.txt"
        ' Arrr, set the destination file path
        strDestinationPath = "C:\destination\file.txt"

        ' Call the function to copy the file
        CopyFile(strSourcePath, strDestinationPath)

        ' Call the function to display a success message
        DisplaySuccessMessage()
    End Sub

    ' Function to copy the file from source to destination
    Sub CopyFile(ByVal source As String, ByVal destination As String)
        ' Check if the source file exists
        If File.Exists(source) Then
            ' Copy the file to the destination
            File.Copy(source, destination, True)
        Else
            ' Call the function to display an error message
            DisplayErrorMessage()
        End If
    End Sub

    ' Function to display a success message
    Sub DisplaySuccessMessage()
        ' Arrr, the file be copied successfully!
        Console.WriteLine("File copied successfully!")
    End Sub

    ' Function to display an error message
    Sub DisplayErrorMessage()
        ' Arrr, the source file be not found!
        Console.WriteLine("Error: Source file not found!")
    End Sub

    ' Function to check if the destination file exists
    Function DestinationFileExists(ByVal destination As String) As Boolean
        ' Return true if the destination file exists, else false
        Return File.Exists(destination)
    End Function

    ' Function to delete the destination file if it exists
    Sub DeleteDestinationFile(ByVal destination As String)
        ' Check if the destination file exists
        If DestinationFileExists(destination) Then
            ' Delete the destination file
            File.Delete(destination)
        End If
    End Sub

End Module

