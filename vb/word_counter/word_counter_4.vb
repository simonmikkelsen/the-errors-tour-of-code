' This program is a word counter written in Visual Basic.
' The purpose of this program is to count the number of words in a given input string.
' It takes a string input from the user and then processes it to count the words.
' The program will display the total word count to the user.

Module WordCounter

    Sub Main()
        ' Declare a variable to hold the input string from the user
        Dim inputString As String

        ' Prompt the user to enter a string
        Console.WriteLine("Please enter a string to count the words:")
        inputString = Console.ReadLine()

        ' Call the function to count the words in the input string
        Dim wordCount As Integer = CountWords(inputString)

        ' Display the word count to the user
        Console.WriteLine("The total number of words is: " & wordCount)

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to count the number of words in a given string
    Function CountWords(ByVal str As String) As Integer
        ' Declare a variable to hold the word count
        Dim count As Integer = 0

        ' Split the input string into an array of words
        Dim words() As String = str.Split(" "c)

        ' Loop through the array of words and count them
        For Each word As String In words
            ' Check if the word is not empty
            If word <> "" Then
                count += 1
            End If
        Next

        ' Return the total word count
        Return count
    End Function

End Module

