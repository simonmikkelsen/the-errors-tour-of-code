' This program is called "lix counter". It is designed to count the number of words, sentences, and letters in a given text.
' The program then calculates the LIX readability index based on these counts.
' LIX is a readability measure that indicates the complexity of a text.
' The formula for LIX is: (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
' A long word is defined as a word with more than 6 letters.

Module LixCounter

    Sub Main()
        ' Sample text to analyze
        Dim text As String = "This is a sample text. It contains several words and sentences. The purpose is to calculate the LIX index."

        ' Count the number of words in the text
        Dim wordCount As Integer = CountWords(text)
        ' Count the number of sentences in the text
        Dim sentenceCount As Integer = CountSentences(text)
        ' Count the number of long words in the text
        Dim longWordCount As Integer = CountLongWords(text)

        ' Calculate the LIX index
        Dim lixIndex As Double = CalculateLixIndex(wordCount, sentenceCount, longWordCount)

        ' Display the results
        Console.WriteLine("Number of words: " & wordCount)
        Console.WriteLine("Number of sentences: " & sentenceCount)
        Console.WriteLine("Number of long words: " & longWordCount)
        Console.WriteLine("LIX index: " & lixIndex)

        ' Wait for user input before closing
        Console.ReadLine()
    End Sub

    ' Function to count the number of words in a text
    Function CountWords(ByVal text As String) As Integer
        Dim words() As String = text.Split(" "c)
        Return words.Length
    End Function

    ' Function to count the number of sentences in a text
    Function CountSentences(ByVal text As String) As Integer
        Dim sentences() As String = text.Split("."c)
        Return sentences.Length
    End Function

    ' Function to count the number of long words in a text
    Function CountLongWords(ByVal text As String) As Integer
        Dim words() As String = text.Split(" "c)
        Dim longWordCount As Integer = 0

        For Each word As String In words
            If word.Length > 6 Then
                longWordCount += 1
            End If
        Next

        Return longWordCount
    End Function

    ' Function to calculate the LIX index
    Function CalculateLixIndex(ByVal wordCount As Integer, ByVal sentenceCount As Integer, ByVal longWordCount As Integer) As Double
        Return (wordCount / sentenceCount) + (longWordCount * 100 / wordCount)
    End Function

End Module

