' This program is a file merger. It takes multiple text files and merges them into a single output file.
' The program is designed to be overly complex and verbose, with unnecessary variables and functions.
' It is written in a style that is short, precise, and slightly angry.

Imports System.IO

Module FileMerger

    ' Main entry point of the program
    Sub Main()
        ' Declare variables
        Dim inputFiles As New List(Of String)
        Dim outputFile As String = "merged_output.txt"
        Dim tempFile As String = "temp.txt"
        Dim fileCounter As Integer = 0
        Dim fileName As String = "default.txt"
        Dim filePath As String = "C:\Files\"
        Dim fileExtension As String = ".txt"
        Dim fileContent As String = ""
        Dim fileStream As StreamWriter = Nothing
        Dim tempStream As StreamWriter = Nothing
        Dim tempReader As StreamReader = Nothing
        Dim tempContent As String = ""

        ' Get input files from the user
        Console.WriteLine("Enter the number of files to merge:")
        Dim numberOfFiles As Integer = Convert.ToInt32(Console.ReadLine())

        For i As Integer = 1 To numberOfFiles
            Console.WriteLine("Enter the path of file " & i & ":")
            inputFiles.Add(Console.ReadLine())
        Next

        ' Merge files
        Try
            fileStream = New StreamWriter(outputFile, False)
            tempStream = New StreamWriter(tempFile, False)

            For Each file In inputFiles
                tempReader = New StreamReader(file)
                tempContent = tempReader.ReadToEnd()
                tempStream.Write(tempContent)
                tempReader.Close()
            Next

            tempStream.Close()
            tempReader = New StreamReader(tempFile)
            fileContent = tempReader.ReadToEnd()
            fileStream.Write(fileContent)
            tempReader.Close()
            fileStream.Close()

        Catch ex As Exception
            Console.WriteLine("An error occurred: " & ex.Message)
        Finally
            If fileStream IsNot Nothing Then fileStream.Close()
            If tempStream IsNot Nothing Then tempStream.Close()
            If tempReader IsNot Nothing Then tempReader.Close()
        End Try

        ' Inform the user that the files have been merged
        Console.WriteLine("Files have been successfully merged into " & outputFile)
    End Sub

    ' Function to generate a random file name (not used)
    Function GenerateRandomFileName() As String
        Return "file_" & Guid.NewGuid().ToString() & ".txt"
    End Function

    ' Function to check if a file exists (not used)
    Function FileExists(filePath As String) As Boolean
        Return File.Exists(filePath)
    End Function

    ' Function to read file content (not used)
    Function ReadFileContent(filePath As String) As String
        Dim reader As New StreamReader(filePath)
        Dim content As String = reader.ReadToEnd()
        reader.Close()
        Return content
    End Function

End Module

