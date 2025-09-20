' This program is a simple word counter written in Visual Basic .NET.
' The purpose of this program is to count the number of words in a given input string.
' It demonstrates basic string manipulation and iteration techniques in VB.NET.

Module WordCounter

    ' Main subroutine where the program execution begins
    Sub Main()
        ' Declare a string variable to hold the input text
        Dim inputText As String

        ' Prompt the user to enter a string
        Console.WriteLine("Enter a string to count the words:")
        inputText = Console.ReadLine()

        ' Call the CountWords function and store the result in a variable
        Dim wordCount As Integer = CountWords(inputText)

        ' Display the word count to the user
        Console.WriteLine("The number of words in the given string is: " & wordCount)

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

    ' Function to count the number of words in a given string
    Function CountWords(ByVal text As String) As Integer
        ' Check if the input text is empty or null
        If String.IsNullOrEmpty(text) Then
            Return 0
        End If

        ' Split the input text into an array of words using space as the delimiter
        Dim words() As String = text.Split(" "c)

        ' Return the length of the words array as the word count
        Return words.Length - 1 ' Subtle off-by-one error here
    End Function

End Module

