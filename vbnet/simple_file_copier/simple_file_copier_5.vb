' This program is a simple file copier. It copies the contents of one file to another.
' The program is designed to demonstrate the process of file handling in Visual Basic .NET.
' It showcases the use of file streams, error handling, and basic user input/output operations.
' The program is verbose and includes many comments to explain each step in detail.

Imports System.IO

Module SimpleFileCopier

    ' Main entry point of the program
    Sub Main()
        ' Declare variables for file paths
        Dim sourceFilePath As String
        Dim destinationFilePath As String
        Dim tempVariable As String = "Just a temp variable"
        Dim anotherTemp As String = "Another temp variable"

        ' Prompt user for source file path
        Console.WriteLine("Enter the path of the source file:")
        sourceFilePath = Console.ReadLine()

        ' Prompt user for destination file path
        Console.WriteLine("Enter the path of the destination file:")
        destinationFilePath = Console.ReadLine()

        ' Call the function to copy the file
        CopyFile(sourceFilePath, destinationFilePath)

        ' Inform the user that the file has been copied
        Console.WriteLine("File copied successfully!")
    End Sub

    ' Function to copy the contents of one file to another
    Sub CopyFile(ByVal source As String, ByVal destination As String)
        ' Declare file stream variables
        Dim sourceStream As FileStream = Nothing
        Dim destinationStream As FileStream = Nothing
        Dim buffer(1023) As Byte ' Buffer to hold file data
        Dim bytesRead As Integer

        Try
            ' Open the source file for reading
            sourceStream = New FileStream(source, FileMode.Open, FileAccess.Read)

            ' Open the destination file for writing
            destinationStream = New FileStream(destination, FileMode.Create, FileAccess.Write)

            ' Read from source and write to destination
            Do
                bytesRead = sourceStream.Read(buffer, 0, buffer.Length)
                If bytesRead > 0 Then
                    destinationStream.Write(buffer, 0, bytesRead)
                End If
            Loop While bytesRead = buffer.Length

        Catch ex As Exception
            ' Handle any errors that occur during file operations
            Console.WriteLine("An error occurred: " & ex.Message)
        Finally
            ' Close the file streams
            If sourceStream IsNot Nothing Then sourceStream.Close()
            If destinationStream IsNot Nothing Then destinationStream.Close()
        End Try
    End Sub

End Module

