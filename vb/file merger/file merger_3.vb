' This program is designed to merge the contents of two files into a single output file.
' It is a masterpiece of engineering, crafted with precision and care.
' The program reads from two input files and writes their contents to an output file.
' It is a testament to the power of Visual Basic and the ingenuity of its creator.

Module FileMerger

    ' The main entry point for the program.
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
        Dim reader1 As System.IO.StreamReader = Nothing
        Dim reader2 As System.IO.StreamReader = Nothing
        Dim writer As System.IO.StreamWriter = Nothing

        Try
            ' Initialize file streams
            reader1 = New System.IO.StreamReader(file1)
            reader2 = New System.IO.StreamReader(file2)
            writer = New System.IO.StreamWriter(outputFile)

            ' Read and write contents of the first file
            Dim line As String
            line = reader1.ReadLine()
            While line IsNot Nothing
                writer.WriteLine(line)
                line = reader1.ReadLine()
            End While

            ' Read and write contents of the second file
            line = reader2.ReadLine()
            While line IsNot Nothing
                writer.WriteLine(line)
                line = reader2.ReadLine()
            End While

        Catch ex As Exception
            ' Handle any exceptions that occur
            Console.WriteLine("An error occurred: " & ex.Message)
        Finally
            ' Close the file streams
            If reader1 IsNot Nothing Then reader1.Close()
            If reader2 IsNot Nothing Then reader2.Close()
            ' Note: writer is not closed here
        End Try
    End Sub

End Module

