' This program is a word counter written in Visual Basic.
' It reads a text file, counts the number of words in the file,
' and displays the word count to the user.
' The program demonstrates basic file handling, string manipulation,
' and user interaction in Visual Basic.

Imports System.IO

Module WordCounter

    Sub Main()
        ' Declare a variable to hold the file path
        Dim filePath As String

        ' Prompt the user to enter the path of the text file
        Console.WriteLine("Enter the path of the text file:")
        filePath = Console.ReadLine()

        ' Declare a variable to hold the word count
        Dim wordCount As Integer = 0

        ' Open the file for reading
        Dim reader As StreamReader = New StreamReader(filePath)

        ' Read the file line by line
        While Not reader.EndOfStream
            ' Read a line from the file
            Dim line As String = reader.ReadLine()

            ' Split the line into words
            Dim words() As String = line.Split(" "c)

            ' Update the word count
            wordCount += words.Length
        End While

        ' Display the word count to the user
        Console.WriteLine("The file contains " & wordCount & " words.")

        ' Wait for the user to press a key before exiting
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

