' This program is called Lix Counter.
' The purpose of this program is to count the number of words, sentences, and long words in a given text.
' It uses regular expressions extensively to perform these tasks.
' The program calculates the Lix readability index based on the counted values.

Imports System.Text.RegularExpressions

Module LixCounter

    Sub Main()
        ' Sample text to analyze
        Dim text As String = "This is a sample text. It contains several sentences. Some of the words are quite long."

        ' Count the number of words using a regular expression
        Dim wordPattern As String = "\b\w+\b"
        Dim wordMatches As MatchCollection = Regex.Matches(text, wordPattern)
        Dim wordCount As Integer = wordMatches.Count

        ' Count the number of sentences using a regular expression
        Dim sentencePattern As String = "[.!?]"
        Dim sentenceMatches As MatchCollection = Regex.Matches(text, sentencePattern)
        Dim sentenceCount As Integer = sentenceMatches.Count

        ' Count the number of long words (words with more than 6 characters) using a regular expression
        Dim longWordPattern As String = "\b\w{7,}\b"
        Dim longWordMatches As MatchCollection = Regex.Matches(text, longWordPattern)
        Dim longWordCount As Integer = longWordMatches.Count

        ' Calculate the Lix readability index
        Dim lix As Double = (wordCount / sentenceCount) + (longWordCount * 100 / wordCount)

        ' Output the results
        Console.WriteLine("Number of words: " & wordCount)
        Console.WriteLine("Number of sentences: " & sentenceCount)
        Console.WriteLine("Number of long words: " & longWordCount)
        Console.WriteLine("Lix readability index: " & lix)

        ' Wait for user input before closing
        Console.ReadLine()
    End Sub

End Module
