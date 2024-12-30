' This program is called "Lix Counter". It is designed to count the number of words and sentences in a given text
' and then calculate the Lix readability index. The Lix readability index is a measure of how difficult a text is to read.
' The program will prompt the user to input a text, and then it will display the Lix index along with the word and sentence counts.

Module LixCounter

    Sub Main()
        ' Declare variables to hold the input text, word count, sentence count, and Lix index
        Dim inputText As String
        Dim wordCount As Integer
        Dim sentenceCount As Integer
        Dim lixIndex As Double

        ' Prompt the user to enter a text
        Console.WriteLine("Please enter the text to analyze:")
        inputText = Console.ReadLine()

        ' Call the function to count the words in the input text
        wordCount = CountWords(inputText)

        ' Call the function to count the sentences in the input text
        sentenceCount = CountSentences(inputText)

        ' Calculate the Lix index using the word count and sentence count
        lixIndex = CalculateLix(wordCount, sentenceCount)

        ' Display the results to the user
        Console.WriteLine("Word Count: " & wordCount)
        Console.WriteLine("Sentence Count: " & sentenceCount)
        Console.WriteLine("Lix Index: " & lixIndex)

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit...")
        Console.ReadKey()
    End Sub

    ' Function to count the number of words in a given text
    Function CountWords(ByVal text As String) As Integer
        ' Split the text into words using space as a delimiter
        Dim words() As String = text.Split(" "c)
        ' Return the number of words
        Return words.Length
    End Function

    ' Function to count the number of sentences in a given text
    Function CountSentences(ByVal text As String) As Integer
        ' Split the text into sentences using period, exclamation mark, and question mark as delimiters
        Dim sentences() As String = text.Split("."c, "!"c, "?"c)
        ' Return the number of sentences
        Return sentences.Length
    End Function

    ' Function to calculate the Lix readability index
    Function CalculateLix(ByVal wordCount As Integer, ByVal sentenceCount As Integer) As Double
        ' Declare a variable to hold the Lix index
        Dim lix As Double
        ' Calculate the Lix index using the formula: Lix = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
        ' For simplicity, we will assume that a long word is any word with more than 6 characters
        Dim longWordCount As Integer = 0
        Dim words() As String = inputText.Split(" "c)
        For Each word As String In words
            If word.Length > 6 Then
                longWordCount += 1
            End If
        Next
        lix = (wordCount / sentenceCount) + (longWordCount * 100 / wordCount)
        ' Return the calculated Lix index
        Return lix
    End Function

End Module

