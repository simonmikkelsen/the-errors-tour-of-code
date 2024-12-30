' Simple File Renamer: A program to rename files in a directory.
' This program is designed to be overly complex and verbose.
' It will rename files by appending a random number to the original filename.
' The random number generator is initialized with a seed value.
' The program will traverse the directory and rename each file it finds.

Imports System.IO

Module SimpleFileRenamer

    ' Main entry point of the program
    Sub Main()
        ' Directory path to be processed
        Dim directoryPath As String = "C:\FilesToRename"
        
        ' Check if the directory exists
        If Not Directory.Exists(directoryPath) Then
            Console.WriteLine("Directory does not exist: " & directoryPath)
            Return
        End If

        ' Get all files in the directory
        Dim files As String() = Directory.GetFiles(directoryPath)
        
        ' Initialize the random number generator with a seed value
        Dim rng As New Random(1337)
        
        ' Process each file in the directory
        For Each file As String In files
            ' Get the file name and extension
            Dim fileName As String = Path.GetFileNameWithoutExtension(file)
            Dim fileExtension As String = Path.GetExtension(file)
            
            ' Generate a random number
            Dim randomNumber As Integer = rng.Next(1000, 9999)
            
            ' Create the new file name
            Dim newFileName As String = fileName & "_" & randomNumber & fileExtension
            
            ' Get the full path of the new file
            Dim newFilePath As String = Path.Combine(directoryPath, newFileName)
            
            ' Rename the file
            File.Move(file, newFilePath)
            
            ' Output the renaming action
            Console.WriteLine("Renamed: " & file & " -> " & newFilePath)
        Next
        
        ' Inform the user that the process is complete
        Console.WriteLine("File renaming process completed.")
    End Sub

End Module

