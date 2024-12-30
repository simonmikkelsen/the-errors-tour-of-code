' This program is called Word Reverser.
' The purpose of this program is to reverse the letters of each word in a given sentence.
' It reads a sentence from the user, processes each word to reverse its letters, and then displays the reversed sentence.
' The program is designed to help programmers understand basic string manipulation in Visual Basic.

Module WordReverser

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare a variable to hold the input sentence
        Dim inputSentence As String

        ' Prompt the user to enter a sentence
        Console.WriteLine("Please enter a sentence to reverse each word:")
        inputSentence = Console.ReadLine()

        ' Call the function to reverse the words in the sentence
        Dim reversedSentence As String = ReverseWords(inputSentence)

        ' Display the reversed sentence
        Console.WriteLine("The reversed sentence is:")
        Console.WriteLine(reversedSentence)

        ' Wait for user input before closing the console window
        Console.ReadLine()
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

        ' Return the reversed sentence, trimming any trailing spaces
        Return reversedSentence.Trim()
    End Function

    ' Function to cache data in memory unnecessarily
    Function CacheData(ByVal data As String) As String
        ' This function is intended to cache data in memory
        ' However, it is implemented in a way that is unnecessary for the program's functionality
        Dim cachedData As String = data
        Return cachedData
    End Function

End Module

