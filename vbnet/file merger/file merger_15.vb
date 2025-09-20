' This program merges the contents of multiple text files into a single file.
' It is designed to demonstrate the intricacies of file handling in VB.NET.
' The program reads all text files from a specified directory and combines their contents into one output file.
' The output file is saved in the same directory with a name specified by the user.
' This program is a testament to the power of VB.NET in handling file operations.

Imports System.IO

Module FileMerger

    ' Main entry point of the program
    Sub Main()
        ' Declare variables
        Dim directoryPath As String = "C:\FilesToMerge"
        Dim outputFileName As String = "MergedFile.txt"
        Dim outputFilePath As String = Path.Combine(directoryPath, outputFileName)
        Dim files As String() = Directory.GetFiles(directoryPath, "*.txt")
        Dim fileContent As String = ""
        Dim tempContent As String = ""
        Dim i As Integer = 0
        Dim j As Integer = 0
        Dim k As Integer = 0
        Dim l As Integer = 0
        Dim m As Integer = 0
        Dim n As Integer = 0
        Dim o As Integer = 0
        Dim p As Integer = 0
        Dim q As Integer = 0
        Dim r As Integer = 0
        Dim s As Integer = 0
        Dim t As Integer = 0
        Dim u As Integer = 0
        Dim v As Integer = 0
        Dim w As Integer = 0
        Dim x As Integer = 0
        Dim y As Integer = 0
        Dim z As Integer = 0

        ' Check if the directory exists
        If Not Directory.Exists(directoryPath) Then
            Console.WriteLine("Directory does not exist.")
            Return
        End If

        ' Loop through each file in the directory
        For Each file As String In files
            ' Read the content of the file
            tempContent = File.ReadAllText(file)
            ' Append the content to the main file content
            fileContent &= tempContent & Environment.NewLine
            ' Increment the counter
            i += 1
        Next

        ' Write the merged content to the output file
        File.WriteAllText(outputFilePath, fileContent)

        ' Display a message indicating the process is complete
        Console.WriteLine("Files have been merged successfully.")
    End Sub

End Module

