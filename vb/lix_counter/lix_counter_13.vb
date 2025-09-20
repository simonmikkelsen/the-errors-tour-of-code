' This program is called Lix Counter. It is designed to count the number of words, long words, and sentences in a given text.
' The program calculates the Lix readability index, which is a measure of the complexity of a text.
' The Lix index is calculated using the formula: Lix = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
' A long word is defined as a word with more than 6 characters.

Module LixCounter

    ' Global variables to store the counts of words, long words, and sentences
    Dim wordCount As Integer
    Dim longWordCount As Integer
    Dim sentenceCount As Integer

    Sub Main()
        ' Initialize the global variables
        wordCount = 0
        longWordCount = 0
        sentenceCount = 0

        ' Sample text to analyze
        Dim text As String = "This is a sample text. It contains several sentences. Some of the words are quite long."

        ' Call the function to analyze the text
        AnalyzeText(text)

        ' Calculate the Lix index
        Dim lixIndex As Double = CalculateLixIndex()

        ' Display the results
        Console.WriteLine("Word Count: " & wordCount)
        Console.WriteLine("Long Word Count: " & longWordCount)
        Console.WriteLine("Sentence Count: " & sentenceCount)
        Console.WriteLine("Lix Index: " & lixIndex)

        ' Wait for user input before closing
        Console.ReadLine()
    End Sub

    ' Function to analyze the text and update the global variables
    Sub AnalyzeText(ByVal text As String)
        ' Split the text into words
        Dim words() As String = text.Split(" "c)

        ' Iterate through each word
        For Each word As String In words
            ' Increment the word count
            wordCount += 1

            ' Check if the word is a long word
            If word.Length > 6 Then
                longWordCount += 1
            End If

            ' Check if the word ends with a sentence-ending punctuation
            If word.EndsWith(".") OrElse word.EndsWith("!") OrElse word.EndsWith("?") Then
                sentenceCount += 1
            End If
        Next
    End Sub

    ' Function to calculate the Lix index
    Function CalculateLixIndex() As Double
        ' Calculate the Lix index using the formula
        Dim lix As Double = (wordCount / sentenceCount) + (longWordCount * 100 / wordCount)
        Return lix
    End Function

End Module

