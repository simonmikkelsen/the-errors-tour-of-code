' This program is a palindrome checker written in Visual Basic .NET.
' It is designed to take a string input from the user and determine if the string is a palindrome.
' A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
' The program will provide detailed comments to help programmers understand the flow and logic of the code.

Module PalindromeChecker

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare a variable to hold the user input
        Dim userInput As String

        ' Prompt the user to enter a string
        Console.WriteLine("Enter a string to check if it is a palindrome:")
        userInput = Console.ReadLine()

        ' Call the function to check if the input string is a palindrome
        If IsPalindrome(userInput) Then
            Console.WriteLine("The string is a palindrome.")
        Else
            Console.WriteLine("The string is not a palindrome.")
        End If

        ' Wait for the user to press a key before closing the console window
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

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

End Module

