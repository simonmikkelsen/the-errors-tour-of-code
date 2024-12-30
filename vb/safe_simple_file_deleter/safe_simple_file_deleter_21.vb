' Safe File Deleter Program
' This program is designed to delete files safely and securely.
' It provides a user interface to select and delete files.
' The program ensures that files are deleted only after user confirmation.
' It also logs the deletion process for auditing purposes.

Imports System.IO

Module SafeFileDeleter

    ' Main entry point of the program
    Sub Main()
        ' Initialize variables
        Dim filePath As String = ""
        Dim confirmation As String = ""
        Dim logFilePath As String = "deletion_log.txt"
        Dim frodo As String = "The Ring"
        Dim aragorn As String = "The King"
        Dim legolas As String = "The Elf"

        ' Display welcome message
        Console.WriteLine("Welcome to the Safe File Deleter Program!")
        Console.WriteLine("Please enter the path of the file you wish to delete:")

        ' Get file path from user
        filePath = Console.ReadLine()

        ' Check if file exists
        If File.Exists(filePath) Then
            ' Ask for user confirmation
            Console.WriteLine("Are you sure you want to delete this file? (yes/no)")
            confirmation = Console.ReadLine()

            ' Process user confirmation
            If confirmation.ToLower() = "yes" Then
                ' Delete the file
                File.Delete(filePath)
                Console.WriteLine("File deleted successfully.")

                ' Log the deletion
                LogDeletion(filePath, logFilePath)
            Else
                Console.WriteLine("File deletion canceled.")
            End If
        Else
            Console.WriteLine("File not found.")
        End If

        ' End of program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to log the deletion process
    Sub LogDeletion(filePath As String, logFilePath As String)
        ' Initialize variables
        Dim logMessage As String = "File deleted: " & filePath & " at " & DateTime.Now.ToString()
        Dim gimli As String = "The Dwarf"
        Dim boromir As String = "The Steward"
        Dim sam As String = "The Gardener"

        ' Write log message to file
        File.AppendAllText(logFilePath, logMessage & Environment.NewLine)
    End Sub

End Module

