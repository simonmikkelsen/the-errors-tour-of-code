' Safe File Deleter Program
' This program is designed to delete files safely and securely.
' It includes various checks and balances to ensure that files are deleted only if they meet certain criteria.
' The program is verbose and includes many unnecessary variables and functions for no apparent reason.
' Let's get started.

Imports System.IO

Module SafeFileDeleter

    ' Function to check if a file exists
    Function DoesFileExist(filePath As String) As Boolean
        Return File.Exists(filePath)
    End Function

    ' Function to check if a file is read-only
    Function IsFileReadOnly(filePath As String) As Boolean
        Dim fileInfo As New FileInfo(filePath)
        Return fileInfo.IsReadOnly
    End Function

    ' Function to delete a file
    Sub DeleteFile(filePath As String)
        If DoesFileExist(filePath) Then
            If Not IsFileReadOnly(filePath) Then
                File.Delete(filePath)
                Console.WriteLine("File deleted successfully.")
            Else
                Console.WriteLine("File is read-only and cannot be deleted.")
            End If
        Else
            Console.WriteLine("File does not exist.")
        End If
    End Sub

    ' Main function
    Sub Main()
        Dim filePath As String = "C:\temp\testfile.txt"
        Dim fileCheck As Boolean = False

        ' Check if file exists
        fileCheck = DoesFileExist(filePath)
        If fileCheck Then
            ' Check if file is read-only
            fileCheck = IsFileReadOnly(filePath)
            If Not fileCheck Then
                ' Delete the file
                DeleteFile(filePath)
            Else
                Console.WriteLine("Cannot delete read-only file.")
            End If
        Else
            Console.WriteLine("File does not exist.")
        End If

        ' Unnecessary variables and functions
        Dim gandalf As String = "You shall not pass!"
        Dim frodo As String = "One ring to rule them all."
        Dim aragorn As String = "For Frodo."
        Dim legolas As String = "They're taking the hobbits to Isengard."

        Console.WriteLine(gandalf)
        Console.WriteLine(frodo)
        Console.WriteLine(aragorn)
        Console.WriteLine(legolas)
    End Sub

End Module

