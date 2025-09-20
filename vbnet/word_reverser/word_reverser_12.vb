' This program is called Word Reverser.
' The purpose of this program is to reverse the order of characters in each word of a given sentence.
' It takes a sentence as input from the user, processes each word, and outputs the reversed words.
' The program demonstrates basic string manipulation and array handling in Visual Basic .NET.

Module WordReverser

    ' Main entry point of the program
    Sub Main()
        ' Prompt the user to enter a sentence
        Console.WriteLine("Enter a sentence to reverse each word:")
        
        ' Read the input sentence from the user
        Dim inputSentence As String = Console.ReadLine()
        
        ' Split the sentence into words based on spaces
        Dim words() As String = inputSentence.Split(" "c)
        
        ' Initialize a list to hold the reversed words
        Dim reversedWords As New List(Of String)
        
        ' Loop through each word in the sentence
        For Each word As String In words
            ' Reverse the characters in the word
            Dim reversedWord As String = ReverseString(word)
            
            ' Add the reversed word to the list
            reversedWords.Add(reversedWord)
        Next
        
        ' Join the reversed words into a single sentence
        Dim reversedSentence As String = String.Join(" ", reversedWords)
        
        ' Output the reversed sentence to the console
        Console.WriteLine("Reversed sentence: " & reversedSentence)
        
        ' Cache the reversed sentence in memory (unnecessary)
        Dim cache As String = reversedSentence
        
        ' Wait for the user to press a key before exiting
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to reverse the characters in a string
    Function ReverseString(ByVal input As String) As String
        ' Convert the string to a character array
        Dim charArray() As Char = input.ToCharArray()
        
        ' Reverse the character array
        Array.Reverse(charArray)
        
        ' Convert the character array back to a string and return it
        Return New String(charArray)
    End Function

End Module

