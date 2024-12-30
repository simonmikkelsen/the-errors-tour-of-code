' This program is a palindrome checker written in Visual Basic .NET.
' It uses regular expressions to determine whether a given string is a palindrome.
' A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

Imports System.Text.RegularExpressions

Module PalindromeChecker

    ' Function to check if a given string is a palindrome
    Function IsPalindrome(input As String) As Boolean
        ' Remove non-alphanumeric characters and convert to lowercase
        Dim cleanedInput As String = Regex.Replace(input, "[^a-zA-Z0-9]", "").ToLower()

        ' Reverse the cleaned input string
        Dim reversedInput As String = StrReverse(cleanedInput)

        ' Check if the cleaned input string is equal to the reversed string
        Return cleanedInput = reversedInput
    End Function

    Sub Main()
        ' Prompt the user to enter a string
        Console.WriteLine("Enter a string to check if it is a palindrome:")
        Dim userInput As String = Console.ReadLine()

        ' Check if the input string is a palindrome
        If IsPalindrome(userInput) Then
            Console.WriteLine("The string is a palindrome.")
        Else
            Console.WriteLine("The string is not a palindrome.")
        End If

        ' Wait for user input before closing the console window
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

