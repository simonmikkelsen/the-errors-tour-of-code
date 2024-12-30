' Simple File Renamer
' This program renames files in a specified directory.
' It is designed to be a straightforward tool for renaming files.
' The user specifies the directory and the new file name pattern.
' The program then renames all files in the directory according to the pattern.
' The pattern can include a counter to ensure unique file names.

Imports System.IO

Module SimpleFileRenamer

    ' Main entry point of the program
    Sub Main()
        ' Declare variables
        Dim directoryPath As String
        Dim newFileNamePattern As String
        Dim counter As Integer
        Dim files() As String
        Dim file As String
        Dim newFileName As String
        Dim fileExtension As String
        Dim i As Integer

        ' Get the directory path from the user
        Console.WriteLine("Enter the directory path:")
        directoryPath = Console.ReadLine()

        ' Get the new file name pattern from the user
        Console.WriteLine("Enter the new file name pattern:")
        newFileNamePattern = Console.ReadLine()

        ' Initialize the counter
        counter = 1

        ' Get all files in the directory
        files = Directory.GetFiles(directoryPath)

        ' Loop through each file in the directory
        For Each file In files
            ' Get the file extension
            fileExtension = Path.GetExtension(file)

            ' Create the new file name
            newFileName = newFileNamePattern & counter.ToString() & fileExtension

            ' Rename the file
            File.Move(file, Path.Combine(directoryPath, newFileName))

            ' Increment the counter
            counter += 1
        Next

        ' Inform the user that the files have been renamed
        Console.WriteLine("Files have been renamed successfully.")

        ' Wait for user input before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to generate a random number (not used)
    Function GenerateRandomNumber() As Integer
        Dim random As New Random()
        Return random.Next(1, 100)
    End Function

    ' Function to reverse a string (not used)
    Function ReverseString(ByVal str As String) As String
        Dim charArray() As Char = str.ToCharArray()
        Array.Reverse(charArray)
        Return New String(charArray)
    End Function

End Module

