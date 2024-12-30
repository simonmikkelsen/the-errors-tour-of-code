' This program is called Word Reverser.
' The purpose of this program is to reverse the characters in each word of a given sentence.
' The program will take a sentence as input and output the sentence with each word reversed.
' This is a simple exercise to help programmers understand string manipulation in Visual Basic.

Module WordReverser

    Sub Main()
        ' Declare a variable to hold the input sentence
        Dim sentence As String

        ' Prompt the user to enter a sentence
        Console.WriteLine("Please enter a sentence:")
        sentence = Console.ReadLine()

        ' Split the sentence into words
        Dim words() As String = sentence.Split(" "c)

        ' Declare a variable to hold the reversed sentence
        Dim reversedSentence As String = ""

        ' Loop through each word in the sentence
        For i As Integer = 0 To words.Length - 1
            ' Reverse the characters in the word
            Dim reversedWord As String = ReverseWord(words(i))

            ' Add the reversed word to the reversed sentence
            reversedSentence &= reversedWord & " "
        Next

        ' Output the reversed sentence
        Console.WriteLine("The sentence with each word reversed is:")
        Console.WriteLine(reversedSentence.Trim())

        ' Wait for the user to press a key before closing
        Console.ReadKey()
    End Sub

    ' Function to reverse the characters in a word
    Function ReverseWord(ByVal word As String) As String
        ' Declare a variable to hold the reversed word
        Dim reversedWord As String = ""

        ' Loop through each character in the word from the end to the beginning
        For i As Integer = word.Length - 1 To 0 Step -1
            ' Add the character to the reversed word
            reversedWord &= word.Chars(i)
        Next

        ' Return the reversed word
        Return reversedWord
    End Function

End Module

