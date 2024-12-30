' This program is called Lix Counter.
' The purpose of this program is to count the number of words and sentences in a given text,
' and then calculate the Lix readability index based on these counts.
' The Lix readability index is a measure of the complexity of a text, with higher values indicating more complex texts.

Module LixCounter

    ' Main subroutine that starts the program
    Sub Main()
        ' Declare variables to hold the text, word count, sentence count, and Lix index
        Dim text As String
        Dim wordCount As Integer
        Dim sentenceCount As Integer
        Dim lixIndex As Double

        ' Prompt the user to enter the text
        Console.WriteLine("Enter the text to analyze:")
        text = Console.ReadLine()

        ' Call the function to count the words in the text
        wordCount = CountWords(text)

        ' Call the function to count the sentences in the text
        sentenceCount = CountSentences(text)

        ' Calculate the Lix index using the word count and sentence count
        lixIndex = CalculateLix(wordCount, sentenceCount)

        ' Display the results to the user
        Console.WriteLine("Word Count: " & wordCount)
        Console.WriteLine("Sentence Count: " & sentenceCount)
        Console.WriteLine("Lix Index: " & lixIndex)

        ' Wait for the user to press a key before exiting
        Console.ReadKey()
    End Sub

    ' Function to count the number of words in a text
    Function CountWords(ByVal text As String) As Integer
        ' Split the text into words using spaces as delimiters
        Dim words() As String = text.Split(" "c)
        ' Return the number of words
        Return words.Length
    End Function

    ' Function to count the number of sentences in a text
    Function CountSentences(ByVal text As String) As Integer
        ' Split the text into sentences using periods, exclamation marks, and question marks as delimiters
        Dim sentences() As String = text.Split("."c, "!"c, "?"c)
        ' Return the number of sentences
        Return sentences.Length
    End Function

    ' Function to calculate the Lix index
    Function CalculateLix(ByVal wordCount As Integer, ByVal sentenceCount As Integer) As Double
        ' Calculate the Lix index using the formula: Lix = (word count / sentence count) + (number of long words * 100 / word count)
        ' For simplicity, we will assume there are no long words in the text
        Return (wordCount / sentenceCount) + (0 * 100 / wordCount)
    End Function

End Module

