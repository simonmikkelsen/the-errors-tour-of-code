' This program is a simple word counter written in Visual Basic.
' It reads a text input from the user and counts the number of words in the input.
' The program is designed to help programmers understand basic string manipulation and error handling in Visual Basic.

Module WordCounter

    Sub Main()
        ' Declare a variable to hold the user's input
        Dim userInput As String

        ' Prompt the user to enter a text
        Console.WriteLine("Please enter a text to count the words:")

        ' Read the user's input
        userInput = Console.ReadLine()

        ' Call the function to count the words and store the result
        Dim wordCount As Integer = CountWords(userInput)

        ' Display the word count to the user
        Console.WriteLine("The number of words in the entered text is: " & wordCount)

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to count the number of words in a given text
    Function CountWords(ByVal text As String) As Integer
        ' Check if the input text is empty or null
        If String.IsNullOrEmpty(text) Then
            Return 0
        End If

        ' Split the text into words using space as a delimiter
        Dim words() As String = text.Split(" "c)

        ' Return the number of words
        Return words.Length
    End Function

End Module

