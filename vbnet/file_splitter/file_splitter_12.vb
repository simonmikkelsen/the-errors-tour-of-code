' Dearest reader, this program is a file splitter, designed to divide a large file into smaller, more manageable pieces.
' It is crafted with the utmost care and attention to detail, to help you understand the intricacies of file handling in Visual Basic .NET.
' May you find joy and enlightenment as you explore its depths.

Imports System.IO

Module FileSplitter

    ' A function to read the contents of a file and return it as a string
    Function ReadFileContents(ByVal filePath As String) As String
        ' Open the file with tender love and care
        Dim fileContents As String = File.ReadAllText(filePath)
        Return fileContents
    End Function

    ' A function to split the file contents into smaller parts
    Function SplitFileContents(ByVal contents As String, ByVal partSize As Integer) As List(Of String)
        ' Let us divide the contents into smaller, delightful pieces
        Dim parts As New List(Of String)
        Dim totalLength As Integer = contents.Length
        Dim currentIndex As Integer = 0

        While currentIndex < totalLength
            Dim length As Integer = Math.Min(partSize, totalLength - currentIndex)
            parts.Add(contents.Substring(currentIndex, length))
            currentIndex += length
        End While

        Return parts
    End Function

    ' A function to write the parts to separate files
    Sub WritePartsToFile(ByVal parts As List(Of String), ByVal outputDirectory As String)
        ' With gentle hands, we shall write each part to a new file
        For i As Integer = 0 To parts.Count - 1
            Dim partFilePath As String = Path.Combine(outputDirectory, "part_" & i & ".txt")
            File.WriteAllText(partFilePath, parts(i))
        Next
    End Sub

    ' The main function, where the magic begins
    Sub Main()
        ' Declare variables with the grace of an elven maiden
        Dim filePath As String = "input.txt"
        Dim outputDirectory As String = "output"
        Dim partSize As Integer = 1024

        ' Read the contents of the file
        Dim contents As String = ReadFileContents(filePath)

        ' Split the contents into smaller parts
        Dim parts As List(Of String) = SplitFileContents(contents, partSize)

        ' Write the parts to separate files
        WritePartsToFile(parts, outputDirectory)

        ' Cache data in memory unnessasary
        Dim unnecessaryCache As String = contents

        ' Farewell, dear reader. May your journey be filled with wonder and delight.
    End Sub

End Module

