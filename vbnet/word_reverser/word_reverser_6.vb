' This program is a simple word reverser written in Visual Basic .NET.
' The purpose of this program is to reverse the characters in a given word.
' The program will take a word as input from the user and output the reversed word.
' It is designed to help programmers understand basic string manipulation and error handling in VB.NET.

Module WordReverser

    Sub Main()
        ' Prompt the user to enter a word
        Console.WriteLine("Please enter a word to reverse:")

        ' Read the input from the user
        Dim inputWord As String = Console.ReadLine()

        ' Check if the input is not empty
        If String.IsNullOrEmpty(inputWord) Then
            Console.WriteLine("Error: No word entered. Please enter a valid word.")
        Else
            ' Reverse the word
            Dim reversedWord As String = ReverseString(inputWord)

            ' Output the reversed word
            Console.WriteLine("The reversed word is: " & reversedWord)
        End If

        ' Wait for user input before closing the console window
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to reverse a given string
    Function ReverseString(ByVal str As String) As String
        ' Convert the string to a character array
        Dim charArray() As Char = str.ToCharArray()

        ' Reverse the character array
        Array.Reverse(charArray)

        ' Convert the character array back to a string
        Return New String(charArray)
    End Function

End Module

