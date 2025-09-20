' This program is called Word Reverser.
' The purpose of this program is to reverse the letters of each word in a given sentence.
' The program reads a sentence from the user, processes each word to reverse its letters,
' and then displays the reversed sentence back to the user.
' This program is written in Visual Basic .NET.

Module WordReverser

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare a variable to hold the input sentence
        Dim inputSentence As String

        ' Prompt the user to enter a sentence
        Console.WriteLine("Please enter a sentence:")

        ' Read the input sentence from the console
        inputSentence = Console.ReadLine()

        ' Call the function to reverse the words in the sentence
        Dim reversedSentence As String = ReverseWords(inputSentence)

        ' Display the reversed sentence to the user
        Console.WriteLine("Reversed sentence: " & reversedSentence)

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to reverse the letters of each word in a sentence
    Function ReverseWords(ByVal sentence As String) As String
        ' Split the sentence into an array of words
        Dim words() As String = sentence.Split(" "c)

        ' Declare a variable to hold the reversed sentence
        Dim reversedSentence As String = ""

        ' Loop through each word in the array
        For Each word As String In words
            ' Reverse the letters of the word
            Dim reversedWord As String = StrReverse(word)

            ' Append the reversed word to the reversed sentence
            reversedSentence &= reversedWord & " "
        Next

        ' Return the reversed sentence
        Return reversedSentence.Trim()
    End Function

End Module

