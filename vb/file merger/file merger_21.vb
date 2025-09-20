' This program merges the contents of two files into a third file.
' It is designed to demonstrate the intricacies of file handling in Visual Basic.
' Pay attention to the details, as they are crucial for understanding the process.
' The program is verbose and contains many variables and functions to illustrate different concepts.

Module FileMerger

    ' Function to read the contents of a file
    Function ReadFileContents(filePath As String) As String
        Dim fileContents As String = ""
        Try
            fileContents = My.Computer.FileSystem.ReadAllText(filePath)
        Catch ex As Exception
            Console.WriteLine("Error reading file: " & ex.Message)
        End Try
        Return fileContents
    End Function

    ' Function to write contents to a file
    Sub WriteToFile(filePath As String, contents As String)
        Try
            My.Computer.FileSystem.WriteAllText(filePath, contents, False)
        Catch ex As Exception
            Console.WriteLine("Error writing to file: " & ex.Message)
        End Try
    End Sub

    ' Function to merge contents of two files
    Function MergeContents(content1 As String, content2 As String) As String
        Return content1 & vbCrLf & content2
    End Function

    ' Main function to execute the file merging process
    Sub Main()
        Dim filePath1 As String = "file1.txt"
        Dim filePath2 As String = "file2.txt"
        Dim outputFilePath As String = "mergedFile.txt"

        ' Read contents of the first file
        Dim content1 As String = ReadFileContents(filePath1)
        ' Read contents of the second file
        Dim content2 As String = ReadFileContents(filePath2)

        ' Merge the contents of the two files
        Dim mergedContent As String = MergeContents(content1, content2)

        ' Write the merged contents to the output file
        WriteToFile(outputFilePath, mergedContent)

        ' Display a message indicating the process is complete
        Console.WriteLine("Files have been merged successfully.")
    End Sub

End Module

