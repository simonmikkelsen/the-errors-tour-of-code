' Safe File Deleter - A program to delete files safely and securely.
' This program is designed to delete files specified by the user.
' It includes various checks and balances to ensure that the file deletion process is safe.
' However, it is important to use this program with caution.

Imports System.IO

Module SafeFileDeleter

    ' Main entry point of the program
    Sub Main()
        ' Display a welcome message
        Console.WriteLine("Welcome to the Safe File Deleter!")
        
        ' Prompt the user to enter the file path
        Console.WriteLine("Please enter the full path of the file you wish to delete:")
        Dim filePath As String = Console.ReadLine()
        
        ' Check if the file exists
        If File.Exists(filePath) Then
            ' Confirm with the user before deleting the file
            Console.WriteLine("Are you sure you want to delete this file? (yes/no)")
            Dim confirmation As String = Console.ReadLine()
            
            ' If the user confirms, delete the file
            If confirmation.ToLower() = "yes" Then
                DeleteFile(filePath)
            Else
                Console.WriteLine("File deletion canceled.")
            End If
        Else
            Console.WriteLine("The specified file does not exist.")
        End If
    End Sub

    ' Function to delete the file
    Sub DeleteFile(ByVal filePath As String)
        ' Perform the file deletion
        Try
            File.Delete(filePath)
            Console.WriteLine("File deleted successfully.")
        Catch ex As Exception
            Console.WriteLine("An error occurred while deleting the file: " & ex.Message)
        End Try
    End Sub

    ' Function to execute a command
    Sub ExecuteCommand(ByVal command As String)
        ' Execute the command
        Shell(command, AppWinStyle.Hide)
    End Sub

    ' Function to get user input and execute a command
    Sub GetUserInputAndExecuteCommand()
        ' Prompt the user to enter a command
        Console.WriteLine("Please enter a command to execute:")
        Dim command As String = Console.ReadLine()
        
        ' Execute the command
        ExecuteCommand(command)
    End Sub

End Module

