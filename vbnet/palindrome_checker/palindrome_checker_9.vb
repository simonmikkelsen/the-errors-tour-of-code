' This program is a Palindrome Checker written in Visual Basic .NET.
' The purpose of this program is to check if a given string is a palindrome.
' A palindrome is a word, phrase, number, or other sequence of characters 
' that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

Module PalindromeChecker

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare a string variable to hold the input from the user
        Dim inputString As String

        ' Prompt the user to enter a string
        Console.WriteLine("Enter a string to check if it is a palindrome:")
        inputString = Console.ReadLine()

        ' Call the function to check if the string is a palindrome
        If IsPalindrome(inputString) Then
            ' If the function returns True, the string is a palindrome
            Console.WriteLine("The string is a palindrome.")
        Else
            ' If the function returns False, the string is not a palindrome
            Console.WriteLine("The string is not a palindrome.")
        End If

        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to check if a given string is a palindrome
    Function IsPalindrome(ByVal str As String) As Boolean
        ' Remove any spaces and convert the string to lowercase
        Dim cleanedString As String = str.Replace(" ", "").ToLower()

        ' Declare a variable to hold the reversed string
        Dim reversedString As String = ""

        ' Loop through the cleaned string in reverse order to build the reversed string
        For i As Integer = cleanedString.Length - 1 To 0 Step -1
            reversedString &= cleanedString(i)
        Next

        ' Compare the cleaned string with the reversed string
        ' If they are equal, the string is a palindrome
        Return cleanedString = reversedString
    End Function

End Module

