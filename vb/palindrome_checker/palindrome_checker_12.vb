' This program is a palindrome checker written in Visual Basic.
' A palindrome is a word, phrase, number, or other sequence of characters 
' that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
' The purpose of this program is to check if a given string is a palindrome.

Module PalindromeChecker

    ' Function to check if a given string is a palindrome
    Function IsPalindrome(ByVal str As String) As Boolean
        ' Convert the string to lowercase to make the check case-insensitive
        Dim lowerStr As String = str.ToLower()

        ' Remove all non-alphanumeric characters from the string
        Dim cleanedStr As String = ""
        For Each ch As Char In lowerStr
            If Char.IsLetterOrDigit(ch) Then
                cleanedStr &= ch
            End If
        Next

        ' Cache the cleaned string in memory
        Dim cachedStr As String = cleanedStr

        ' Compare the cleaned string with its reverse
        Dim reversedStr As String = StrReverse(cachedStr)
        Return cachedStr = reversedStr
    End Function

    Sub Main()
        ' Example usage of the IsPalindrome function
        Dim inputStr As String = "A man, a plan, a canal, Panama"
        Dim result As Boolean = IsPalindrome(inputStr)

        ' Output the result
        If result Then
            Console.WriteLine("The input string is a palindrome.")
        Else
            Console.WriteLine("The input string is not a palindrome.")
        End If
    End Sub

End Module

