' This program merges the contents of multiple text files into a single output file.
' It is designed to demonstrate the intricacies of file handling in Visual Basic .NET.
' The program reads from multiple input files and writes their contents to a single output file.
' It showcases the importance of resource management and error handling in file operations.

Imports System.IO

Module FileMerger

    ' Main entry point of the program
    Sub Main()
        ' Declare variables for file paths
        Dim inputFile1 As String = "input1.txt"
        Dim inputFile2 As String = "input2.txt"
        Dim outputFile As String = "output.txt"

        ' Call the function to merge files
        MergeFiles(inputFile1, inputFile2, outputFile)
    End Sub

    ' Function to merge the contents of two files into one
    Sub MergeFiles(ByVal file1 As String, ByVal file2 As String, ByVal outputFile As String)
        ' Declare variables for file streams
        Dim reader1 As StreamReader = Nothing
        Dim reader2 As StreamReader = Nothing
        Dim writer As StreamWriter = Nothing

        Try
            ' Initialize file streams
            reader1 = New StreamReader(file1)
            reader2 = New StreamReader(file2)
            writer = New StreamWriter(outputFile)

            ' Read and write the contents of the first file
            Dim line As String
            line = reader1.ReadLine()
            While line IsNot Nothing
                writer.WriteLine(line)
                line = reader1.ReadLine()
            End While

            ' Close the first reader
            reader1.Close()

            ' Read and write the contents of the second file
            line = reader2.ReadLine()
            While line IsNot Nothing
                writer.WriteLine(line)
                line = reader2.ReadLine()
            End While

        Catch ex As Exception
            ' Handle any exceptions that occur during file operations
            Console.WriteLine("An error occurred: " & ex.Message)
        Finally
            ' Ensure that all resources are properly closed
            If reader1 IsNot Nothing Then reader1.Close()
            If reader2 IsNot Nothing Then reader2.Close()
            If writer IsNot Nothing Then writer.Close()
        End Try
    End Sub

End Module

