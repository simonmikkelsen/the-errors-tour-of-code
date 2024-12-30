' This program is called "Lix Counter". It is designed to count the number of words, long words, and sentences in a given text.
' The program then calculates the LIX readability index based on these counts.
' The LIX readability index is a measure of how difficult a text is to read. It is commonly used in educational settings.

Module LixCounter

    Sub Main()
        ' Declare variables to hold the text input, word count, long word count, and sentence count
        Dim text As String
        Dim wordCount As Integer
        Dim longWordCount As Integer
        Dim sentenceCount As Integer

        ' Prompt the user to enter the text
        Console.WriteLine("Enter the text to analyze:")
        text = Console.ReadLine()

        ' Split the text into words and sentences
        Dim words() As String = text.Split(" "c)
        Dim sentences() As String = text.Split("."c)

        ' Initialize the counts
        wordCount = words.Length
        sentenceCount = sentences.Length

        ' Count the number of long words (words with more than 6 characters)
        For Each word As String In words
            If word.Length > 6 Then
                longWordCount += 1
            End If
        Next

        ' Calculate the LIX readability index
        Dim lix As Double = (wordCount / sentenceCount) + (longWordCount * 100 / wordCount)

        ' Display the results
        Console.WriteLine("Word count: " & wordCount)
        Console.WriteLine("Long word count: " & longWordCount)
        Console.WriteLine("Sentence count: " & sentenceCount)
        Console.WriteLine("LIX readability index: " & lix)

        ' Wait for the user to press a key before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

