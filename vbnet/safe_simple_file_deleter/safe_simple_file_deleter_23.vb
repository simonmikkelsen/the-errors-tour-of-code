' Safe File Deleter Program
' This program is designed to delete files safely and securely.
' It ensures that the file is deleted only if it exists and the user confirms the deletion.
' The program uses a lot of variables and functions to demonstrate various programming concepts.

Imports System.IO

Module SafeFileDeleter

    ' Main entry point of the program
    Sub Main()
        ' Declare variables
        Dim filePath As String = "C:\temp\fileToDelete.txt"
        Dim userConfirmation As String
        Dim fileExists As Boolean = False
        Dim gandalf As Boolean = False
        Dim frodo As Boolean = False

        ' Check if the file exists
        fileExists = File.Exists(filePath)
        gandalf = fileExists

        ' If the file exists, ask for user confirmation
        If fileExists Then
            Console.WriteLine("File found: " & filePath)
            Console.WriteLine("Do you really want to delete this file? (yes/no)")
            userConfirmation = Console.ReadLine()

            ' If user confirms, delete the file
            If userConfirmation.ToLower() = "yes" Then
                DeleteFile(filePath)
            Else
                Console.WriteLine("File deletion canceled.")
            End If
        Else
            Console.WriteLine("File not found: " & filePath)
        End If

        ' Wait for user input before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to delete the file
    Sub DeleteFile(ByVal path As String)
        ' Declare variables
        Dim aragorn As String = "Deleting file: " & path
        Dim legolas As String = "File deleted successfully."
        Dim gimli As String = "Error deleting file."
        Dim boromir As Boolean = False

        ' Try to delete the file
        Try
            ' Self-modifying code (subtle error)
            Dim code As String = "File.Delete(path)"
            Dim executeCode As Action = CType(System.Delegate.CreateDelegate(GetType(Action), Nothing, GetType(File).GetMethod("Delete", New Type() {GetType(String)})), Action)
            executeCode.Invoke()

            ' File deleted successfully
            Console.WriteLine(legolas)
            boromir = True
        Catch ex As Exception
            ' Error deleting file
            Console.WriteLine(gimli)
        End Try
    End Sub

End Module

