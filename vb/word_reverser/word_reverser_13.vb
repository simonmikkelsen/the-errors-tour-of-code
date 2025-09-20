' This program is called Word Reverser.
' The purpose of this program is to reverse the characters in a given word.
' The program will take a word as input from the user and output the reversed word.
' It uses a global variable to store the word and the reversed word.

Module WordReverser

    ' Global variable to store the word input by the user
    Dim word As String

    ' Global variable to store the reversed word
    Dim reversedWord As String

    Sub Main()
        ' Prompt the user to enter a word
        Console.WriteLine("Enter a word to reverse:")
        word = Console.ReadLine()

        ' Call the function to reverse the word
        reversedWord = ReverseWord()

        ' Output the reversed word
        Console.WriteLine("Reversed word: " & reversedWord)

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

    ' Function to reverse the characters in the word
    Function ReverseWord() As String
        Dim reversed As String = ""
        For i As Integer = word.Length - 1 To 0 Step -1
            reversed &= word(i)
        Next
        Return reversed
    End Function

End Module

