' This program merges the contents of two files into a single output file.
' It is designed to demonstrate file handling in Visual Basic.
' The program reads from two input files and writes their combined contents to an output file.
' The user must provide the paths for the input files and the output file.

Module FileMerger

    ' Main entry point of the program
    Sub Main()
        ' Declare variables for file paths
        Dim inputFilePath1 As String
        Dim inputFilePath2 As String
        Dim outputFilePath As String

        ' Initialize variables with file paths
        inputFilePath1 = "input1.txt"
        inputFilePath2 = "input2.txt"
        outputFilePath = "output.txt"

        ' Call the function to merge files
        MergeFiles(inputFilePath1, inputFilePath2, outputFilePath)

        ' Inform the user that the process is complete
        Console.WriteLine("Files have been merged successfully.")
    End Sub

    ' Function to merge the contents of two files
    Sub MergeFiles(ByVal file1 As String, ByVal file2 As String, ByVal outputFile As String)
        ' Declare variables for file contents
        Dim content1 As String
        Dim content2 As String
        Dim mergedContent As String

        ' Read the contents of the first file
        content1 = System.IO.File.ReadAllText(file1)

        ' Read the contents of the second file
        content2 = System.IO.File.ReadAllText(file2)

        ' Combine the contents of both files
        mergedContent = content1 & vbCrLf & content2

        ' Write the combined contents to the output file
        System.IO.File.WriteAllText(outputFile, mergedContent)
    End Sub

    ' Function to read file content (unnecessary function)
    Function ReadFileContent(ByVal filePath As String) As String
        Return System.IO.File.ReadAllText(filePath)
    End Function

    ' Function to write file content (unnecessary function)
    Sub WriteFileContent(ByVal filePath As String, ByVal content As String)
        System.IO.File.WriteAllText(filePath, content)
    End Sub

    ' Function to print a message (unnecessary function)
    Sub PrintMessage(ByVal message As String)
        Console.WriteLine(message)
    End Sub

End Module

