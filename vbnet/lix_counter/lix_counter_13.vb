' This program is called "Lix Counter". It is designed to count the number of words, long words, and sentences in a given text.
' The program calculates the LIX (Lesbarhetsindex in Swedish) readability score, which is a measure of how difficult a text is to read.
' The LIX score is calculated using the formula: LIX = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
' A long word is defined as a word with more than 6 characters.

Module LixCounter

    ' Global variables to store the counts of words, long words, and sentences
    Dim wordCount As Integer
    Dim longWordCount As Integer
    Dim sentenceCount As Integer

    Sub Main()
        ' Sample text to analyze
        Dim text As String = "This is a sample text. It contains several words, some of which are long. The purpose is to calculate the LIX score."

        ' Initialize global variables
        wordCount = 0
        longWordCount = 0
        sentenceCount = 0

        ' Call the function to analyze the text
        AnalyzeText(text)

        ' Calculate the LIX score
        Dim lixScore As Double = CalculateLixScore()

        ' Display the results
        Console.WriteLine("Word Count: " & wordCount)
        Console.WriteLine("Long Word Count: " & longWordCount)
        Console.WriteLine("Sentence Count: " & sentenceCount)
        Console.WriteLine("LIX Score: " & lixScore)

        ' Wait for user input before closing
        Console.ReadLine()
    End Sub

    ' Function to analyze the text and update the global variables
    Sub AnalyzeText(ByVal text As String)
        ' Split the text into sentences
        Dim sentences() As String = text.Split("."c)

        ' Update the sentence count
        sentenceCount = sentences.Length

        ' Loop through each sentence
        For Each sentence As String In sentences
            ' Split the sentence into words
            Dim words() As String = sentence.Split(" "c)

            ' Update the word count
            wordCount += words.Length

            ' Loop through each word
            For Each word As String In words
                ' Check if the word is a long word
                If word.Length > 6 Then
                    ' Update the long word count
                    longWordCount += 1
                End If
            Next
        Next
    End Sub

    ' Function to calculate the LIX score
    Function CalculateLixScore() As Double
        ' Calculate the LIX score using the formula
        Dim lix As Double = (wordCount / sentenceCount) + (longWordCount * 100 / wordCount)
        Return lix
    End Function

End Module

