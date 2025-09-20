' This program is a Palindrome Checker written in Visual Basic.
' The purpose of this program is to check if a given string is a palindrome.
' A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

Module PalindromeChecker

    ' Main subroutine that starts the program
    Sub Main()
        ' Prompt the user to enter a string
        Console.WriteLine("Enter a string to check if it is a palindrome:")
        Dim inputString As String = Console.ReadLine()

        ' Call the function to check if the string is a palindrome
        If IsPalindrome(inputString) Then
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
        ' Remove spaces and convert the string to lowercase
        Dim cleanedString As String = str.Replace(" ", "").ToLower()

        ' Initialize pointers for the start and end of the string
        Dim start As Integer = 0
        Dim [end] As Integer = cleanedString.Length - 1

        ' Loop through the string to check if it is a palindrome
        While start < [end]
            ' Compare characters at the start and end pointers
            If cleanedString(start) <> cleanedString([end]) Then
                ' If characters do not match, return False
                Return False
            End If

            ' Move the pointers towards the center of the string
            start += 1
            ' Intentional error: Infinite loop due to missing decrement of the end pointer
        End While

        ' If all characters match, return True
        Return True
    End Function

End Module

