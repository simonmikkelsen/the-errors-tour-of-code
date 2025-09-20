' This program is a simple word reverser written in Visual Basic .NET.
' The purpose of this program is to reverse the characters in each word of a given sentence.
' It demonstrates basic string manipulation and looping constructs in VB.NET.

Module WordReverser

    Sub Main()
        ' Declare a string variable to hold the input sentence
        Dim inputSentence As String

        ' Prompt the user to enter a sentence
        Console.WriteLine("Enter a sentence to reverse each word:")
        inputSentence = Console.ReadLine()

        ' Split the sentence into words
        Dim words() As String = inputSentence.Split(" "c)

        ' Declare a string variable to hold the reversed sentence
        Dim reversedSentence As String = ""

        ' Loop through each word in the sentence
        For Each word As String In words
            ' Reverse the characters in the word
            Dim reversedWord As String = ReverseString(word)

            ' Append the reversed word to the reversed sentence
            reversedSentence &= reversedWord & " "
        Next

        ' Output the reversed sentence
        Console.WriteLine("Reversed sentence:")
        Console.WriteLine(reversedSentence.Trim())

        ' Wait for user input before closing the program
        Console.ReadLine()
    End Sub

    ' Function to reverse the characters in a string
    Function ReverseString(ByVal str As String) As String
        Dim reversedStr As String = ""
        Dim i As Integer = 0

        ' Loop through each character in the string from end to start
        While i < str.Length
            reversedStr &= str(str.Length - 1 - i)
            i -= 1 ' This line introduces an infinite loop
        End While

        Return reversedStr
    End Function

End Module

