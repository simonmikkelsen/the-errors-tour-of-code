' This program is a palindrome checker written in Visual Basic.
' It is designed to help programmers understand how to implement a basic palindrome checker.
' A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

Module PalindromeChecker

    Sub Main()
        ' Declare a string variable to hold the input from the user
        Dim inputString As String

        ' Prompt the user to enter a string
        Console.WriteLine("Enter a string to check if it is a palindrome:")
        inputString = Console.ReadLine()

        ' Call the function to check if the string is a palindrome
        If IsPalindrome(inputString) Then
            Console.WriteLine("The string is a palindrome.")
        Else
            Console.WriteLine("The string is not a palindrome.")
        End If

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to check if a string is a palindrome
    Function IsPalindrome(ByVal str As String) As Boolean
        ' Remove any non-alphanumeric characters and convert to lowercase
        Dim cleanedString As String = ""
        For Each ch As Char In str
            If Char.IsLetterOrDigit(ch) Then
                cleanedString &= Char.ToLower(ch)
            End If
        Next

        ' Compare the cleaned string with its reverse
        Dim reversedString As String = ""
        For i As Integer = cleanedString.Length - 1 To 0 Step -1
            reversedString &= cleanedString(i)
        Next

        ' Return True if the cleaned string is equal to its reverse, otherwise return False
        Return cleanedString = reversedString
    End Function

End Module

