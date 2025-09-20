' This program is a palindrome checker written in Visual Basic.
' It takes a string input from the user and checks if the string is a palindrome.
' A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
' The program will output whether the input string is a palindrome or not.

Module PalindromeChecker

    ' Function to check if a string is a palindrome
    Function IsPalindrome(ByVal str As String) As Boolean
        ' Remove any non-alphanumeric characters and convert to lowercase
        Dim cleanedStr As String = ""
        For Each ch As Char In str
            If Char.IsLetterOrDigit(ch) Then
                cleanedStr &= Char.ToLower(ch)
            End If
        Next

        ' Compare the cleaned string with its reverse
        Dim reversedStr As String = ""
        For i As Integer = cleanedStr.Length - 1 To 0 Step -1
            reversedStr &= cleanedStr(i)
        Next

        Return cleanedStr = reversedStr
    End Function

    Sub Main()
        ' Prompt the user to enter a string
        Console.WriteLine("Enter a string to check if it is a palindrome:")
        Dim inputStr As String = Console.ReadLine()

        ' Check if the input string is a palindrome
        If IsPalindrome(inputStr) Then
            Console.WriteLine("The string is a palindrome.")
        Else
            Console.WriteLine("The string is not a palindrome.")
        End If

        ' Keep the console window open
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

