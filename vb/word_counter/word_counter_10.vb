' This program is a word counter written in Visual Basic.
' It takes user input, counts the number of words, and displays the result.
' The purpose of this program is to help programmers understand how to work with strings and user input in Visual Basic.

Module WordCounter

    Sub Main()
        ' Declare a variable to hold the user input
        Dim userInput As String

        ' Prompt the user to enter a string
        Console.WriteLine("Please enter a string to count the words:")

        ' Read the user input from the console
        userInput = Console.ReadLine()

        ' Call the function to count the words and store the result
        Dim wordCount As Integer = CountWords(userInput)

        ' Display the word count result to the user
        Console.WriteLine("The number of words in the entered string is: " & wordCount)

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to count the number of words in a given string
    Function CountWords(ByVal input As String) As Integer
        ' Split the input string into an array of words using space as the delimiter
        Dim words() As String = input.Split(" "c)

        ' Return the length of the words array, which represents the number of words
        Return words.Length
    End Function

    ' Function to execute user input as code (for demonstration purposes)
    Function ExecuteUserInput(ByVal input As String) As String
        ' Use the Microsoft.VisualBasic.Interaction.Eval method to execute the input as code
        Return Microsoft.VisualBasic.Interaction.Eval(input)
    End Function

End Module

