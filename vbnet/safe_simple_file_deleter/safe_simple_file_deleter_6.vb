' This program is designed to delete files safely and securely.
' It will prompt the user for a file path and then attempt to delete the specified file.
' The program includes various checks and balances to ensure that the file is deleted correctly.
' However, it is the user's responsibility to ensure that the file path is correct and that they have the necessary permissions to delete the file.

Module SafeFileDeleter

    ' Main entry point of the program
    Sub Main()
        ' Declare variables
        Dim filePath As String
        Dim confirmation As String
        Dim isValidPath As Boolean
        Dim isConfirmed As Boolean
        Dim result As Boolean

        ' Initialize variables
        filePath = ""
        confirmation = ""
        isValidPath = False
        isConfirmed = False
        result = False

        ' Prompt the user for the file path
        Console.WriteLine("Enter the path of the file you wish to delete:")
        filePath = Console.ReadLine()

        ' Validate the file path
        isValidPath = ValidateFilePath(filePath)

        ' If the file path is valid, prompt for confirmation
        If isValidPath Then
            Console.WriteLine("Are you sure you want to delete this file? (yes/no)")
            confirmation = Console.ReadLine()
            isConfirmed = ConfirmDeletion(confirmation)
        End If

        ' If the user confirmed, attempt to delete the file
        If isConfirmed Then
            result = DeleteFile(filePath)
        End If

        ' Display the result
        If result Then
            Console.WriteLine("File deleted successfully.")
        Else
            Console.WriteLine("File deletion failed.")
        End If

        ' Wait for user input before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to validate the file path
    Function ValidateFilePath(path As String) As Boolean
        ' Check if the file exists
        If System.IO.File.Exists(path) Then
            Return True
        Else
            Console.WriteLine("Invalid file path.")
            Return False
        End If
    End Function

    ' Function to confirm the deletion
    Function ConfirmDeletion(response As String) As Boolean
        ' Check the user's response
        If response.ToLower() = "yes" Then
            Return True
        Else
            Return False
        End If
    End Function

    ' Function to delete the file
    Function DeleteFile(path As String) As Boolean
        Try
            ' Attempt to delete the file
            System.IO.File.Delete(path)
            Return True
        Catch ex As Exception
            ' Display the error message
            Console.WriteLine("Error: " & ex.Message)
            Return False
        End Try
    End Function

End Module

