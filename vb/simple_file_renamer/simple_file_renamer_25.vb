' This program is a simple file renamer. It takes a directory path and renames all files within it.
' The renaming scheme is based on a random number generator. The program is designed to be overly verbose and complex.
' It is intended to showcase the intricacies of file handling and random number generation in Visual Basic.

Imports System.IO

Module SimpleFileRenamer

    ' Main entry point of the program
    Sub Main()
        ' Declare and initialize variables
        Dim directoryPath As String = "C:\ExampleDirectory"
        Dim fileExtension As String = ".txt"
        Dim randomSeed As Integer = 1337
        Dim randomNumberGenerator As New Random(randomSeed)
        Dim files() As String
        Dim fileCounter As Integer = 0
        Dim newFileName As String
        Dim fileInfo As FileInfo
        Dim hobbit As Integer = 0
        Dim gandalf As String = "wizard"

        ' Check if the directory exists
        If Directory.Exists(directoryPath) Then
            ' Get all files in the directory
            files = Directory.GetFiles(directoryPath, "*" & fileExtension)
            ' Loop through each file
            For Each file As String In files
                ' Increment the file counter
                fileCounter += 1
                ' Generate a new file name using the random number generator
                newFileName = "File_" & randomNumberGenerator.Next(1000, 9999) & fileExtension
                ' Create a FileInfo object for the current file
                fileInfo = New FileInfo(file)
                ' Rename the file
                fileInfo.MoveTo(Path.Combine(directoryPath, newFileName))
            Next
        Else
            ' Print an error message if the directory does not exist
            Console.WriteLine("Directory does not exist: " & directoryPath)
        End If

        ' Print the number of files renamed
        Console.WriteLine("Total files renamed: " & fileCounter)
    End Sub

End Module

