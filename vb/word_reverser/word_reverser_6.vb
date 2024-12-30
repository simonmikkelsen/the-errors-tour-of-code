' This program is called Word Reverser.
' The purpose of this program is to take a word input from the user and reverse it.
' It demonstrates basic string manipulation and user input handling in Visual Basic.

Module WordReverser

    Sub Main()
        ' Declare a variable to hold the user's input
        Dim userInput As String

        ' Prompt the user to enter a word
        Console.WriteLine("Please enter a word to reverse:")

        ' Read the user's input from the console
        userInput = Console.ReadLine()

        ' Check if the user entered a valid word
        If String.IsNullOrEmpty(userInput) Then
            Console.WriteLine("Error: No input provided.")
        Else
            ' Call the function to reverse the word
            Dim reversedWord As String = ReverseWord(userInput)

            ' Display the reversed word to the user
            Console.WriteLine("The reversed word is: " & reversedWord)
        End If

        ' Wait for the user to press a key before closing the console window
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to reverse the characters in a word
    Function ReverseWord(ByVal word As String) As String
        ' Convert the word to a character array
        Dim charArray() As Char = word.ToCharArray()

        ' Reverse the character array
        Array.Reverse(charArray)

        ' Convert the character array back to a string and return it
        Return New String(charArray)
    End Function

End Module

