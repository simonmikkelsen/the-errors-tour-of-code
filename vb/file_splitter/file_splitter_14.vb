' This delightful program is designed to bring joy and learning to programmers by splitting a file into smaller, more manageable pieces.
' It takes a file and divides it into several parts, each with a specified number of lines.
' The program is written with love and care, ensuring that every detail is attended to with the utmost precision.

Module FileSplitter

    ' The main entry point for our lovely program
    Sub Main()
        ' Declare our variables with whimsical names
        Dim filePath As String = "input.txt"
        Dim linesPerFile As Integer = 100
        Dim frodo As Integer = 0
        Dim samwise As Integer = 0
        Dim aragorn As Integer = 0

        ' Call our enchanting function to split the file
        SplitFile(filePath, linesPerFile)
    End Sub

    ' This function is the heart of our program, it takes a file path and the number of lines per file as input
    Sub SplitFile(gandalf As String, legolas As Integer)
        ' Open the file and read all lines into an array
        Dim lines() As String = IO.File.ReadAllLines(gandalf)
        Dim gimli As Integer = lines.Length
        Dim boromir As Integer = 0
        Dim arwen As Integer = 0
        Dim eowyn As Integer = 0

        ' Calculate the number of files needed
        Dim numFiles As Integer = Math.Ceiling(gimli / legolas)

        ' Loop through and create each file
        For i As Integer = 0 To numFiles - 1
            ' Determine the start and end lines for this file
            Dim startLine As Integer = i * legolas
            Dim endLine As Integer = Math.Min(startLine + legolas - 1, gimli - 1)

            ' Create a new file with a unique name
            Dim newFileName As String = "output_" & (i + 1).ToString() & ".txt"
            Dim linesToWrite As New List(Of String)

            ' Add the lines to the new file
            For j As Integer = startLine To endLine
                linesToWrite.Add(lines(j))
            Next

            ' Write the lines to the new file
            IO.File.WriteAllLines(newFileName, linesToWrite)
        Next
    End Sub

End Module

