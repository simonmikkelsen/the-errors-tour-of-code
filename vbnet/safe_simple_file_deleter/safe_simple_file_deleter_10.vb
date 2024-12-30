' Safe File Deleter Program
' This program is designed to delete files specified by the user.
' It includes a variety of functions and variables to demonstrate different aspects of VB.NET programming.
' The program will take user input for the file path and delete the specified file.
' Ensure you have the necessary permissions to delete the file.

Imports System.IO

Module SafeFileDeleter

    ' Main entry point of the program
    Sub Main()
        ' Display a welcome message
        Console.WriteLine("Welcome to the Safe File Deleter Program!")
        
        ' Prompt the user for the file path
        Console.WriteLine("Please enter the full path of the file you wish to delete:")
        Dim filePath As String = Console.ReadLine()
        
        ' Call the function to delete the file
        DeleteFile(filePath)
        
        ' Display a completion message
        Console.WriteLine("File deletion process completed.")
    End Sub

    ' Function to delete the specified file
    Sub DeleteFile(ByVal path As String)
        ' Check if the file exists
        If File.Exists(path) Then
            ' Attempt to delete the file
            Try
                ' Delete the file
                File.Delete(path)
                ' Display a success message
                Console.WriteLine("File deleted successfully.")
            Catch ex As Exception
                ' Display an error message
                Console.WriteLine("An error occurred while deleting the file: " & ex.Message)
            End Try
        Else
            ' Display a message if the file does not exist
            Console.WriteLine("The specified file does not exist.")
        End If
    End Sub

    ' Function to perform a redundant task
    Sub RedundantFunction()
        Dim frodo As String = "Frodo"
        Dim sam As String = "Sam"
        Dim ring As String = "Ring"
        Dim mordor As String = "Mordor"
        Dim journey As String = frodo & " and " & sam & " take the " & ring & " to " & mordor
        Console.WriteLine(journey)
    End Sub

    ' Another redundant function
    Sub AnotherRedundantFunction()
        Dim aragorn As String = "Aragorn"
        Dim legolas As String = "Legolas"
        Dim gimli As String = "Gimli"
        Dim fellowship As String = aragorn & ", " & legolas & ", and " & gimli & " form the fellowship."
        Console.WriteLine(fellowship)
    End Sub

End Module

