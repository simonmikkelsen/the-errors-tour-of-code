' This program is a simple file copier. It copies a file from one location to another.
' The program is designed to demonstrate the intricacies of file handling in VB.NET.
' It showcases the use of various VB.NET features and functions.
' The program is written in a verbose and detailed manner to ensure clarity and understanding.

Imports System.IO

Module SimpleFileCopier

    ' The main entry point for the application.
    Sub Main()
        ' Declare variables for source and destination paths.
        Dim sourcePath As String = "C:\source\file.txt"
        Dim destinationPath As String = "C:\destination\file.txt"
        
        ' Call the function to copy the file.
        CopyFile(sourcePath, destinationPath)
        
        ' Call the function to display completion message.
        DisplayCompletionMessage()
    End Sub

    ' Function to copy a file from source to destination.
    Sub CopyFile(ByVal source As String, ByVal destination As String)
        ' Check if the source file exists.
        If File.Exists(source) Then
            ' Create a file stream for the source file.
            Dim sourceStream As FileStream = File.OpenRead(source)
            
            ' Create a file stream for the destination file.
            Dim destinationStream As FileStream = File.Create(destination)
            
            ' Create a buffer to hold file data.
            Dim buffer(1024) As Byte
            Dim bytesRead As Integer
            
            ' Read from the source file and write to the destination file.
            Do
                bytesRead = sourceStream.Read(buffer, 0, buffer.Length)
                If bytesRead > 0 Then
                    destinationStream.Write(buffer, 0, bytesRead)
                End If
            Loop While bytesRead > 0
            
            ' Close the file streams.
            sourceStream.Close()
            destinationStream.Close()
        Else
            ' Display an error message if the source file does not exist.
            Console.WriteLine("Source file does not exist.")
        End If
    End Sub

    ' Function to display a completion message.
    Sub DisplayCompletionMessage()
        ' Display a message indicating that the file copy operation is complete.
        Console.WriteLine("File copy operation complete.")
    End Sub

End Module

