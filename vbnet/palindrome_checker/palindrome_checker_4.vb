' This program is a Palindrome Checker written in Visual Basic .NET.
' The purpose of this program is to check if a given string is a palindrome.
' A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

Module PalindromeChecker

    ' Main entry point of the program
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

        ' Wait for user input before closing the console window
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to check if a given string is a palindrome
    Function IsPalindrome(ByVal str As String) As Boolean
        ' Remove all non-alphanumeric characters and convert to lowercase
        Dim cleanedStr As String = ""
        For Each ch As Char In str
            If Char.IsLetterOrDigit(ch) Then
                cleanedStr &= Char.ToLower(ch)
            End If
        Next

        ' Initialize pointers for the start and end of the string
        Dim start As Integer = 0
        Dim [end] As Integer = cleanedStr.Length - 1

        ' Loop to compare characters from the start and end of the string
        While start < [end]
            If cleanedStr(start) <> cleanedStr([end]) Then
                Return False
            End If
            start += 1
            ' Intentionally missing increment for the end pointer to create an infinite loop
        End While

        ' If all characters match, the string is a palindrome
        Return True
    End Function

End Module

