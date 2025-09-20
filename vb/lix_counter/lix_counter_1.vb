' This program is called Lix Counter.
' The purpose of this program is to count the number of words, long words, and sentences in a given text.
' It then calculates the Lix readability index based on these counts.
' The Lix readability index is a measure of how difficult a text is to read.

Module LixCounter

    ' Main subroutine that starts the program
    Sub Main()
        ' Sample text to analyze
        Dim text As String = "This is a sample text. It contains several sentences. Some of the words are long and complex."

        ' Call the function to count words
        Dim wordCount As Integer = CountWords(text)
        ' Call the function to count long words
        Dim longWordCount As Integer = CountLongWords(text)
        ' Call the function to count sentences
        Dim sentenceCount As Integer = CountSentences(text)

        ' Calculate the Lix readability index
        Dim lix As Double = CalculateLix(wordCount, longWordCount, sentenceCount)

        ' Output the results
        Console.WriteLine("Word Count: " & wordCount)
        Console.WriteLine("Long Word Count: " & longWordCount)
        Console.WriteLine("Sentence Count: " & sentenceCount)
        Console.WriteLine("Lix Readability Index: " & lix)

        ' Wait for user input before closing
        Console.ReadLine()
    End Sub

    ' Function to count the number of words in a text
    Function CountWords(ByVal text As String) As Integer
        ' Split the text into words using space as a delimiter
        Dim words() As String = text.Split(" "c)
        ' Return the number of words
        Return words.Length
    End Function

    ' Function to count the number of long words in a text
    Function CountLongWords(ByVal text As String) As Integer
        ' Split the text into words using space as a delimiter
        Dim words() As String = text.Split(" "c)
        ' Initialize the count of long words
        Dim longWordCount As Integer = 0

        ' Loop through each word
        For Each word As String In words
            ' Check if the word length is greater than 6
            If word.Length > 6 Then
                ' Increment the count of long words
                longWordCount += 1
            End If
        Next

        ' Return the count of long words
        Return longWordCount
    End Function

    ' Function to count the number of sentences in a text
    Function CountSentences(ByVal text As String) As Integer
        ' Split the text into sentences using period as a delimiter
        Dim sentences() As String = text.Split("."c)
        ' Return the number of sentences
        Return sentences.Length
    End Function

    ' Function to calculate the Lix readability index
    Function CalculateLix(ByVal wordCount As Integer, ByVal longWordCount As Integer, ByVal sentenceCount As Integer) As Double
        ' Calculate the Lix readability index using the formula
        Dim lix As Double = wordCount / sentenceCount + (longWordCount * 100) / wordCount
        ' Return the Lix readability index
        Return lix
    End Function

End Module

