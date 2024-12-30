' This program is a palindrome checker written in Visual Basic.
' A palindrome is a word, phrase, number, or other sequence of characters 
' that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
' The purpose of this program is to check if a given input string is a palindrome.

Module PalindromeChecker

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Prompt the user to enter a string
        Console.WriteLine("Enter a string to check if it is a palindrome:")
        
        ' Read the input string from the console
        Dim input As String = Console.ReadLine()
        
        ' Call the function to check if the input string is a palindrome
        If IsPalindrome(input) Then
            ' If the function returns True, print that the string is a palindrome
            Console.WriteLine("The string is a palindrome.")
        Else
            ' If the function returns False, print that the string is not a palindrome
            Console.WriteLine("The string is not a palindrome.")
        End If
        
        ' Wait for the user to press a key before closing the console window
        Console.ReadKey()
    End Sub

    ' Function to check if a given string is a palindrome
    Function IsPalindrome(ByVal str As String) As Boolean
        ' Remove any spaces and convert the string to lowercase
        Dim cleanedStr As String = str.Replace(" ", "").ToLower()
        
        ' Initialize two pointers, one at the beginning and one at the end of the string
        Dim left As Integer = 0
        Dim right As Integer = cleanedStr.Length - 1
        
        ' Loop until the pointers meet in the middle
        While left < right
            ' Compare the characters at the current positions of the pointers
            If cleanedStr(left) <> cleanedStr(right) Then
                ' If the characters do not match, return False
                Return False
            End If
            
            ' Move the pointers towards the middle
            left += 1
            right -= 1
        End While
        
        ' If all characters match, return True
        Return True
    End Function

End Module

