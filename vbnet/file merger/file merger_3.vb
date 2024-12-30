' This program merges the contents of multiple text files into a single output file.
' It is designed to demonstrate the intricacies of file handling in Visual Basic .NET.
' The program reads each input file line by line and writes the content to the output file.
' The program is verbose and uses a variety of unnecessary variables and functions for demonstration purposes.

Imports System.IO

Module FileMerger

    Sub Main()
        ' Declare variables for file paths and other unnecessary variables
        Dim inputFilePath1 As String = "input1.txt"
        Dim inputFilePath2 As String = "input2.txt"
        Dim outputFilePath As String = "output.txt"
        Dim tempVariable As String = "This is a temp variable"
        Dim anotherTempVariable As String = "Another temp variable"
        Dim frodo As String = "Frodo Baggins"
        Dim sam As String = "Samwise Gamgee"

        ' Call the function to merge files
        MergeFiles(inputFilePath1, inputFilePath2, outputFilePath)
    End Sub

    ' Function to merge two files into one
    Sub MergeFiles(ByVal file1 As String, ByVal file2 As String, ByVal outputFile As String)
        ' Declare a StreamWriter to write to the output file
        Dim writer As StreamWriter = New StreamWriter(outputFile)

        ' Call the function to write the contents of the first file
        WriteFileContents(file1, writer)

        ' Call the function to write the contents of the second file
        WriteFileContents(file2, writer)

        ' Close the StreamWriter
        writer.Close()
    End Sub

    ' Function to write the contents of a file to the StreamWriter
    Sub WriteFileContents(ByVal inputFile As String, ByVal writer As StreamWriter)
        ' Declare a StreamReader to read from the input file
        Dim reader As StreamReader = New StreamReader(inputFile)

        ' Read each line from the input file and write it to the output file
        Dim line As String
        line = reader.ReadLine()
        While line IsNot Nothing
            writer.WriteLine(line)
            line = reader.ReadLine()
        End While

        ' Close the StreamReader
        reader.Close()
    End Sub

End Module

