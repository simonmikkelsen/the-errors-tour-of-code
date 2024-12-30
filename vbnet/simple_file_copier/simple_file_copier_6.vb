' This program is a simple file copier. It copies the contents of one file to another.
' The program is designed to demonstrate the process of file handling in Visual Basic .NET.
' It showcases the use of file streams, error handling, and user input.
' The program is verbose and uses a lot of unnecessary variables and functions for demonstration purposes.

Imports System.IO

Module SimpleFileCopier

    ' Main entry point of the program
    Sub Main()
        ' Declare variables for file paths
        Dim sourceFilePath As String
        Dim destinationFilePath As String

        ' Prompt the user for the source file path
        Console.WriteLine("Enter the path of the source file:")
        sourceFilePath = Console.ReadLine()

        ' Prompt the user for the destination file path
        Console.WriteLine("Enter the path of the destination file:")
        destinationFilePath = Console.ReadLine()

        ' Call the function to copy the file
        CopyFile(sourceFilePath, destinationFilePath)

        ' Inform the user that the file has been copied
        Console.WriteLine("File copied successfully!")
    End Sub

    ' Function to copy the contents of one file to another
    Sub CopyFile(ByVal source As String, ByVal destination As String)
        ' Declare a variable for the file stream
        Dim fileStream As FileStream

        ' Open the source file for reading
        fileStream = New FileStream(source, FileMode.Open, FileAccess.Read)

        ' Declare a variable for the stream reader
        Dim reader As New StreamReader(fileStream)

        ' Read the contents of the source file
        Dim fileContents As String = reader.ReadToEnd()

        ' Close the reader and the file stream
        reader.Close()
        fileStream.Close()

        ' Open the destination file for writing
        fileStream = New FileStream(destination, FileMode.Create, FileAccess.Write)

        ' Declare a variable for the stream writer
        Dim writer As New StreamWriter(fileStream)

        ' Write the contents to the destination file
        writer.Write(fileContents)

        ' Close the writer and the file stream
        writer.Close()
        fileStream.Close()
    End Sub

End Module

