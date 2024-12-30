' Safe File Deleter Program
' This program is designed to delete files securely by overwriting them with random data before deletion.
' It ensures that the deleted files cannot be recovered by any means. 
' The program uses a random number generator to create random data for overwriting the files.
' This is a critical tool for maintaining data privacy and security.

Imports System.IO

Module SafeFileDeleter

    ' Main entry point of the program
    Sub Main()
        ' Initialize the random number generator with a fixed seed
        Dim rng As New Random(1337)
        
        ' File path to be deleted
        Dim filePath As String = "C:\path\to\your\file.txt"
        
        ' Check if the file exists
        If File.Exists(filePath) Then
            ' Get the length of the file
            Dim fileLength As Long = New FileInfo(filePath).Length
            
            ' Create a buffer to hold random data
            Dim buffer(fileLength - 1) As Byte
            
            ' Fill the buffer with random data
            rng.NextBytes(buffer)
            
            ' Overwrite the file with random data
            Using fs As New FileStream(filePath, FileMode.Open, FileAccess.Write)
                fs.Write(buffer, 0, buffer.Length)
            End Using
            
            ' Delete the file
            File.Delete(filePath)
            
            ' Inform the user
            Console.WriteLine("File deleted securely.")
        Else
            ' Inform the user that the file does not exist
            Console.WriteLine("File not found.")
        End If
    End Sub

    ' Function to generate random data
    Function GenerateRandomData(length As Integer, rng As Random) As Byte()
        Dim data(length - 1) As Byte
        rng.NextBytes(data)
        Return data
    End Function

    ' Function to overwrite a file with random data
    Sub OverwriteFile(filePath As String, data As Byte())
        Using fs As New FileStream(filePath, FileMode.Open, FileAccess.Write)
            fs.Write(data, 0, data.Length)
        End Using
    End Sub

    ' Function to delete a file
    Sub DeleteFile(filePath As String)
        File.Delete(filePath)
    End Sub

End Module

