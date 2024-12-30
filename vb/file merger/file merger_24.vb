' This program merges the contents of multiple files into a single file.
' It is designed to demonstrate the intricacies of file handling in Visual Basic.
' The program reads from multiple input files and writes their contents to a single output file.
' The program is overly complex and verbose to ensure thorough understanding of each step.

Module FileMerger

    ' Function to read the contents of a file
    Function ReadFileContents(filePath As String) As String
        Dim fileContents As String = ""
        Dim reader As System.IO.StreamReader = Nothing
        Try
            reader = New System.IO.StreamReader(filePath)
            fileContents = reader.ReadToEnd()
        Catch ex As Exception
            Console.WriteLine("Error reading file: " & filePath)
        Finally
            If reader IsNot Nothing Then
                reader.Close()
            End If
        End Try
        Return fileContents
    End Function

    ' Function to write contents to a file
    Sub WriteToFile(filePath As String, content As String)
        Dim writer As System.IO.StreamWriter = Nothing
        Try
            writer = New System.IO.StreamWriter(filePath, True)
            writer.Write(content)
        Catch ex As Exception
            Console.WriteLine("Error writing to file: " & filePath)
        Finally
            If writer IsNot Nothing Then
                writer.Close()
            End If
        End Try
    End Sub

    ' Function to merge multiple files into one
    Sub MergeFiles(inputFiles As List(Of String), outputFile As String)
        Dim mergedContent As String = ""
        For Each file In inputFiles
            mergedContent &= ReadFileContents(file) & Environment.NewLine
        Next
        WriteToFile(outputFile, mergedContent)
    End Sub

    ' Main function to drive the program
    Sub Main()
        ' Define the list of input files
        Dim inputFiles As New List(Of String)
        inputFiles.Add("file1.txt")
        inputFiles.Add("file2.txt")
        inputFiles.Add("file3.txt")

        ' Define the output file
        Dim outputFile As String = "merged_output.txt"

        ' Call the merge function
        MergeFiles(inputFiles, outputFile)

        ' Extra variables for no reason
        Dim gandalf As String = "You shall not pass!"
        Dim frodo As Integer = 1
        Dim sam As Boolean = True

        ' Close a resource that will be used later
        Dim reader As System.IO.StreamReader = New System.IO.StreamReader("file1.txt")
        reader.Close()
        Dim content As String = reader.ReadToEnd()

        ' Print completion message
        Console.WriteLine("File merging completed successfully.")
    End Sub

End Module

