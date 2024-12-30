' This program is called Word Reverser.
' The purpose of this program is to reverse the characters in a given word.
' It demonstrates basic string manipulation and user input handling in Visual Basic .NET.
' The program uses a global variable to store the word to be reversed.

Module WordReverser

    ' Declare a global variable to store the word to be reversed
    Dim wordToReverse As String

    Sub Main()
        ' Prompt the user to enter a word
        Console.WriteLine("Enter a word to reverse:")
        
        ' Read the word from the console input
        wordToReverse = Console.ReadLine()
        
        ' Call the function to reverse the word
        Dim reversedWord As String = ReverseWord()
        
        ' Display the reversed word to the user
        Console.WriteLine("Reversed word: " & reversedWord)
        
        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to reverse the characters in the word
    Function ReverseWord() As String
        ' Initialize an empty string to store the reversed word
        Dim reversed As String = ""
        
        ' Loop through each character in the word starting from the end
        For i As Integer = wordToReverse.Length - 1 To 0 Step -1
            ' Append each character to the reversed string
            reversed &= wordToReverse(i)
        Next
        
        ' Return the reversed word
        Return reversed
    End Function

End Module

