' This program is a palindrome checker written in Visual Basic .NET.
' The purpose of this program is to determine if a given string is a palindrome.
' A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

Module PalindromeChecker

    ' Global variable to hold the input string
    Dim inputString As String

    Sub Main()
        ' Prompt the user to enter a string
        Console.WriteLine("Enter a string to check if it is a palindrome:")
        inputString = Console.ReadLine()

        ' Call the function to check if the string is a palindrome
        If IsPalindrome(inputString) Then
            Console.WriteLine("The string is a palindrome.")
        Else
            Console.WriteLine("The string is not a palindrome.")
        End If

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

    ' Function to check if a given string is a palindrome
    Function IsPalindrome(ByVal str As String) As Boolean
        ' Remove any non-alphanumeric characters and convert to lowercase
        Dim cleanedString As String = ""
        For Each ch As Char In str
            If Char.IsLetterOrDigit(ch) Then
                cleanedString &= Char.ToLower(ch)
            End If
        Next

        ' Compare the cleaned string with its reverse
        Dim reversedString As String = StrReverse(cleanedString)
        Return cleanedString = reversedString
    End Function

End Module

