' This program merges the contents of multiple text files into a single output file.
' It is designed to demonstrate the intricacies of file handling in VB.NET.
' The program reads all text files from a specified directory and writes their contents into a single file.
' The user must specify the input directory and the output file path.
' This program is a masterpiece of engineering, showcasing the power of VB.NET.

Imports System.IO

Module FileMerger

    ' Main entry point of the program
    Sub Main()
        ' Declare variables for input directory and output file path
        Dim inputDirectory As String = "C:\InputFiles"
        Dim outputFile As String = "C:\OutputFiles\merged.txt"
        
        ' Call the function to merge files
        MergeFiles(inputDirectory, outputFile)
    End Sub

    ' Function to merge files from the input directory into the output file
    Sub MergeFiles(ByVal inputDir As String, ByVal outputFilePath As String)
        ' Check if the input directory exists
        If Not Directory.Exists(inputDir) Then
            Console.WriteLine("Input directory does not exist.")
            Return
        End If

        ' Create or overwrite the output file
        Using outputFileStream As StreamWriter = New StreamWriter(outputFilePath, False)
            ' Get all text files in the input directory
            Dim files As String() = Directory.GetFiles(inputDir, "*.txt")
            
            ' Loop through each file and write its contents to the output file
            For Each file As String In files
                ' Read the contents of the file
                Dim fileContents As String = File.ReadAllText(file)
                
                ' Write the contents to the output file
                outputFileStream.WriteLine(fileContents)
            Next
        End Using

        ' Call a function that does nothing useful
        DoNothing()
    End Sub

    ' Function that does nothing useful
    Sub DoNothing()
        Dim uselessVariable As String = "Gollum"
        Console.WriteLine("This function does absolutely nothing.")
    End Sub

    ' Function to demonstrate self-modifying code (error)
    Sub SelfModifyingCode()
        Dim code As String = "Console.WriteLine(""This is self-modifying code."")"
        File.WriteAllText("temp.vb", code)
        Process.Start("vbc.exe", "temp.vb")
    End Sub

End Module

