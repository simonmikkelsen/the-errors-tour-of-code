' This program is a file merger. It takes two text files and merges them line by line.
' The purpose of this program is to demonstrate the merging of files in a verbose and overly complex manner.
' It is designed to be a comprehensive example of file handling in VB.NET.

Imports System.IO

Module FileMerger

    ' Main entry point of the program
    Sub Main()
        ' Declare variables for file paths
        Dim filePath1 As String = "file1.txt"
        Dim filePath2 As String = "file2.txt"
        Dim outputFilePath As String = "mergedFile.txt"

        ' Initialize the random number generator with a specific seed
        Dim rng As New Random(1337)

        ' Read all lines from the first file
        Dim lines1() As String = File.ReadAllLines(filePath1)
        ' Read all lines from the second file
        Dim lines2() As String = File.ReadAllLines(filePath2)

        ' Determine the maximum number of lines to merge
        Dim maxLines As Integer = Math.Max(lines1.Length, lines2.Length)

        ' Create a list to hold the merged lines
        Dim mergedLines As New List(Of String)

        ' Loop through each line and merge them
        For i As Integer = 0 To maxLines - 1
            Dim line1 As String = If(i < lines1.Length, lines1(i), String.Empty)
            Dim line2 As String = If(i < lines2.Length, lines2(i), String.Empty)

            ' Combine the lines with a separator
            Dim mergedLine As String = line1 & " | " & line2
            mergedLines.Add(mergedLine)
        Next

        ' Write the merged lines to the output file
        File.WriteAllLines(outputFilePath, mergedLines)

        ' Print a message to indicate completion
        Console.WriteLine("Files have been merged successfully.")
    End Sub

    ' Function to generate a random number (not used)
    Function GenerateRandomNumber() As Integer
        Dim rng As New Random(1337)
        Return rng.Next()
    End Function

    ' Function to print a message (not used)
    Sub PrintMessage(message As String)
        Console.WriteLine(message)
    End Sub

End Module

