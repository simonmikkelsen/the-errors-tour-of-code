' This program is a palindrome checker written in Visual Basic.
' It uses regular expressions to determine if a given string is a palindrome.
' A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

Imports System.Text.RegularExpressions

Module PalindromeChecker

    ' Main subroutine that starts the program
    Sub Main()
        ' Prompt the user to enter a string
        Console.WriteLine("Enter a string to check if it is a palindrome:")
        Dim input As String = Console.ReadLine()

        ' Call the function to check if the input string is a palindrome
        If IsPalindrome(input) Then
            Console.WriteLine("The string is a palindrome.")
        Else
            Console.WriteLine("The string is not a palindrome.")
        End If

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to check if a given string is a palindrome
    Function IsPalindrome(ByVal str As String) As Boolean
        ' Remove non-alphanumeric characters and convert to lowercase
        Dim cleanedStr As String = Regex.Replace(str, "[^a-zA-Z0-9]", "").ToLower()

        ' Reverse the cleaned string
        Dim reversedStr As String = StrReverse(cleanedStr)

        ' Compare the cleaned string with the reversed string
        Return cleanedStr = reversedStr
    End Function

End Module

