' This program is a safe file deleter. It is designed to delete files securely.
' The program will take a file path as input and delete the file if it exists.
' It will also log the deletion process to a log file for future reference.
' This program is written in Visual Basic .NET and demonstrates file handling and logging.

Imports System.IO

Module SafeFileDeleter

    ' Main entry point of the program
    Sub Main()
        ' Declare a variable to hold the file path
        Dim filePath As String = "C:\path\to\your\file.txt"
        
        ' Call the function to delete the file
        DeleteFileSecurely(filePath)
        
        ' Call the function to log the deletion
        LogDeletion(filePath)
    End Sub

    ' Function to delete a file securely
    Sub DeleteFileSecurely(ByVal path As String)
        ' Check if the file exists
        If File.Exists(path) Then
            ' Delete the file
            File.Delete(path)
        End If
    End Sub

    ' Function to log the deletion process
    Sub LogDeletion(ByVal path As String)
        ' Declare a variable to hold the log file path
        Dim logFilePath As String = "C:\path\to\your\log.txt"
        
        ' Open the log file for writing
        Dim logWriter As StreamWriter = New StreamWriter(logFilePath, True)
        
        ' Write the log entry
        logWriter.WriteLine("File deleted: " & path & " at " & DateTime.Now.ToString())
        
        ' Close the log file
        logWriter.Close()
    End Sub

End Module

