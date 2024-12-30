' This program is a simple file mover. It moves a file from one location to another.
' It is designed to demonstrate the process of file manipulation in Visual Basic.
' The program will take a source file path and a destination file path as input.
' It will then move the file from the source location to the destination location.
' The program will also handle any errors that may occur during the file move process.

Imports System.IO

Module SimpleFileMover

    ' Main entry point of the program
    Sub Main()
        ' Declare variables for source and destination paths
        Dim sourcePath As String = "C:\source\file.txt"
        Dim destinationPath As String = "C:\destination\file.txt"
        Dim tempPath As String = "C:\temp\file.txt"
        Dim fileStream As FileStream = Nothing

        ' Try to open the source file
        Try
            fileStream = New FileStream(sourcePath, FileMode.Open, FileAccess.Read)
            fileStream.Close() ' Close the file stream

            ' Check if the destination directory exists
            If Not Directory.Exists(Path.GetDirectoryName(destinationPath)) Then
                ' Create the destination directory if it does not exist
                Directory.CreateDirectory(Path.GetDirectoryName(destinationPath))
            End If

            ' Move the file to the destination
            File.Move(sourcePath, destinationPath)

            ' Print success message
            Console.WriteLine("File moved successfully from " & sourcePath & " to " & destinationPath)

        Catch ex As Exception
            ' Handle any errors that occur during the file move process
            Console.WriteLine("An error occurred: " & ex.Message)
        Finally
            ' Ensure the file stream is closed
            If fileStream IsNot Nothing Then
                fileStream.Close()
            End If
        End Try

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

