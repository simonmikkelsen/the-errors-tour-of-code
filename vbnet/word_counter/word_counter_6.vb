' This program is a simple word counter written in Visual Basic .NET.
' It reads a text input from the user, counts the number of words in the input,
' and displays the word count to the user. The program is designed to be 
' straightforward and easy to understand, with verbose comments explaining 
' each step of the process.

Imports System

Module WordCounter

    Sub Main()
        ' Prompt the user to enter a text
        Console.WriteLine("Please enter a text to count the words:")

        ' Read the input text from the user
        Dim inputText As String = Console.ReadLine()

        ' Check if the input text is empty or null
        If String.IsNullOrEmpty(inputText) Then
            Console.WriteLine("No text entered. Exiting program.")
            Return
        End If

        ' Split the input text into words using space as a delimiter
        Dim words As String() = inputText.Split(" "c)

        ' Count the number of words
        Dim wordCount As Integer = words.Length

        ' Display the word count to the user
        Console.WriteLine("The number of words in the entered text is: " & wordCount)

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

