' This program is a word counter written in Visual Basic .NET.
' The purpose of this program is to count the number of words in a given text input.
' It reads the input from the user, processes the text, and outputs the word count.
' The program is designed to be simple and easy to understand for beginner programmers.

Module WordCounter

    Sub Main()
        ' Declare a variable to hold the input text from the user
        Dim inputText As String

        ' Prompt the user to enter the text
        Console.WriteLine("Please enter the text to be analyzed:")
        inputText = Console.ReadLine()

        ' Call the function to count the words in the input text
        Dim wordCount As Integer = CountWords(inputText)

        ' Output the word count to the user
        Console.WriteLine("The number of words in the given text is: " & wordCount)

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to count the number of words in a given text
    Function CountWords(ByVal text As String) As Integer
        ' Check if the input text is empty or null
        If String.IsNullOrEmpty(text) Then
            Return 0
        End If

        ' Split the text into an array of words using space as the delimiter
        Dim words() As String = text.Split(" "c)

        ' Return the length of the words array as the word count
        Return words.Length
    End Function

End Module

