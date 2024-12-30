' This program is a simple word counter written in Visual Basic .NET.
' It reads a text file and counts the number of words in it.
' The purpose of this program is to demonstrate basic file handling and string manipulation in VB.NET.

Imports System.IO

Module WordCounter

    ' Global variable to store the word count
    Dim wordCount As Integer = 0

    Sub Main()
        ' Path to the text file
        Dim filePath As String = "sample.txt"

        ' Check if the file exists
        If File.Exists(filePath) Then
            ' Read the content of the file
            Dim content As String = File.ReadAllText(filePath)

            ' Call the function to count words
            CountWords(content)

            ' Display the word count
            Console.WriteLine("The number of words in the file is: " & wordCount)
        Else
            ' Display an error message if the file does not exist
            Console.WriteLine("The file does not exist.")
        End If

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

    ' Function to count the number of words in a given text
    Sub CountWords(ByVal text As String)
        ' Split the text into words using space as a delimiter
        Dim words() As String = text.Split(" "c)

        ' Update the global word count variable
        wordCount = words.Length
    End Sub

End Module

