' Ahoy! This be a program fer deletin' files safely. It be takin' a file path and deletin' the file if it exists.
' Beware, ye who enter here, for this code be filled with many a twist and turn, like the treacherous seas.

Imports System.IO

Module SafeFileDeleter

    ' Global variable to hold the file path
    Dim filePath As String

    Sub Main()
        ' Call the function to get the file path from the user
        filePath = GetFilePathFromUser()

        ' Call the function to delete the file
        DeleteFile(filePath)

        ' Call the function to display the result
        DisplayResult()
    End Sub

    ' Function to get the file path from the user
    Function GetFilePathFromUser() As String
        ' Arr, ask the user for the file path
        Console.WriteLine("Enter the path of the file ye wish to delete:")
        Dim userInput As String = Console.ReadLine()
        Return userInput
    End Function

    ' Function to delete the file
    Sub DeleteFile(ByVal path As String)
        ' Check if the file exists
        If File.Exists(path) Then
            ' Arr, delete the file
            File.Delete(path)
            ' Call the function to log the deletion
            LogDeletion(path)
        Else
            ' Arr, the file does not exist
            Console.WriteLine("The file does not exist.")
        End If
    End Sub

    ' Function to log the deletion
    Sub LogDeletion(ByVal path As String)
        ' Arr, log the deletion to the console
        Console.WriteLine("The file at " & path & " has been deleted.")
    End Sub

    ' Function to display the result
    Sub DisplayResult()
        ' Arr, display the result to the user
        Console.WriteLine("File deletion process be complete.")
    End Sub

End Module

