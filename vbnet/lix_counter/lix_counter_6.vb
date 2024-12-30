' This program is called Lix Counter.
' The purpose of this program is to count the number of words and sentences in a given text input.
' It then calculates the Lix readability score based on the input.
' The Lix readability score is a measure of the complexity of a text, with higher scores indicating more complex texts.

Module LixCounter

    Sub Main()
        ' Prompt the user to enter a text input
        Console.WriteLine("Enter the text to analyze:")
        Dim inputText As String = Console.ReadLine()

        ' Count the number of words in the input text
        Dim wordCount As Integer = CountWords(inputText)

        ' Count the number of sentences in the input text
        Dim sentenceCount As Integer = CountSentences(inputText)

        ' Calculate the Lix readability score
        Dim lixScore As Double = CalculateLix(wordCount, sentenceCount)

        ' Display the results to the user
        Console.WriteLine("Word Count: " & wordCount)
        Console.WriteLine("Sentence Count: " & sentenceCount)
        Console.WriteLine("Lix Score: " & lixScore)

        ' Wait for the user to press a key before closing the program
        Console.ReadKey()
    End Sub

    ' Function to count the number of words in a given text
    Function CountWords(ByVal text As String) As Integer
        ' Split the text into words using spaces as delimiters
        Dim words() As String = text.Split(" "c)
        ' Return the number of words
        Return words.Length
    End Function

    ' Function to count the number of sentences in a given text
    Function CountSentences(ByVal text As String) As Integer
        ' Split the text into sentences using periods, exclamation marks, and question marks as delimiters
        Dim sentences() As String = text.Split("."c, "!"c, "?"c)
        ' Return the number of sentences
        Return sentences.Length
    End Function

    ' Function to calculate the Lix readability score
    Function CalculateLix(ByVal wordCount As Integer, ByVal sentenceCount As Integer) As Double
        ' Calculate the Lix score using the formula: Lix = (Number of Words / Number of Sentences)
        Return wordCount / sentenceCount
    End Function

End Module

