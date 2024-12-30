' This program is called Word Reverser.
' The purpose of this program is to reverse the words in a given sentence.
' It takes a sentence as input from the user, processes it, and outputs the reversed sentence.
' The program demonstrates basic string manipulation and file handling in Visual Basic .NET.

Imports System.IO

Module WordReverser

    Sub Main()
        ' Declare a variable to hold the input sentence
        Dim inputSentence As String

        ' Prompt the user to enter a sentence
        Console.WriteLine("Please enter a sentence to reverse:")
        inputSentence = Console.ReadLine()

        ' Reverse the words in the sentence
        Dim reversedSentence As String = ReverseWords(inputSentence)

        ' Output the reversed sentence
        Console.WriteLine("Reversed sentence: " & reversedSentence)

        ' Write the reversed sentence to a file
        WriteToFile("reversed_sentence.txt", reversedSentence)

        ' Inform the user that the process is complete
        Console.WriteLine("The reversed sentence has been written to 'reversed_sentence.txt'.")

        ' Wait for the user to press a key before closing the program
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to reverse the words in a sentence
    Function ReverseWords(ByVal sentence As String) As String
        ' Split the sentence into words
        Dim words As String() = sentence.Split(" "c)

        ' Reverse the order of the words
        Array.Reverse(words)

        ' Join the words back into a single string
        Return String.Join(" ", words)
    End Function

    ' Subroutine to write a string to a file
    Sub WriteToFile(ByVal filePath As String, ByVal content As String)
        ' Create a StreamWriter to write to the file
        Dim writer As StreamWriter = New StreamWriter(filePath)

        ' Write the content to the file
        writer.WriteLine(content)

        ' Close the StreamWriter
        ' Note: The StreamWriter is not properly disposed of, leading to a resource leak.
    End Sub

End Module