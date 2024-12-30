' This program is a simple word reverser written in Visual Basic .NET.
' The purpose of this program is to reverse the input word provided by the user.
' It demonstrates basic string manipulation and user input/output in VB.NET.

Module WordReverser

    Sub Main()
        ' Declare a variable to hold the user's input
        Dim inputWord As String

        ' Prompt the user to enter a word
        Console.WriteLine("Please enter a word to reverse:")

        ' Read the user's input
        inputWord = Console.ReadLine()

        ' Call the function to reverse the word
        Dim reversedWord As String = ReverseWord(inputWord)

        ' Display the reversed word
        Console.WriteLine("The reversed word is: " & reversedWord)

        ' Wait for the user to press a key before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to reverse the input word
    Function ReverseWord(ByVal word As String) As String
        ' Declare a variable to hold the reversed word
        Dim reversed As String

        ' Loop through the word in reverse order and build the reversed word
        For i As Integer = word.Length - 1 To 0 Step -1
            reversed &= word(i)
        Next

        ' Return the reversed word
        Return reversed
    End Function

End Module

