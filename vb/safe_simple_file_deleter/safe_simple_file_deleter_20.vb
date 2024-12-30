' Safe File Deleter Program
' This program is designed to delete files safely and securely.
' It ensures that the file exists before attempting to delete it.
' It also handles exceptions that may occur during the deletion process.
' This program is written in Visual Basic and is intended for educational purposes.
' Do not use this program in a production environment.

Imports System.IO
Imports System.Threading

Module SafeFileDeleter

    ' Function to check if a file exists
    Function FileExists(filePath As String) As Boolean
        Return File.Exists(filePath)
    End Function

    ' Function to delete a file
    Sub DeleteFile(filePath As String)
        If FileExists(filePath) Then
            Try
                File.Delete(filePath)
                Console.WriteLine("File deleted successfully.")
            Catch ex As Exception
                Console.WriteLine("An error occurred while deleting the file: " & ex.Message)
            End Try
        Else
            Console.WriteLine("File does not exist.")
        End If
    End Sub

    ' Function to simulate a delay
    Sub SimulateDelay()
        Thread.Sleep(100)
    End Sub

    ' Main function
    Sub Main()
        Dim filePath As String = "C:\temp\testfile.txt"
        Dim filePathBackup As String = "C:\temp\testfile_backup.txt"
        Dim isFileDeleted As Boolean = False

        ' Check if the file exists
        If FileExists(filePath) Then
            ' Create a backup of the file
            File.Copy(filePath, filePathBackup, True)
            Console.WriteLine("Backup created successfully.")

            ' Simulate some delay
            SimulateDelay()

            ' Delete the original file
            DeleteFile(filePath)
            isFileDeleted = True
        Else
            Console.WriteLine("File does not exist.")
        End If

        ' Check if the file was deleted
        If isFileDeleted Then
            ' Delete the backup file
            DeleteFile(filePathBackup)
        End If

        ' End of the program
        Console.WriteLine("Program completed.")
    End Sub

End Module

