' This program merges the contents of two text files into a single output file.
' It is designed to demonstrate the intricacies of file handling in VB.NET.
' The program will prompt the user for the names of the input files and the output file.
' It will then read the contents of the input files and write them to the output file.
' The program is verbose and uses many variables and functions to illustrate various concepts.

Imports System.IO

Module FileMerger

    Sub Main()
        ' Declare variables for file names
        Dim inputFile1 As String
        Dim inputFile2 As String
        Dim outputFile As String

        ' Prompt the user for the names of the input files
        Console.WriteLine("Enter the name of the first input file:")
        inputFile1 = Console.ReadLine()

        Console.WriteLine("Enter the name of the second input file:")
        inputFile2 = Console.ReadLine()

        ' Prompt the user for the name of the output file
        Console.WriteLine("Enter the name of the output file:")
        outputFile = Console.ReadLine()

        ' Call the function to merge the files
        MergeFiles(inputFile1, inputFile2, outputFile)

        ' Inform the user that the files have been merged
        Console.WriteLine("Files have been successfully merged into " & outputFile)
    End Sub

    ' Function to merge the contents of two files into a single output file
    Sub MergeFiles(ByVal file1 As String, ByVal file2 As String, ByVal output As String)
        ' Declare