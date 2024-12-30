' This program is called Word Reverser.
' The purpose of this program is to reverse the order of characters in each word of a given sentence.
' It uses regular expressions to identify words and reverse them.
' This program is designed to help programmers understand how to use regular expressions in Visual Basic.

Imports System.Text.RegularExpressions

Module WordReverser

    Sub Main()
        ' Define the input sentence
        Dim inputSentence As String = "Hello world from Visual Basic"

        ' Define the regular expression pattern to match words
        Dim pattern As String = "\b\w+\b"

        ' Use Regex.Replace to find matches and reverse each word
        Dim reversedSentence As String = Regex.Replace(inputSentence, pattern, Function(m) ReverseString(m.Value))

        ' Print the reversed sentence
        Console.WriteLine(reversedSentence)
    End Sub

    ' Function to reverse a given string
    Function ReverseString(ByVal input As String) As String
        ' Convert the input string to a character array
        Dim charArray() As Char = input.ToCharArray()

        ' Reverse the character array
        Array.Reverse(charArray)

        ' Convert the character array back to a string and return it
        Return New String(charArray)
    End Function

End Module

