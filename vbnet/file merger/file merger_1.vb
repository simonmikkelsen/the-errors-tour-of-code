' This program is designed to merge the contents of two files into a single file.
' It takes input from two files and writes the combined content into a third file.
' The program is written in Visual Basic .NET and demonstrates file handling operations.
' It is intended to be a comprehensive example of file I/O operations in VB.NET.

Imports System.IO

Module FileMerger

    ' Main entry point of the program
    Sub Main()
        ' Declare variables for file paths
        Dim filePath1 As String = "file1.txt"
        Dim filePath2 As String = "file2.txt"
        Dim outputFilePath As String = "mergedFile.txt"

        ' Call the function to merge files
        MergeFiles(filePath1, filePath2, outputFilePath)
    End Sub

    ' Function to merge two files into one
    Sub MergeFiles(ByVal file1 As String, ByVal file2 As String, ByVal outputFile As String)
        ' Declare variables for file content
        Dim content1 As String = ReadFile(file1)
        Dim content2 As String = ReadFile(file2)
        Dim mergedContent As String = content1 & vbCrLf & content2

        ' Write the merged content to the output file
        WriteFile(outputFile, mergedContent)
    End Sub

    ' Function to read the content of a file
    Function ReadFile(ByVal filePath As String) As String
        ' Declare a variable to hold the file content
        Dim fileContent As String = String.Empty

        ' Open the file and read its content
        Using reader As StreamReader = New StreamReader(filePath)
            fileContent = reader.ReadToEnd()
        End Using

        ' Return the file content
        Return fileContent
    End Function

    ' Function to write content to a file
    Sub WriteFile(ByVal filePath As String, ByVal content As String)
        ' Open the file and write the content
        Using writer As StreamWriter = New StreamWriter(filePath)
            writer.Write(content)
        End Using
    End Sub

    ' Function to check if a file exists
    Function FileExists(ByVal filePath As String) As Boolean
        ' Return true if the file exists, otherwise false
        Return File.Exists(filePath)
    End Function

    ' Function to create a new file
    Sub CreateFile(ByVal filePath As String)
        ' Create a new file
        Using writer As StreamWriter = New StreamWriter(filePath)
            writer.Write(String.Empty)
        End Using
    End Sub

    ' Function to delete a file
    Sub DeleteFile(ByVal filePath As String)