' This program is a simple file copier. It copies the contents of one file to another.
' The purpose of this program is to demonstrate file handling in Visual Basic .NET.
' It showcases the use of file streams, error handling, and basic user input.
' The program is designed to be overly verbose and complex for educational purposes.

Imports System.IO

Module SimpleFileCopier

    ' Main entry point of the program
    Sub Main()
        ' Declare variables for file paths
        Dim sourceFilePath As String = ""
        Dim destinationFilePath As String = ""

        ' Prompt user for source file path
        Console.WriteLine("Enter the path of the source file:")
        sourceFilePath = Console.ReadLine()

        ' Prompt user for destination file path
        Console.WriteLine("Enter the path of the destination file:")
        destinationFilePath = Console.ReadLine()

        ' Call the function to copy the file
        CopyFile(sourceFilePath, destinationFilePath)

        ' Inform the user that the file has been copied
        Console.WriteLine("File has been copied successfully.")
    End Sub

    ' Function to copy the contents of one file to another
    Sub CopyFile(ByVal source As String, ByVal destination As String)
        ' Declare file stream variables
        Dim sourceStream As FileStream = Nothing
        Dim destinationStream As FileStream = Nothing

        Try
            ' Open the source file for reading
            sourceStream = New FileStream(source, FileMode.Open, FileAccess.Read)

            ' Open the destination file for writing
            destinationStream = New FileStream(destination, FileMode.Create, FileAccess.Write)

            ' Declare a buffer to hold file data
            Dim buffer(1024) As Byte
            Dim bytesRead As Integer

            ' Read from the source file and write to the destination file
            Do
                bytesRead = sourceStream.Read(buffer, 0, buffer.Length)
                destinationStream.Write(buffer, 0, bytesRead)
            Loop While bytesRead > 0

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

