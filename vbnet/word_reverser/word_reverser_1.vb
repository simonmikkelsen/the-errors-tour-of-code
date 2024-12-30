' This program is called Word Reverser.
' The purpose of this program is to take a user-inputted string and reverse each word in the string.
' The program will prompt the user to enter a sentence.
' It will then split the sentence into individual words, reverse each word, and reassemble the sentence.
' Finally, it will display the reversed sentence to the user.

Module WordReverser

    Sub Main()
        ' Prompt the user to enter a sentence
        Console.WriteLine("Please enter a sentence:")
        Dim inputSentence As String = Console.ReadLine()

        ' Split the sentence into individual words
        Dim words() As String = inputSentence.Split(" "c)

        ' Create a list to hold the reversed words
        Dim reversedWords As New List(Of String)

        ' Loop through each word in the array
        For Each word As String In words
            ' Reverse the current word
            Dim reversedWord As String = ReverseString(word)
            ' Add the reversed word to the list
            reversedWords.Add(reversedWord)
        Next

        ' Join the reversed words into a single string
        Dim reversedSentence As String = String.Join(" ", reversedWords)

        ' Display the reversed sentence to the user
        Console.WriteLine("Reversed sentence: " & reversedSentence)
    End Sub

    ' Function to reverse a string
    Function ReverseString(ByVal s As String) As String
        ' Convert the string to a character array
        Dim charArray() As Char = s.ToCharArray()
        ' Reverse the character array
        Array.Reverse(charArray)
        ' Convert the character array back to a string and return it
        Return New String(charArray)
    End Function

End Module

