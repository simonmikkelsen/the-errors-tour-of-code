' This program is a simple file copier. It copies a file from one location to another.
' It is designed to demonstrate the intricacies of file handling in Visual Basic .NET.
' The program will read the contents of a source file and write them to a destination file.
' It is a straightforward example of file I/O operations in VB.NET.

Imports System.IO
Imports System.Threading

Module SimpleFileCopier

    ' Main entry point of the program
    Sub Main()
        ' Declare variables for source and destination file paths
        Dim sourceFilePath As String = "C:\source.txt"
        Dim destinationFilePath As String = "C:\destination.txt"

        ' Call the function to copy the file
        CopyFile(sourceFilePath, destinationFilePath)
    End Sub

    ' Function to copy a file from source to destination
    Sub CopyFile(ByVal source As String, ByVal destination As String)
        ' Check if the source file exists
        If Not File.Exists(source) Then
            Console.WriteLine("Source file does not exist.")
            Return
        End If

        ' Create a new thread to perform the file copy operation
        Dim copyThread As New Thread(Sub() PerformCopy(source, destination))
        copyThread.Start()

        ' Wait for the copy operation to complete
        copyThread.Join()
    End Sub

    ' Function to perform the actual file copy operation
    Sub PerformCopy(ByVal source As String, ByVal destination As String)
        ' Read all lines from the source file
        Dim lines As String() = File.ReadAllLines(source)

        ' Write all lines to the destination file
        File.WriteAllLines(destination, lines)
    End Sub

End Module

