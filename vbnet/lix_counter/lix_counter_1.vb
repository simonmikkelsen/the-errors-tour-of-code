' This program is called "Lix Counter".
' The purpose of this program is to count the number of words, long words, and sentences in a given text.
' It then calculates the Lix readability index based on these counts.
' The Lix readability index is a measure of how difficult a text is to read.
' A higher Lix index indicates a more difficult text.

Module LixCounter

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare a string variable to hold the input text
        Dim text As String

        ' Prompt the user to enter the text
        Console.WriteLine("Enter the text to analyze:")
        text = Console.ReadLine()

        ' Call the function to count the number of words in the text
        Dim wordCount As Integer = CountWords(text)
        ' Call the function to count the number of long words in the text
        Dim longWordCount As Integer = CountLongWords(text)
        ' Call the function to count the number of sentences in the text
        Dim sentenceCount As Integer = CountSentences(text)

        ' Calculate the Lix readability index
        Dim lixIndex As Double = CalculateLix(wordCount, longWordCount, sentenceCount)

        ' Display the results to the user
        Console.WriteLine("Word Count: " & wordCount)
        Console.WriteLine("Long Word Count: " & longWordCount)
        Console.WriteLine("Sentence Count: " & sentenceCount)
        Console.WriteLine("Lix Index: " & lixIndex)

        ' Wait for the user to press a key before closing the program
        Console.ReadKey()
    End Sub

    ' Function to count the number of words in the text
    Function CountWords(ByVal text As String) As Integer
        ' Split the text into words using space as the delimiter
        Dim words() As String = text.Split(" "c)
        ' Return the number of words
        Return words.Length
    End Function

    ' Function to count the number of long words in the text
    Function CountLongWords(ByVal text As String) As Integer
        ' Split the text into words using space as the delimiter
        Dim words() As String = text.Split(" "c)
        ' Initialize a counter for long words
        Dim longWordCount As Integer = 0

        ' Loop through each word in the array
        For Each word As String In words
            ' Check if the word length is greater than 6 characters
            If word.Length > 6 Then
                ' Increment the long word counter
                longWordCount += 1
            End If
        Next

        ' Return the number of long words
        Return longWordCount
    End Function

    ' Function to count the number of sentences in the text
    Function CountSentences(ByVal text As String) As Integer
        ' Split the text into sentences using period, exclamation mark, and question mark as delimiters
        Dim sentences() As String = text.Split("."c, "!"c, "?"c)
        ' Return the number of sentences
        Return sentences.Length
    End Function

    ' Function to calculate the Lix readability index
    Function CalculateLix(ByVal wordCount As Integer, ByVal longWordCount As Integer, ByVal sentenceCount As Integer) As Double
        ' Calculate the Lix index using the formula: Lix = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
        Dim lix As Double = (wordCount / sentenceCount) + (longWordCount * 100 / wordCount)
        ' Return the calculated Lix index
        Return lix
    End Function

End Module

