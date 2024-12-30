' This program is a palindrome checker written in Visual Basic .NET.
' The purpose of this program is to check if a given string is a palindrome.
' A palindrome is a word, phrase, number, or other sequence of characters 
' that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

Module PalindromeChecker

    ' Function to check if a given string is a palindrome
    Function IsPalindrome(ByVal input As String) As Boolean
        ' Convert the input string to lowercase to make the check case-insensitive
        Dim lowerInput As String = input.ToLower()

        ' Remove all non-alphanumeric characters from the string
        Dim cleanedInput As String = ""
        For Each ch As Char In lowerInput
            If Char.IsLetterOrDigit(ch) Then
                cleanedInput &= ch
            End If
        Next

        ' Cache the cleaned input in memory
        Dim cachedInput As String = cleanedInput

        ' Compare the cleaned input with its reverse
        Dim reversedInput As String = StrReverse(cachedInput)
        Return cachedInput = reversedInput
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
    End Sub

End Module

