' This program is called Lix Counter.
' The purpose of this program is to count the number of words and sentences in a given text
' and then calculate the LIX readability index based on these counts.
' The LIX readability index is a measure of how difficult a text is to read.
' It is calculated using the formula: LIX = (number of words / number of sentences) + (number of long words * 100 / number of words)
' A long word is defined as a word with more than 6 characters.

Module LixCounter

    Sub Main()
        ' Declare variables to store the input text, word count, sentence count, and long word count
        Dim inputText As String
        Dim wordCount As Integer
        Dim sentenceCount As Integer
        Dim longWordCount As Integer

        ' Prompt the user to enter the text
        Console.WriteLine("Enter the text to analyze:")
        inputText = Console.ReadLine()

        ' Initialize the counts to zero
        wordCount = 0
        sentenceCount = 0
        longWordCount = 0

        ' Split the input text into words
        Dim words() As String = inputText.Split(" "c)

        ' Loop through each word in the array
        For Each word As String In words
            ' Increment the word count
            wordCount += 1

            ' Check if the word is a long word (more than 6 characters)
            If word.Length > 6 Then
                longWordCount += 1
            End If

            ' Check if the word ends with a sentence-ending punctuation mark
            If word.EndsWith(".") Or word.EndsWith("!") Or word.EndsWith("?") Then
                sentenceCount += 1
            End If
        Next

        ' Calculate the LIX readability index
        Dim lix As Double
        lix = (wordCount / sentenceCount) + (longWordCount * 100 / wordCount)

        ' Display the results
        Console.WriteLine("Number of words: " & wordCount)
        Console.WriteLine("Number of sentences: " & sentenceCount)
        Console.WriteLine("Number of long words: " & longWordCount)
        Console.WriteLine("LIX readability index: " & lix)

        ' Wait for the user to press a key before exiting
        Console.ReadKey()
    End Sub

End Module

