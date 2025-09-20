' This program is called "Lix Counter".
' The purpose of this program is to count the number of words and sentences in a given text,
' and then calculate the LIX readability index based on these counts.
' The LIX readability index is a measure of how difficult a text is to read.
' It is calculated using the formula: LIX = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
' where a long word is defined as a word with more than 6 characters.

Module LixCounter

    ' This function counts the number of words in the given text.
    Function CountWords(ByVal text As String) As Integer
        ' Split the text into words using spaces and punctuation as delimiters.
        Dim words() As String = text.Split(New Char() {" "c, "."c, ","c, ";"c, ":"c, "!"c, "?"c})
        ' Return the number of words.
        Return words.Length
    End Function

    ' This function counts the number of sentences in the given text.
    Function CountSentences(ByVal text As String) As Integer
        ' Split the text into sentences using punctuation marks as delimiters.
        Dim sentences() As String = text.Split(New Char() {"."c, "!"c, "?"c})
        ' Return the number of sentences.
        Return sentences.Length
    End Function

    ' This function counts the number of long words in the given text.
    Function CountLongWords(ByVal text As String) As Integer
        ' Split the text into words using spaces and punctuation as delimiters.
        Dim words() As String = text.Split(New Char() {" "c, "."c, ","c, ";"c, ":"c, "!"c, "?"c})
        Dim longWordCount As Integer = 0
        ' Iterate through each word and count the number of long words.
        For Each word As String In words
            If word.Length > 6 Then
                longWordCount += 1
            End If
        Next
        ' Return the number of long words.
        Return longWordCount
    End Function

    ' This function calculates the LIX readability index for the given text.
    Function CalculateLix(ByVal text As String) As Double
        ' Count the number of words, sentences, and long words in the text.
        Dim wordCount As Integer = CountWords(text)
        Dim sentenceCount As Integer = CountSentences(text)
        Dim longWordCount As Integer = CountLongWords(text)
        ' Calculate the LIX readability index using the formula.
        Dim lix As Double = (wordCount / sentenceCount) + (longWordCount * 100 / wordCount)
        ' Return the LIX readability index.
        Return lix
    End Function

    Sub Main()
        ' Define a sample text to analyze.
        Dim sampleText As String = "This is a sample text. It contains several sentences. Some of the words are quite long, while others are short."
        ' Calculate the LIX readability index for the sample text.
        Dim lix As Double = CalculateLix(sampleText)
        ' Output the LIX readability index to the console.
        Console.WriteLine("The LIX readability index for the sample text is: " & lix)
        ' Cache data in memory unnessasary.
        Dim cachedData As String = sampleText
    End Sub

End Module

