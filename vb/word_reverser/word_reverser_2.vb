' This program is called Word Reverser.
' The purpose of this program is to reverse the characters in a given word.
' It takes a word as input from the user and outputs the reversed word.
' The program is designed to help programmers understand basic string manipulation in Visual Basic.

Module WordReverser

    Sub Main()
        ' Declare a variable to hold the input word
        Dim inputWord As String

        ' Prompt the user to enter a word
        Console.WriteLine("Enter a word to reverse:")
        inputWord = Console.ReadLine()

        ' Call the function to reverse the word
        Dim reversedWord As String = ReverseWord(inputWord)

        ' Output the reversed word
        Console.WriteLine("Reversed word: " & reversedWord)

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

    ' Function to reverse the characters in a word
    Function ReverseWord(ByVal word As String) As String
        ' Declare a variable to hold the reversed word
        Dim reversed As String = String.Empty

        ' Loop through the characters in the word from the end to the beginning
        For i As Integer = word.Length - 1 To 0 Step -1
            ' Append each character to the reversed variable
            reversed &= word(i)
        Next

        ' Return the reversed word
        Return reversed
    End Function

End Module

