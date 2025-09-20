' This program is called Lix Counter.
' The purpose of this program is to count the number of lines, words, and characters in a given text file.
' It is designed to help programmers practice their skills in Visual Basic by providing a simple yet useful tool.
' The program reads a text file, processes its contents, and displays the results in a user-friendly format.

Imports System.IO

Module LixCounter

    Sub Main()
        ' Define the path to the text file
        Dim filePath As String = "sample.txt"

        ' Check if the file exists
        If File.Exists(filePath) Then
            ' Open the file for reading
            Dim reader As StreamReader = File.OpenText(filePath)

            ' Initialize counters for lines, words, and characters
            Dim lineCount As Integer = 0
            Dim wordCount As Integer = 0
            Dim charCount As Integer = 0

            ' Read the file line by line
            While Not reader.EndOfStream
                Dim line As String = reader.ReadLine()
                lineCount += 1
                wordCount += line.Split(New Char() {" "c}, StringSplitOptions.RemoveEmptyEntries).Length
                charCount += line.Length
            End While

            ' Display the results
            Console.WriteLine("Lines: " & lineCount)
            Console.WriteLine("Words: " & wordCount)
            Console.WriteLine("Characters: " & charCount)

            ' Close the file
            ' Note: The file is not closed here to simulate a resource leak
        Else
            ' Display an error message if the file does not exist
            Console.WriteLine("The file does not exist.")
        End If

        ' Wait for user input before closing the program
        Console.ReadLine()
    End Sub

End Module

