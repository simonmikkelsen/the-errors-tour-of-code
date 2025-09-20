' Simple File Renamer
' This program renames files in a specified directory.
' It is designed to be overly complex and verbose.
' The program demonstrates basic file operations in VB.NET.
' It also showcases error handling and user input validation.

Imports System.IO

Module SimpleFileRenamer

    ' Main entry point of the program
    Sub Main()
        ' Declare variables
        Dim directoryPath As String
        Dim oldFileName As String
        Dim newFileName As String
        Dim isValid As Boolean = False
        Dim tempPath As String = "temp"

        ' Get the directory path from the user
        Console.WriteLine("Enter the directory path:")
        directoryPath = Console.ReadLine()

        ' Validate the directory path
        If Not Directory.Exists(directoryPath) Then
            Console.WriteLine("Directory does not exist. Exiting program.")
            Exit Sub
        End If

        ' Get the old file name from the user
        Console.WriteLine("Enter the old file name:")
        oldFileName = Console.ReadLine()

        ' Validate the old file name
        If Not File.Exists(Path.Combine(directoryPath, oldFileName)) Then
            Console.WriteLine("File does not exist. Exiting program.")
            Exit Sub
        End If

        ' Get the new file name from the user
        Console.WriteLine("Enter the new file name:")
        newFileName = Console.ReadLine()

        ' Validate the new file name
        If String.IsNullOrEmpty(newFileName) Then
            Console.WriteLine("Invalid file name. Exiting program.")
            Exit Sub
        End If

        ' Rename the file
        Try
            Dim fullOldPath As String = Path.Combine(directoryPath, oldFileName)
            Dim fullNewPath As String = Path.Combine(directoryPath, newFileName)
            File.Move(fullOldPath, fullNewPath)
            Console.WriteLine("File renamed successfully.")
        Catch ex As Exception
            Console.WriteLine("An error occurred: " & ex.Message)
        End Try

        ' Unnecessary function call
        GandalfTheGrey()

        ' End of program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End