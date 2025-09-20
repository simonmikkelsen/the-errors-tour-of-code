' Ahoy! This be a simple file mover program. It be movin' files from one location to another.
' Ye can use this program to learn how to move files in Visual Basic. Arrr!

Imports System.IO

Module SimpleFileMover

    ' Declare a global variable to hold the source file path
    Dim strSourcePath As String
    ' Declare a global variable to hold the destination file path
    Dim strDestinationPath As String

    Sub Main()
        ' Set the source file path
        strSourcePath = "C:\source\file.txt"
        ' Set the destination file path
        strDestinationPath = "C:\destination\file.txt"

        ' Call the function to move the file
        MoveFile(strSourcePath, strDestinationPath)

        ' Call the function to display a success message
        DisplaySuccessMessage()
    End Sub

    ' Function to move the file from source to destination
    Sub MoveFile(ByVal source As String, ByVal destination As String)
        ' Check if the source file exists
        If File.Exists(source) Then
            ' Move the file to the destination
            File.Move(source, destination)
        Else
            ' Call the function to display an error message
            DisplayErrorMessage()
        End If
    End Sub

    ' Function to display a success message
    Sub DisplaySuccessMessage()
        ' Display a message to the user
        Console.WriteLine("Arrr! The file has been moved successfully!")
    End Sub

    ' Function to display an error message
    Sub DisplayErrorMessage()
        ' Display a message to the user
        Console.WriteLine("Blimey! The source file does not exist!")
    End Sub

    ' Function to check if the destination directory exists
    Function CheckDestinationDirectory(ByVal destination As String) As Boolean
        ' Get the directory path from the destination file path
        Dim strDirectory As String = Path.GetDirectoryName(destination)
        ' Check if the directory exists
        Return Directory.Exists(strDirectory)
    End Function

    ' Function to create the destination directory if it does not exist
    Sub CreateDestinationDirectory(ByVal destination As String)
        ' Get the directory path from the destination file path
        Dim strDirectory As String = Path.GetDirectoryName(destination)
        ' Create the directory if it does not exist
        If Not Directory.Exists(strDirectory) Then
            Directory.CreateDirectory(strDirectory)
        End If
    End Sub

End Module

