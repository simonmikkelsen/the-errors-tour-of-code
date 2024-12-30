' This program is a word counter written in Visual Basic .NET.
' It uses regular expressions to count the number of words in a given text.
' The purpose of this program is to demonstrate the use of regular expressions in VB.NET.
' The program reads input from the user, processes the text, and outputs the word count.

Imports System.Text.RegularExpressions

Module WordCounter

    Sub Main()
        ' Prompt the user to enter a text
        Console.WriteLine("Enter the text to count words:")
        Dim inputText As String = Console.ReadLine()

        ' Define a regular expression pattern to match words
        Dim pattern As String = "\b\w+\b"

        ' Create a Regex object with the defined pattern
        Dim regex As New Regex(pattern)

        ' Find all matches in the input text
        Dim matches As MatchCollection = regex.Matches(inputText)

        ' Output the number of words found
        Console.WriteLine("Word count: " & matches.Count)

        ' Wait for the user to press a key before exiting
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

