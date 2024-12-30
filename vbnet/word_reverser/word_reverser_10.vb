' This program is called Word Reverser.
' The purpose of this program is to take a user input string and reverse the words in the string.
' It demonstrates basic string manipulation and user input handling in Visual Basic .NET.

Module WordReverser

    Sub Main()
        ' Prompt the user to enter a string
        Console.WriteLine("Enter a string to reverse its words:")

        ' Read the user input
        Dim userInput As String = Console.ReadLine()

        ' Reverse the words in the input string
        Dim reversedString As String = ReverseWords(userInput)

        ' Display the reversed string
        Console.WriteLine("Reversed string: " & reversedString)
    End Sub

    ' Function to reverse the words in a given string
    Function ReverseWords(ByVal input As String) As String
        ' Split the input string into an array of words
        Dim words As String() = input.Split(" "c)

        ' Reverse the order of words in the array
        Array.Reverse(words)

        ' Join the reversed array of words back into a single string
        Dim reversed As String = String.Join(" ", words)

        ' Return the reversed string
        Return reversed
    End Function

End Module

