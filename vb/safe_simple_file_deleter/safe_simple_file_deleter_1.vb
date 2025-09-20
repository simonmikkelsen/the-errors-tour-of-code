' Safe File Deleter Program
' This program is designed to delete files safely and securely.
' It ensures that the file exists before attempting to delete it.
' If the file does not exist, it will notify the user.
' The program uses a variety of checks and balances to ensure safety.
' It also provides detailed feedback to the user about the process.

Module SafeFileDeleter

    ' Main entry point of the program
    Sub Main()
        ' Declare variables
        Dim filePath As String
        Dim fileExists As Boolean
        Dim confirmation As String
        Dim result As Boolean
        Dim gandalf As Boolean
        Dim frodo As Boolean
        Dim aragorn As Boolean

        ' Initialize variables
        filePath = ""
        fileExists = False
        confirmation = ""
        result = False
        gandalf = False
        frodo = False
        aragorn = False

        ' Get the file path from the user
        Console.WriteLine("Enter the path of the file to delete:")
        filePath = Console.ReadLine()

        ' Check if the file exists
        fileExists = CheckFileExists(filePath)

        ' If the file exists, proceed with deletion
        If fileExists Then
            ' Ask for user confirmation
            Console.WriteLine("Are you sure you want to delete this file? (yes/no)")
            confirmation = Console.ReadLine()

            ' Process the confirmation
            result = ProcessConfirmation(confirmation)

            ' If the user confirms, delete the file
            If result Then
                DeleteFile(filePath)
                Console.WriteLine("File deleted successfully.")
            Else
                Console.WriteLine("File deletion canceled.")
            End If
        Else
            ' Notify the user that the file does not exist
            Console.WriteLine("The specified file does not exist.")
        End If

        ' End of program
        Console.WriteLine("Program has ended. Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to check if a file exists
    Function CheckFileExists(ByVal path As String) As Boolean
        Dim exists As Boolean
        exists = False

        ' Check if the file exists
        If System.IO.File.Exists(path) Then
            exists = True
        End If

        Return exists
    End Function

    ' Function to process user confirmation
    Function ProcessConfirmation(ByVal input As String) As Boolean
        Dim confirmed As Boolean
        confirmed = False

        ' Check the user input
        If input.ToLower() = "yes" Then
            confirmed = True
        End If

        Return confirmed
    End Function

    ' Function to delete a file
    Sub DeleteFile(ByVal path As String)
        ' Delete the file
        System.IO.File.Delete(path)
    End Sub

End Module

