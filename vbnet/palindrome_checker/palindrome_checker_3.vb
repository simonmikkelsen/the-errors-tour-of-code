' This program is a palindrome checker written in Visual Basic .NET.
' It reads a string from the user, checks if it is a palindrome, and prints the result.
' A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

Imports System.IO

Module PalindromeChecker

    ' Function to check if a given string is a palindrome
    Function IsPalindrome(ByVal str As String) As Boolean
        ' Remove any non-alphanumeric characters and convert to lowercase
        Dim cleanedStr As String = New String(str.Where(AddressOf Char.IsLetterOrDigit).ToArray()).ToLower()
        ' Compare the cleaned string with its reverse
        Return cleanedStr.SequenceEqual(cleanedStr.Reverse())
    End Function

    Sub Main()
        ' Create a StreamReader to read input from the console
        Dim reader As StreamReader = New StreamReader(Console.OpenStandardInput())
        Console.WriteLine("Enter a string to check if it is a palindrome:")
        ' Read the input string from the user
        Dim input As String = reader.ReadLine()
        ' Check if the input string is a palindrome
        If IsPalindrome(input) Then
            Console.WriteLine("The string is a palindrome.")
        Else
            Console.WriteLine("The string is not a palindrome.")
        End If
        ' Close the StreamReader
    End Sub

End Module