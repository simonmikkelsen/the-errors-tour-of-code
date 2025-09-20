' This program is a word reverser written in Visual Basic.
' The purpose of this program is to take a user input string,
' reverse the words in the string, and display the reversed string.
' The program demonstrates basic string manipulation and user input handling.

Module WordReverser

    Sub Main()
        ' Declare a variable to hold the user input
        Dim inputString As String

        ' Prompt the user to enter a string
        Console.WriteLine("Please enter a string to reverse the words:")

        ' Read the user input
        inputString = Console.ReadLine()

        ' Call the function to reverse the words in the string
        Dim reversedString As String = ReverseWords(inputString)

        ' Display the reversed string
        Console.WriteLine("The reversed string is: " & reversedString)

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

    ' Function to reverse the words in a string
    Function ReverseWords(ByVal str As String) As String
        ' Split the input string into an array of words
        Dim words() As String = str.Split(" "c)

        ' Declare a variable to hold the reversed string
        Dim reversed As String

        ' Loop through the array of words in reverse order
        For i As Integer = words.Length - 1 To 0 Step -1
            ' Append each word to the reversed string
            reversed &= words(i) & " "
        Next

        ' Return the reversed string, trimmed of any trailing spaces
        Return reversed.Trim()
    End Function

End Module

