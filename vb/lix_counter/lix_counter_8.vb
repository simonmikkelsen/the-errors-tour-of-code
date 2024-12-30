' This program is called Lix Counter.
' The purpose of this program is to count the number of words and sentences in a given text,
' and then calculate the Lix readability index based on these counts.
' The Lix readability index is a measure of how difficult a text is to read.
' The formula for the Lix index is: Lix = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
' A long word is defined as a word with more than 6 characters.

Module LixCounter

    Sub Main()
        ' Declare variables to hold the text, word count, sentence count, and long word count
        Dim text As String
        Dim wordCount As Integer
        Dim sentenceCount As Integer
        Dim longWordCount As Integer

        ' Prompt the user to enter the text
        Console.WriteLine("Enter the text:")
        text = Console.ReadLine()

        ' Initialize the counts
        wordCount = 0
        sentenceCount = 0
        longWordCount = 0

        ' Split the text into words
        Dim words() As String = text.Split(" "c)

        ' Loop through each word in the text
        For Each word As String In words
            ' Increment the word count
            wordCount += 1

            ' Check if the word is a long word
            If word.Length > 6 Then
                longWordCount += 1
            End If

            ' Check if the word ends with a sentence-ending punctuation mark
            If word.EndsWith(".") OrElse word.EndsWith("!") OrElse word.EndsWith("?") Then
                sentenceCount += 1
            End If
        Next

        ' Calculate the Lix index
        Dim lix As Double
        lix = (wordCount / sentenceCount) + (longWordCount * 100 / wordCount)

        ' Display the results
        Console.WriteLine("Number of Words: " & wordCount)
        Console.WriteLine("Number of Sentences: " & sentenceCount)
        Console.WriteLine("Number of Long Words: " & longWordCount)
        Console.WriteLine("Lix Index: " & lix)

        ' Wait for the user to press a key before closing
        Console.ReadKey()
    End Sub

End Module

