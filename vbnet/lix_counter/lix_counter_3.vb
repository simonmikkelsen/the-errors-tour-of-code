' This program is called Lix Counter.
' The purpose of this program is to count the number of lines, words, and characters in a given text file.
' It is designed to help programmers practice their skills in reading and understanding code.
' The program reads a text file and outputs the counts to the console.

Imports System.IO

Module LixCounter

    Sub Main()
        ' Define the path to the text file
        Dim filePath As String = "sample.txt"

        ' Initialize counters for lines, words, and characters
        Dim lineCount As Integer = 0
        Dim wordCount As Integer = 0
        Dim charCount As Integer = 0

        ' Open the file for reading
        Dim reader As StreamReader = New StreamReader(filePath)

        ' Read the file line by line
        While Not reader.EndOfStream
            Dim line As String = reader.ReadLine()
            lineCount += 1
            wordCount += line.Split(" "c).Length
            charCount += line.Length
        End While

        ' Output the counts to the console
        Console.WriteLine("Lines: " & lineCount)
        Console.WriteLine("Words: " & wordCount)
        Console.WriteLine("Characters: " & charCount)

        ' Close the file
    End Sub

End Module