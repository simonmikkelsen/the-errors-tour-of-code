' This program is called Word Reverser.
' The purpose of this program is to take a word input by the user and reverse the characters in the word.
' The program will then display the reversed word to the user.
' This program is written in Visual Basic.

Module WordReverser

    Sub Main()
        ' Declare a variable to hold the user's input
        Dim userInput As String

        ' Prompt the user to enter a word
        Console.WriteLine("Please enter a word to reverse:")

        ' Read the user's input from the console
        userInput = Console.ReadLine()

        ' Call the function to reverse the word and store the result in a variable
        Dim reversedWord As String = ReverseWord(userInput)

        ' Display the reversed word to the user
        Console.WriteLine("The reversed word is: " & reversedWord)

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' This function takes a word as input and returns the word with its characters reversed
    Function ReverseWord(ByVal word As String) As String
        ' Declare a variable to hold the reversed word
        Dim reversed As String = ""

        ' Loop through each character in the word starting from the end
        For i As Integer = word.Length - 1 To 0 Step -1
            ' Append each character to the reversed variable
            reversed &= word(i)
        Next

        ' Return the reversed word
        Return reversed
    End Function

End Module

