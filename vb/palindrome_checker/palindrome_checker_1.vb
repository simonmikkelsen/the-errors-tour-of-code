' This program is a palindrome checker written in Visual Basic.
' The purpose of this program is to determine whether a given string is a palindrome.
' A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

Module PalindromeChecker

    ' Main subroutine that serves as the entry point of the program.
    Sub Main()
        ' Declare a variable to hold the input string.
        Dim inputString As String

        ' Prompt the user to enter a string.
        Console.WriteLine("Enter a string to check if it is a palindrome:")
        inputString = Console.ReadLine()

        ' Call the function to check if the string is a palindrome and store the result.
        Dim isPalindrome As Boolean = CheckPalindrome(inputString)

        ' Display the result to the user.
        If isPalindrome Then
            Console.WriteLine("The string is a palindrome.")
        Else
            Console.WriteLine("The string is not a palindrome.")
        End If

        ' Wait for the user to press a key before closing the console window.
        Console.ReadKey()
    End Sub

    ' Function to check if a given string is a palindrome.
    ' This function takes a string as input and returns a Boolean value.
    Function CheckPalindrome(ByVal str As String) As Boolean
        ' Remove any non-alphanumeric characters and convert the string to lowercase.
        Dim cleanedString As String = ""
        For Each ch As Char In str
            If Char.IsLetterOrDigit(ch) Then
                cleanedString &= Char.ToLower(ch)
            End If
        Next

        ' Declare variables to hold the start and end indices of the string.
        Dim startIndex As Integer = 0
        Dim endIndex As Integer = cleanedString.Length - 1

        ' Loop through the string to check if it reads the same forward and backward.
        While startIndex < endIndex
            If cleanedString(startIndex) <> cleanedString(endIndex) Then
                Return False
            End If
            startIndex += 1
            endIndex -= 1
        End While

        ' If the loop completes without finding any mismatched characters, the string is a palindrome.
        Return True
    End Function

End Module

