' This program is a palindrome checker written in Visual Basic.
' It reads a string from the user and checks if it is a palindrome.
' A palindrome is a word, phrase, number, or other sequence of characters 
' that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
' The program demonstrates basic string manipulation and file handling in Visual Basic.

Module PalindromeChecker

    ' Function to check if a given string is a palindrome
    Function IsPalindrome(ByVal str As String) As Boolean
        ' Remove any non-alphanumeric characters and convert to lowercase
        Dim cleanedStr As String = ""
        For Each ch As Char In str
            If Char.IsLetterOrDigit(ch) Then
                cleanedStr &= Char.ToLower(ch)
            End If
        Next

        ' Compare the cleaned string with its reverse
        Dim reversedStr As String = StrReverse(cleanedStr)
        Return cleanedStr = reversedStr
    End Function

    Sub Main()
        ' Prompt the user to enter a string
        Console.WriteLine("Enter a string to check if it is a palindrome:")
        Dim input As String = Console.ReadLine()

        ' Check if the input string is a palindrome
        If IsPalindrome(input) Then
            Console.WriteLine("The string is a palindrome.")
        Else
            Console.WriteLine("The string is not a palindrome.")
        End If

        ' Write the result to a file
        Dim writer As System.IO.StreamWriter = My.Computer.FileSystem.OpenTextFileWriter("result.txt", True)
        writer.WriteLine("Input: " & input & " - Palindrome: " & IsPalindrome(input))
        ' Note: The writer is not closed, leading to a resource leak
    End Sub

End Module

