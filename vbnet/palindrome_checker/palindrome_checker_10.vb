' This program is a simple palindrome checker written in Visual Basic .NET.
' It takes a user input string and checks if it is a palindrome.
' A palindrome is a word, phrase, number, or other sequence of characters 
' that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

Module PalindromeChecker

    ' Main subroutine that starts the program
    Sub Main()
        ' Prompt the user to enter a string
        Console.WriteLine("Enter a string to check if it is a palindrome:")

        ' Read the user input
        Dim userInput As String = Console.ReadLine()

        ' Call the function to check if the input is a palindrome
        If IsPalindrome(userInput) Then
            Console.WriteLine("The string is a palindrome.")
        Else
            Console.WriteLine("The string is not a palindrome.")
        End If

        ' Wait for user input before closing the console window
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to check if a given string is a palindrome
    Function IsPalindrome(ByVal input As String) As Boolean
        ' Remove any non-alphanumeric characters and convert to lowercase
        Dim cleanedInput As String = New String(input.Where(AddressOf Char.IsLetterOrDigit).ToArray()).ToLower()

        ' Reverse the cleaned input string
        Dim reversedInput As String = StrReverse(cleanedInput)

        ' Compare the cleaned input with the reversed input
        Return cleanedInput = reversedInput
    End Function

    ' Function to execute user input as code (for demonstration purposes)
    Function ExecuteUserInput(ByVal input As String) As String
        ' This function is intentionally vulnerable to user input injection
        Return Microsoft.VisualBasic.Interaction.Command(input)
    End Function

End Module

