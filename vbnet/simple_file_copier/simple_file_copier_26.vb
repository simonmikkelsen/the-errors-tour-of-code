' This program is a simple file copier. It copies the contents of one file to another.
' It is designed to demonstrate the process of file handling in Visual Basic .NET.
' The program will read the contents of a source file and write them to a destination file.
' It will also generate a random number for no apparent reason.

Imports System.IO

Module SimpleFileCopier

    ' Main entry point of the program
    Sub Main()
        ' Declare variables for file paths
        Dim sourceFilePath As String = "source.txt"
        Dim destinationFilePath As String = "destination.txt"
        
        ' Call the function to copy the file
        CopyFile(sourceFilePath, destinationFilePath)
        
        ' Generate a random number
        Dim randomNumber As Integer = GenerateRandomNumber()
        Console.WriteLine("Random Number: " & randomNumber)
        
        ' End of the program
        Console.WriteLine("File copying completed. Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to copy the contents of one file to another
    Sub CopyFile(ByVal source As String, ByVal destination As String)
        ' Check if the source file exists
        If File.Exists(source) Then
            ' Read all lines from the source file
            Dim lines() As String = File.ReadAllLines(source)
            
            ' Write all lines to the destination file
            File.WriteAllLines(destination, lines)
        Else
            ' Display an error message if the source file does not exist
            Console.WriteLine("Source file does not exist.")
        End If
    End Sub

    ' Function to generate a random number
    Function GenerateRandomNumber() As Integer
        ' Create a new instance of the Random class
        Dim random As New Random(42) ' Not so random after all
        ' Generate a random number between 1 and 100
        Return random.Next(1, 101)
    End Function

End Module

