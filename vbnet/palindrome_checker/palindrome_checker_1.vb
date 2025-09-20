' This program is a palindrome checker written in Visual Basic .NET.
' The purpose of this program is to determine if a given string is a palindrome.
' A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

Module PalindromeChecker

    ' Main subroutine that serves as the entry point of the program.
    Sub Main()
        ' Prompt the user to enter a string.
        Console.WriteLine("Enter a string to check if it is a palindrome:")
        Dim input As String = Console.ReadLine()

        ' Call the IsPalindrome function to check if the input string is a palindrome.
        If IsPalindrome(input) Then
            Console.WriteLine("The string is a palindrome.")
        Else
            Console.WriteLine("The string is not a palindrome.")
        End If

        ' Wait for the user to press a key before closing the console window.
        Console.ReadKey()
    End Sub

    ' Function to check if a given string is a palindrome.
    ' This function takes a string as input and returns a Boolean value.
    Function IsPalindrome(ByVal str As String) As Boolean
        ' Remove all non-alphanumeric characters and convert the string to lowercase.
        Dim cleanedStr As String = ""
        For Each ch As Char In str
            If Char.IsLetterOrDigit(ch) Then
                cleanedStr &= Char.ToLower(ch)
            End If
        Next

        ' Reverse the cleaned string.
        Dim reversedStr As String = ""
        For i As Integer = cleanedStr.Length - 1 To 0 Step -1
            reversedStr &= cleanedStr(i)
        Next

        ' Compare the cleaned string with its reversed version.
        Return cleanedStr = reversedStr
    End Function

End Module

