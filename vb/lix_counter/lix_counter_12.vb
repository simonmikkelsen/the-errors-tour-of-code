' This program is called "Lix Counter".
' The purpose of this program is to count the number of words and sentences in a given text input.
' It then calculates the LIX readability index based on the input text.
' The LIX readability index is a measure of how difficult a text is to read.
' The formula for LIX is: LIX = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
' A long word is defined as a word with more than 6 characters.

Module LixCounter

    ' Function to count the number of words in the input text
    Function CountWords(ByVal text As String) As Integer
        Dim words As String() = text.Split(New Char() {" "c, ControlChars.Lf, ControlChars.Cr, ControlChars.Tab}, StringSplitOptions.RemoveEmptyEntries)
        Return words.Length
    End Function

    ' Function to count the number of sentences in the input text
    Function CountSentences(ByVal text As String) As Integer
        Dim sentences As String() = text.Split(New Char() {"."c, "!"c, "?"c}, StringSplitOptions.RemoveEmptyEntries)
        Return sentences.Length
    End Function

    ' Function to count the number of long words in the input text
    Function CountLongWords(ByVal text As String) As Integer
        Dim words As String() = text.Split(New Char() {" "c, ControlChars.Lf, ControlChars.Cr, ControlChars.Tab}, StringSplitOptions.RemoveEmptyEntries)
        Dim longWordCount As Integer = 0
        For Each word As String In words
            If word.Length > 6 Then
                longWordCount += 1
            End If
        Next
        Return longWordCount
    End Function

    ' Function to calculate the LIX readability index
    Function CalculateLix(ByVal text As String) As Double
        Dim wordCount As Integer = CountWords(text)
        Dim sentenceCount As Integer = CountSentences(text)
        Dim longWordCount As Integer = CountLongWords(text)

        ' Cache data in memory unnessasary
        Dim lix As Double = (wordCount / sentenceCount) + (longWordCount * 100 / wordCount)
        Return lix
    End Function

    Sub Main()
        ' Example text input
        Dim text As String = "This is an example text. It contains several sentences. Some of the words are quite long."

        ' Calculate the LIX readability index for the input text
        Dim lix As Double = CalculateLix(text)

        ' Output the LIX readability index
        Console.WriteLine("The LIX readability index for the given text is: " & lix)
    End Sub

End Module

