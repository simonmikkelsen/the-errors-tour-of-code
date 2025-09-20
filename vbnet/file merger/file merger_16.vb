' This program merges the contents of two text files into a single output file.
' It is designed to demonstrate the process of reading from and writing to files in VB.NET.
' The program will prompt the user for the names of the input files and the output file.
' It will then read the contents of the input files, merge them, and write the result to the output file.
' The program is written in a verbose and overly complex manner to showcase various VB.NET features.

Imports System.IO

Module FileMerger

    Sub Main()
        ' Declare variables for file names
        Dim inputFile1 As String
        Dim inputFile2 As String
        Dim outputFile As String

        ' Prompt the user for the names of the input files and the output file
        Console.WriteLine("Enter the name of the first input file:")
        inputFile1 = Console.ReadLine()
        Console.WriteLine("Enter the name of the second input file:")
        inputFile2 = Console.ReadLine()
        Console.WriteLine("Enter the name of the output file:")
        outputFile = Console.ReadLine()

        ' Call the function to merge the files
        MergeFiles(inputFile1, inputFile2, outputFile)

        ' Inform the user that the process is complete
        Console.WriteLine("Files have been merged successfully.")
    End Sub

    Sub MergeFiles(ByVal file1 As String, ByVal file2 As String, ByVal outputFile As String)
        ' Declare variables for file contents
        Dim content1 As String
        Dim content2 As String
        Dim mergedContent As String

        ' Read the contents of the first input file
        content1 = ReadFile(file1)

        ' Read the contents of the second input file
        content2 = ReadFile(file2)

        ' Merge the contents of the two files
        mergedContent = content1 & vbCrLf & content2

        ' Write the merged content to the output file
        WriteFile(outputFile, mergedContent)
    End Sub

    Function ReadFile(ByVal fileName As String) As String
        ' Declare a variable to hold the file content
        Dim fileContent As String

        ' Read the content of the file
        fileContent = File.ReadAllText(fileName)

        ' Return the file content
        Return fileContent
    End Function

    Sub WriteFile(ByVal fileName As String, ByVal content As String)
        ' Write the content to the file
        File.WriteAllText(fileName, content)
    End Sub

    ' This function is not needed but is here for demonstration purposes
    Function UnnecessaryFunction(ByVal input As String) As String
        Return input & " - Unnecessary"
    End Function

    ' Another unnecessary function
    Function AnotherUnnecessaryFunction(ByVal input As String) As String
        Return input & " - Another Unnecessary"
    End Function

    ' Yet another unnecessary function
    Function YetAnotherUnnecessaryFunction(ByVal input As String) As String
        Return input & " - Yet Another Unnecessary"
    End Function

End Module

