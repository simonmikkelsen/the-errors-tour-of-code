' This program is called Word Reverser.
' The purpose of this program is to take a word input by the user and reverse the characters in the word.
' The reversed word is then displayed to the user.
' This program is written in Visual Basic .NET.

Module WordReverser

    Sub Main()
        ' Declare a variable to hold the user's input
        Dim inputWord As String

        ' Prompt the user to enter a word
        Console.WriteLine("Please enter a word to reverse:")

        ' Read the user's input
        inputWord = Console.ReadLine()

        ' Call the function to reverse the word
        Dim reversedWord As String = ReverseWord(inputWord)

        ' Display the reversed word to the user
        Console.WriteLine("The reversed word is: " & reversedWord)

        ' Wait for the user to press a key before closing the program
        Console.ReadKey()
    End Sub

    ' This function takes a word as input and returns the word with its characters reversed
    Function ReverseWord(ByVal word As String) As String
        ' Declare a variable to hold the reversed word
        Dim reversed As String = String.Empty

        ' Loop through each character in the word starting from the end
        For i As Integer = word.Length - 1 To 0 Step -1
            ' Append each character to the reversed variable
            reversed &= word(i)
        Next

        ' Return the reversed word
        Return reversed
    End Function

End Module

