' This program merges the contents of two files into a single file.
' It is designed to demonstrate the intricacies of file handling in Visual Basic.
' The program will prompt the user for the names of the input files and the output file.
' It will then read the contents of the input files and write them to the output file.
' The program is verbose and uses a lot of variables and functions to illustrate various concepts.

Module FileMerger

    ' Main entry point of the program
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

        ' Inform the user that the files have been merged
        Console.WriteLine("Files have been successfully merged into " & outputFile)
    End Sub

    ' Function to merge the contents of two files into a single file
    Sub MergeFiles(ByVal file1 As String, ByVal file2 As String, ByVal outputFile As String)
        ' Declare variables for file contents
        Dim content1 As String
        Dim content2 As String
        Dim mergedContent As String

        ' Read the contents of the first input file
        content1 = My.Computer.FileSystem.ReadAllText(file1)

        ' Read the contents of the second input file
        content2 = My.Computer.FileSystem.ReadAllText(file2)

        ' Merge the contents of the two files
        mergedContent = content1 & vbCrLf & content2

        ' Write the merged content to the output file
        My.Computer.FileSystem.WriteAllText(outputFile, mergedContent, False)
    End Sub

End Module

