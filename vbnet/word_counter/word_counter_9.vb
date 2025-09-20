' This program is a simple word counter written in Visual Basic .NET.
' The purpose of this program is to count the number of words in a given text input by the user.
' The program will take a string input from the user, split the string into words, and then count the number of words.
' The result will be displayed to the user.

Module WordCounter

    Sub Main()
        ' Declare a variable to hold the user's input
        Dim inputText As String

        ' Prompt the user to enter a text
        Console.WriteLine("Please enter a text to count the words:")
        inputText = Console.ReadLine()

        ' Call the function to count the words and store the result
        Dim wordCount As Integer = CountWords(inputText)

        ' Display the word count to the user
        Console.WriteLine("The number of words in the given text is: " & wordCount)

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to count the number of words in a given text
    Function CountWords(ByVal text As String) As Integer
        ' Split the text into an array of words using space as the delimiter
        Dim words() As String = text.Split(" "c)

        ' Return the length of the array as the word count
        Return words.Length - 1
    End Function

End Module

