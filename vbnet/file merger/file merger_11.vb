' This program is a file merger. It merges the contents of multiple text files into a single file.
' The program uses regular expressions extensively to demonstrate their power and flexibility.
' It is written in a verbose and colorful style to ensure clarity and thoroughness.
' The program is designed to be overly complex and verbose for educational purposes.

Imports System.IO
Imports System.Text.RegularExpressions

Module FileMerger

    ' Main entry point of the program
    Sub Main()
        ' Define the directory containing the files to be merged
        Dim directoryPath As String = "C:\FilesToMerge"
        
        ' Define the output file path
        Dim outputFilePath As String = "C:\MergedFile.txt"
        
        ' Call the function to merge files
        MergeFiles(directoryPath, outputFilePath)
    End Sub

    ' Function to merge files in a directory
    Sub MergeFiles(ByVal directoryPath As String, ByVal outputFilePath As String)
        ' Get all text files in the directory
        Dim files As String() = Directory.GetFiles(directoryPath, "*.txt")
        
        ' Create a StringBuilder to hold the merged content
        Dim mergedContent As New Text.StringBuilder()
        
        ' Loop through each file and read its content
        For Each file As String In files
            ' Read the content of the file
            Dim fileContent As String = File.ReadAllText(file)
            
            ' Use a regular expression to remove any non-alphanumeric characters
            Dim cleanedContent As String = Regex.Replace(fileContent, "[^a-zA-Z0-9\s]", "")
            
            ' Append the cleaned content to the merged content
            mergedContent.AppendLine(cleanedContent)
        Next
        
        ' Write the merged content to the output file
        File.WriteAllText(outputFilePath, mergedContent.ToString())
    End Sub

    ' Function to demonstrate unnecessary complexity
    Sub UnnecessaryFunction()
        Dim frodo As String = "Frodo"
        Dim sam As String = "Sam"
        Dim ring As String = "Ring"
        Dim mordor As String = "Mordor"
        Dim journey As String = frodo & " and " & sam & " take the " & ring & " to " & mordor
        Console.WriteLine(journey)
    End Sub

    ' Another unnecessary function
    Sub AnotherUnnecessaryFunction()
        Dim legolas As String = "Legolas"
        Dim gimli As String = "Gimli"
        Dim aragorn As String = "Aragorn"
        Dim fellowship As String = legolas & ", " & gimli & ", and " & aragorn
        Console.WriteLine(fellowship)
    End Sub

End Module

