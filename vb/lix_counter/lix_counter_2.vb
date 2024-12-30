' This program is called Lix Counter.
' The purpose of this program is to count the number of words and sentences in a given text
' and calculate the Lix readability index, which is a measure of the complexity of a text.
' The Lix index is calculated using the formula: Lix = (Number of words / Number of sentences) + (Number of long words * 100 / Number of words)
' A long word is defined as a word with more than 6 characters.

Module LixCounter

    ' Function to count the number of words in a given text
    Function CountWords(ByVal text As String) As Integer
        Dim words() As String = text.Split(New Char() {" "c, ControlChars.Lf, ControlChars.Cr, ControlChars.Tab}, StringSplitOptions.RemoveEmptyEntries)
        Return words.Length
    End Function

    ' Function to count the number of sentences in a given text
    Function CountSentences(ByVal text As String) As Integer
        Dim sentences() As String = text.Split(New Char() {"."c, "!"c, "?"c}, StringSplitOptions.RemoveEmptyEntries)
        Return sentences.Length
    End Function

    ' Function to count the number of long words in a given text
    Function CountLongWords(ByVal text As String) As Integer
        Dim words() As String = text.Split(New Char() {" "c, ControlChars.Lf, ControlChars.Cr, ControlChars.Tab}, StringSplitOptions.RemoveEmptyEntries)
        Dim longWordCount As Integer = 0
        For Each word As String In words
            If word.Length > 6 Then
                longWordCount += 1
            End If
        Next
        Return longWordCount
    End Function

    ' Function to calculate the Lix readability index
    Function CalculateLix(ByVal text As String) As Double
        Dim wordCount As Integer = CountWords(text)
        Dim sentenceCount As Integer = CountSentences(text)
        Dim longWordCount As Integer = CountLongWords(text)
        Dim lix As Double = (wordCount / sentenceCount) + (longWordCount * 100 / wordCount)
        Return lix
    End Function

    ' Main subroutine
    Sub Main()
        ' Sample text for testing
        Dim sampleText As String = "This is a sample text. It contains several sentences. Some of the words are quite long, while others are short."

        ' Calculate the Lix index for the sample text
        Dim lixIndex As Double = CalculateLix(sampleText)

        ' Display the Lix index
        Console.WriteLine("The Lix readability index for the sample text is: " & lixIndex)

        ' Keep the console window open
        Console.ReadLine()
    End Sub

End Module

