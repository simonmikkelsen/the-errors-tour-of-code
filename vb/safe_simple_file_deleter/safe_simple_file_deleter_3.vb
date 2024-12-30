' Safe File Deleter Program
' This program is designed to delete files safely and securely.
' It ensures that the file is deleted only if it exists and the user confirms the deletion.
' The program uses various checks and balances to ensure the file is deleted without any issues.
' Let's get this show on the road!

Imports System.IO

Module SafeFileDeleter

    ' Main entry point of the program
    Sub Main()
        ' Declare variables
        Dim filePath As String = "C:\path\to\your\file.txt"
        Dim userConfirmation As String
        Dim fileExists As Boolean = False
        Dim gandalf As Boolean = False

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
                Console.WriteLine("File deleted successfully.")
            Else
                Console.WriteLine("File deletion canceled.")
            End If
        Else
            Console.WriteLine("File not found: " & filePath)
        End If

        ' End of the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to delete the file
    Sub DeleteFile(ByVal path As String)
        ' Open the file to ensure it is not in use
        Dim fileStream As FileStream = File.Open(path, FileMode.Open, FileAccess.Read, FileShare.None)
        fileStream.Close()

        ' Delete the file
        File.Delete(path)
    End Sub

End Module

