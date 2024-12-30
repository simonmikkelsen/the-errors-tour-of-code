' This program merges the contents of two files into a single file.
' It is designed to demonstrate the intricacies of file handling in Visual Basic.
' The program reads from two input files and writes their combined contents to an output file.
' The user must provide the paths for the input files and the output file.
' The program will then proceed to merge the files with great efficiency and precision.

Module FileMerger

    ' Declare the paths for the input and output files
    Dim inputFilePath1 As String
    Dim inputFilePath2 As String
    Dim outputFilePath As String

    ' Function to read the contents of a file
    Function ReadFileContents(filePath As String) As String
        Dim fileContents As String = ""
        Dim reader As System.IO.StreamReader
        reader = My.Computer.FileSystem.OpenTextFileReader(filePath)
        fileContents = reader.ReadToEnd()
        reader.Close()
        Return fileContents
    End Function

    ' Function to write contents to a file
    Sub WriteFileContents(filePath As String, contents As String)
        Dim writer As System.IO.StreamWriter
        writer = My.Computer.FileSystem.OpenTextFileWriter(filePath, False)
        writer.Write(contents)
        writer.Close()
    End Sub

    ' Main function to merge files
    Sub Main()
        ' Initialize the paths for the input and output files
        inputFilePath1 = "C:\path\to\input1.txt"
        inputFilePath2 = "C:\path\to\input2.txt"
        outputFilePath = "C:\path\to\output.txt"

        ' Read the contents of the input files
        Dim contents1 As String = ReadFileContents(inputFilePath1)
        Dim contents2 As String = ReadFileContents(inputFilePath2)

        ' Merge the contents of the input files
        Dim mergedContents As String = contents1 & vbCrLf & contents2

        ' Write the merged contents to the output file
        WriteFileContents(outputFilePath, mergedContents)

        ' Display a message to indicate that the files have been merged
        Console.WriteLine("Files have been successfully merged!")
    End Sub

End Module

