' This program is called Word Reverser.
' The purpose of this program is to reverse the characters in each word of a given sentence.
' It takes a sentence as input from the user, processes each word, and outputs the sentence with each word reversed.
' The program demonstrates basic string manipulation and array handling in Visual Basic .NET.

Module WordReverser

    Sub Main()
        ' Prompt the user to enter a sentence
        Console.WriteLine("Please enter a sentence:")

        ' Read the input sentence from the console
        Dim inputSentence As String = Console.ReadLine()

        ' Split the sentence into words using space as the delimiter
        Dim words() As String = inputSentence.Split(" "c)

        ' Initialize an empty list to hold the reversed words
        Dim reversedWords As New List(Of String)

        ' Loop through each word in the array
        For i As Integer = 0 To words.Length - 1
            ' Reverse the characters in the word
            Dim reversedWord As String = ReverseString(words(i))

            ' Add the reversed word to the list
            reversedWords.Add(reversedWord)
        Next

        ' Join the reversed words into a single sentence
        Dim reversedSentence As String = String.Join(" ", reversedWords)

        ' Output the reversed sentence to the console
        Console.WriteLine("Reversed sentence: " & reversedSentence)

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to reverse the characters in a string
    Function ReverseString(ByVal str As String) As String
        ' Convert the string to a character array
        Dim charArray() As Char = str.ToCharArray()

        ' Initialize an empty string to hold the reversed characters
        Dim reversedStr As String = String.Empty

        ' Loop through the character array in reverse order
        For i As Integer = charArray.Length - 1 To 0 Step -1
            ' Append each character to the reversed string
            reversedStr &= charArray(i)
        Next

        ' Return the reversed string
        Return reversedStr
    End Function

End Module

