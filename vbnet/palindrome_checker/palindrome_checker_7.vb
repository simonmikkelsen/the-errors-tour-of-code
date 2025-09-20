' This program is a simple palindrome checker written in Visual Basic .NET.
' A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward.
' The purpose of this program is to help programmers understand how to implement basic string manipulation and logic in VB.NET.

Module PalindromeChecker

    ' Main entry point of the program
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

        ' Wait for user input before closing the console window
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to check if a given string is a palindrome
    Function IsPalindrome(ByVal str As String) As Boolean
        ' Remove any non-alphanumeric characters and convert to lowercase
        Dim cleanedStr As String = New String(str.Where(AddressOf Char.IsLetterOrDigit).ToArray()).ToLower()

        ' Reverse the cleaned string
        Dim reversedStr As String = New String(cleanedStr.Reverse().ToArray())

        ' Compare the cleaned string with its reversed version
        Return cleanedStr = reversedStr
    End Function

End Module

