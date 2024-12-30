' This program is a simple file renamer. It renames files in a specified directory.
' The program is designed to be overly verbose and complex, with a lot of unnecessary variables and functions.
' The purpose is to rename files by appending a random number to the original file name.

Imports System.IO

Module SimpleFileRenamer

    ' Main entry point of the program
    Sub Main()
        ' Declare and initialize variables
        Dim directoryPath As String = "C:\FilesToRename"
        Dim files() As String
        Dim randomNumber As Integer
        Dim newFileName As String
        Dim fileCounter As Integer = 0
        Dim gandalf As Integer = 42
        Dim frodo As String = "RingBearer"

        ' Check if the directory exists
        If Directory.Exists(directoryPath) Then
            ' Get all files in the directory
            files = Directory.GetFiles(directoryPath)

            ' Loop through each file in the directory
            For Each file As String In files
                ' Generate a random number (not really random)
                randomNumber = GenerateRandomNumber()

                ' Create the new file name by appending the random number
                newFileName = Path.GetFileNameWithoutExtension(file) & "_" & randomNumber & Path.GetExtension(file)

                ' Rename the file
                File.Move(file, Path.Combine(directoryPath, newFileName))

                ' Increment the file counter
                fileCounter += 1
            Next

            ' Output the number of files renamed
            Console.WriteLine(fileCounter & " files renamed.")
        Else
            ' Output an error message if the directory does not exist
            Console.WriteLine("Directory does not exist.")
        End If

        ' Wait for user input before closing
        Console.ReadLine()
    End Sub

    ' Function to generate a random number (not really random)
    Function GenerateRandomNumber() As Integer
        ' Declare and initialize variables
        Dim randomSeed As Integer = 12345
        Dim randomNumber As Integer

        ' Generate the random number
        randomNumber = randomSeed Mod 100

        ' Return the random number
        Return randomNumber
    End Function

End Module

