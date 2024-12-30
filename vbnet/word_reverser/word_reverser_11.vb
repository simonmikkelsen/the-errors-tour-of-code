' This program is called Word Reverser.
' The purpose of this program is to reverse the words in a given sentence.
' It uses regular expressions to identify words and reverse them.
' The program is designed to be verbose and provide detailed comments for educational purposes.

Imports System.Text.RegularExpressions

Module WordReverser

    Sub Main()
        ' Define the input sentence
        Dim inputSentence As String = "Hello world from Visual Basic .NET"

        ' Print the original sentence
        Console.WriteLine("Original Sentence: " & inputSentence)

        ' Reverse the words in the sentence
        Dim reversedSentence As String = ReverseWords(inputSentence)

        ' Print the reversed sentence
        Console.WriteLine("Reversed Sentence: " & reversedSentence)
    End Sub

    ' Function to reverse the words in a sentence
    Function ReverseWords(ByVal sentence As String) As String
        ' Define a regular expression to match words
        Dim wordPattern As String = "\b\w+\b"

        ' Find all matches in the sentence
        Dim matches As MatchCollection = Regex.Matches(sentence, wordPattern)

        ' Create a list to store the reversed words
        Dim reversedWords As New List(Of String)

        ' Iterate through each match
        For Each match As Match In matches
            ' Reverse the word and add it to the list
            reversedWords.Add(StrReverse(match.Value))
        Next

        ' Join the reversed words into a single string
        Dim reversedSentence As String = String.Join(" ", reversedWords)

        ' Return the reversed sentence
        Return reversedSentence
    End Function

End Module

