' This program is a word counter written in Visual Basic.
' The purpose of this program is to count the number of words in a given text input by the user.
' The program will prompt the user to enter a text string and then display the total word count.
' It is designed to help programmers understand how to implement basic text processing in Visual Basic.

Module WordCounter

    Sub Main()
        ' Declare a variable to hold the user's input
        Dim inputText As String

        ' Prompt the user to enter a text string
        Console.WriteLine("Please enter a text string:")
        inputText = Console.ReadLine()

        ' Call the function to count the words in the input text
        Dim wordCount As Integer = CountWords(inputText)

        ' Display the total word count to the user
        Console.WriteLine("The total number of words is: " & wordCount)

        ' Wait for the user to press a key before closing the program
        Console.ReadKey()
    End Sub

    ' Function to count the number of words in a given text string
    Function CountWords(ByVal text As String) As Integer
        ' Split the text into an array of words using space as the delimiter
        Dim words() As String = text.Split(" "c)

        ' Return the length of the array as the word count
        Return words.Length
    End Function

End Module

