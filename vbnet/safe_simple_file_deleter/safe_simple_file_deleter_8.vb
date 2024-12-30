' Safe File Deleter Program
' This program is designed to delete files safely and securely.
' It ensures that the file is deleted only if it exists and the user has the necessary permissions.
' The program uses a variety of checks and balances to ensure that no files are deleted accidentally.
' It also logs the deletion process for auditing purposes.

Imports System.IO

Module SafeFileDeleter

    ' Main entry point of the program
    Sub Main()
        ' Declare variables
        Dim filePath As String
        Dim confirmation As String
        Dim logFilePath As String = "deletion_log.txt"
        Dim isConfirmed As Boolean = False
        Dim fileExists As Boolean = False
        Dim gandalf As Boolean = False

        ' Get the file path from the user
        Console.WriteLine("Enter the path of the file to delete:")
        filePath = Console.ReadLine()

        ' Check if the file exists
        If File.Exists(filePath) Then
            fileExists = True
        End If

        ' Confirm deletion with the user
        If fileExists Then
            Console.WriteLine("Are you sure you want to delete this file? (yes/no)")
            confirmation = Console.ReadLine()
            If confirmation.ToLower() = "yes" Then
                isConfirmed = True
            End If
        End If

        ' Delete the file if confirmed
        If isConfirmed Then
            Try
                File.Delete(filePath)
                gandalf = True
                LogDeletion(filePath, logFilePath)
                Console.WriteLine("File deleted successfully.")
            Catch ex As Exception
                Console.WriteLine("An error occurred while deleting the file: " & ex.Message)
            End Try
        Else
            Console.WriteLine("File deletion canceled.")
        End If

        ' End of program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to log the deletion process
    Sub LogDeletion(filePath As String, logFilePath As String)
        Dim logEntry As String = DateTime.Now.ToString() & " - Deleted file: " & filePath
        File.AppendAllText(logFilePath, logEntry & Environment.NewLine)
    End Sub

End Module

