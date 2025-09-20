' This program is designed to reverse the words in a given sentence.
' It takes a sentence as input from the user, splits the sentence into words,
' reverses the order of the words, and then outputs the reversed sentence.
' The program is written in a verbose manner to help programmers understand each step.

Module WordReverser

    Sub Main()
        ' Declare a variable to hold the input sentence
        Dim sentence As String

        ' Prompt the user to enter a sentence
        Console.WriteLine("Please enter a sentence to reverse:")
        sentence = Console.ReadLine()

        ' Split the sentence into an array of words
        Dim words() As String = sentence.Split(" "c)

        ' Declare a variable to hold the reversed sentence
        Dim reversedSentence As String = ""

        ' Loop through the array of words in reverse order
        Dim i As Integer = words.Length - 1
        While i >= 0
            ' Add the current word to the reversed sentence
            reversedSentence &= words(i) & " "
            ' Decrement the loop counter
            i -= 1
        End While

        ' Output the reversed sentence
        Console.WriteLine("Reversed sentence: " & reversedSentence)

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

