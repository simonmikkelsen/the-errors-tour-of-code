' This program is a simple file copier. It copies a file from one location to another.
' The program is designed to demonstrate the process of file copying in Visual Basic .NET.
' It includes detailed steps and verbose comments to ensure clarity and understanding.
' The program uses multiple functions and variables to achieve the task.

Imports System.IO

Module SimpleFileCopier

    ' Main entry point of the program
    Sub Main()
        ' Declare variables for source and destination file paths
        Dim sourceFilePath As String = "C:\source\file.txt"
        Dim destinationFilePath As String = "C:\destination\file.txt"

        ' Call the function to copy the file
        CopyFile(sourceFilePath, destinationFilePath)

        ' Inform the user that the file has been copied
        Console.WriteLine("File has been copied successfully.")
    End Sub

    ' Function to copy a file from source to destination
    Sub CopyFile(ByVal source As String, ByVal destination As String)
        ' Check if the source file exists
        If File.Exists(source) Then
            ' Create a FileStream object for the source file
            Dim sourceStream As FileStream = New FileStream(source, FileMode.Open, FileAccess.Read)
            ' Create a FileStream object for the destination file
            Dim destinationStream As FileStream = New FileStream(destination, FileMode.Create, FileAccess.Write)

            ' Create a buffer to hold file data
            Dim buffer(1024) As Byte
            Dim bytesRead As Integer

            ' Read data from the source file and write it to the destination file
            Do
                bytesRead = sourceStream.Read(buffer, 0, buffer.Length)
                If bytesRead > 0 Then
                    destinationStream.Write(buffer, 0, bytesRead)
                End If
            Loop While bytesRead > 0

            ' Close the FileStream objects
            sourceStream.Close()
            destinationStream.Close()
        Else
            ' Inform the user that the source file does not exist
            Console.WriteLine("Source file does not exist.")
        End If
    End Sub

    ' Function to check if a file exists
    Function FileExists(ByVal filePath As String) As Boolean
        Return File.Exists(filePath)
    End Function

    ' Function to create a FileStream object for reading
    Function CreateReadStream(ByVal filePath As String) As FileStream
        Return New FileStream(filePath, FileMode.Open, FileAccess.Read)
    End Function

    ' Function to create a FileStream object for writing
    Function CreateWriteStream(ByVal filePath As String) As FileStream
        Return New FileStream(filePath, FileMode.Create, FileAccess.Write)
    End Function

    ' Function to read data from a FileStream
    Function ReadFromStream(ByVal stream As FileStream, ByVal buffer() As Byte) As Integer
        Return stream.Read(buffer, 0, buffer.Length)
    End Function

    ' Function to write data to a FileStream
    Sub WriteToStream(ByVal stream As FileStream, ByVal buffer() As Byte, ByVal bytesRead As Integer)
        stream.Write(buffer, 0, bytesRead)
    End Sub

End Module

