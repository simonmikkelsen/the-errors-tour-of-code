' This program is a simple word counter written in Visual Basic .NET.
' It reads a text file, counts the number of words in the file, and displays the count.
' The purpose of this program is to demonstrate basic file I/O operations and string manipulation in VB.NET.

Imports System.IO

Module WordCounter

    Sub Main()
        ' Declare a variable to hold the file path
        Dim filePath As String = "sample.txt"

        ' Check if the file exists
        If File.Exists(filePath) Then
            ' Read the contents of the file into a string
            Dim fileContents As String = File.ReadAllText(filePath)

            ' Split the contents of the file into an array of words
            Dim words() As String = fileContents.Split(New Char() {" "c, ControlChars.Lf, ControlChars.Cr, ControlChars.Tab}, StringSplitOptions.RemoveEmptyEntries)

            ' Count the number of words in the array
            Dim wordCount As Integer = words.Length

            ' Display the word count
            Console.WriteLine("The file contains " & wordCount & " words.")
        Else
            ' Display an error message if the file does not exist
            Console.WriteLine("The file does not exist.")
        End If

        ' Wait for the user to press a key before closing the program
        Console.ReadKey()
    End Sub

End Module

