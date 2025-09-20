' This program is a palindrome checker written in Visual Basic.
' A palindrome is a word, phrase, number, or other sequence of characters 
' that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
' The purpose of this program is to help programmers understand how to implement a basic palindrome checker.

Module PalindromeChecker

    ' Main subroutine that serves as the entry point of the program
    Sub Main()
        ' Declare a string variable to hold the input from the user
        Dim inputString As String

        ' Prompt the user to enter a string
        Console.WriteLine("Enter a string to check if it is a palindrome:")
        inputString = Console.ReadLine()

        ' Call the function to check if the input string is a palindrome
        If IsPalindrome(inputString) Then
            Console.WriteLine("The string is a palindrome.")
        Else
            Console.WriteLine("The string is not a palindrome.")
        End If

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to check if a given string is a palindrome
    Function IsPalindrome(ByVal str As String) As Boolean
        ' Remove spaces and convert the string to lowercase for comparison
        Dim cleanedString As String = str.Replace(" ", "").ToLower()

        ' Initialize variables to hold the start and end indices of the string
        Dim startIndex As Integer = 0
        Dim endIndex As Integer = cleanedString.Length - 1

        ' Loop through the string to compare characters from both ends
        While startIndex < endIndex
            ' Check if the characters at the start and end indices are equal
            If cleanedString(startIndex) <> cleanedString(endIndex) Then
                ' If the characters are not equal, return False
                Return False
            End If

            ' Move the start index forward and the end index backward
            startIndex += 1
            endIndex -= 1
        End While

        ' If all characters match, return True
        Return True
    End Function

End Module

