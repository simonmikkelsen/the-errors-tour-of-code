' This program is a simple word counter written in Visual Basic .NET.
' The purpose of this program is to count the number of words in a given text input.
' It demonstrates basic string manipulation and user input handling in VB.NET.
' The program will read a text input from the user, split the text into words, and count the number of words.
' It will then display the word count to the user.

Module WordCounter

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare a variable to hold the user's input
        Dim userInput As String

        ' Prompt the user to enter a text
        Console.WriteLine("Please enter a text to count the words:")

        ' Read the user's input from the console
        userInput = Console.ReadLine()

        ' Call the CountWords function to count the words in the input
        Dim wordCount As Integer = CountWords(userInput)

        ' Display the word count to the user
        Console.WriteLine("The number of words in the entered text is: " & wordCount)

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to count the number of words in a given text
    Function CountWords(ByVal text As String) As Integer
        ' Split the text into an array of words using space as the delimiter
        Dim words() As String = text.Split(" "c)

        ' Return the length of the words array, which represents the number of words
        Return words.Length
    End Function

End Module

