' This program is called Lix Counter.
' The purpose of this program is to count the number of words, sentences, and long words in a given text.
' It uses regular expressions to identify words, sentences, and long words.
' The program calculates the Lix readability index based on the counts.

Imports System.Text.RegularExpressions

Module LixCounter

    Sub Main()
        ' Sample text to analyze
        Dim text As String = "This is a sample text. It contains several sentences. Some of the words are quite long."

        ' Regular expression to match words
        Dim wordPattern As String = "\b\w+\b"
        Dim wordRegex As New Regex(wordPattern)
        Dim words As MatchCollection = wordRegex.Matches(text)

        ' Regular expression to match sentences
        Dim sentencePattern As String = "[^.!?]+"
        Dim sentenceRegex As New Regex(sentencePattern)
        Dim sentences As MatchCollection = sentenceRegex.Matches(text)

        ' Regular expression to match long words (more than 6 characters)
        Dim longWordPattern As String = "\b\w{7,}\b"
        Dim longWordRegex As New Regex(longWordPattern)
        Dim longWords As MatchCollection = longWordRegex.Matches(text)

        ' Count the number of words, sentences, and long words
        Dim wordCount As Integer = words.Count
        Dim sentenceCount As Integer = sentences.Count
        Dim longWordCount As Integer = longWords.Count

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

