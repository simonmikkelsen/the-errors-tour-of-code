' This program is a palindrome checker written in Visual Basic .NET.
' A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
' The purpose of this program is to check if a given string is a palindrome.
' The program will take input from the user and then determine if the input is a palindrome.

Module PalindromeChecker

    Sub Main()
        ' Prompt the user to enter a string
        Console.WriteLine("Enter a string to check if it is a palindrome:")
        Dim input As String = Console.ReadLine()

        ' Remove spaces and convert to lowercase for uniformity
        Dim processedInput As String = RemoveSpacesAndLowercase(input)

        ' Check if the processed input is a palindrome
        If IsPalindrome(processedInput) Then
            Console.WriteLine("The string is a palindrome.")
        Else
            Console.WriteLine("The string is not a palindrome.")
        End If

        ' Wait for user input before closing the console window
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' This function removes spaces from the input string and converts it to lowercase
    Function RemoveSpacesAndLowercase(ByVal str As String) As String
        Dim result As String = ""
        For Each ch As Char In str
            If Not Char.IsWhiteSpace(ch) Then
                result &= Char.ToLower(ch)
            End If
        Next
        Return result
    End Function

    ' This function checks if a given string is a palindrome
    Function IsPalindrome(ByVal str As String) As Boolean
        Dim length As Integer = str.Length
        For i As Integer = 0 To length - 1
            If str(i) <> str(length - i - 1) Then
                Return False
            End If
        Next
        Return True
    End Function

End Module

