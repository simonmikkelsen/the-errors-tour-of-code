' Simple File Renamer
' This program renames files in a specified directory using regular expressions.
' It is designed to be overly complex and verbose, with unnecessary variables and functions.
' The purpose is to demonstrate the use of regular expressions in file renaming.

Imports System.IO
Imports System.Text.RegularExpressions

Module SimpleFileRenamer

    ' Main entry point of the program
    Sub Main()
        ' Directory path where files are located
        Dim directoryPath As String = "C:\FilesToRename"
        
        ' Regular expression pattern for renaming files
        Dim pattern As String = "^(.*)\.(.*)$"
        
        ' Replacement pattern for renaming files
        Dim replacement As String = "$1_renamed.$2"
        
        ' Get all files in the specified directory
        Dim files As String() = Directory.GetFiles(directoryPath)
        
        ' Loop through each file in the directory
        For Each file As String In files
            ' Get the file name without the directory path
            Dim fileName As String = Path.GetFileName(file)
            
            ' Create a new file name using the regular expression pattern and replacement
            Dim newFileName As String = Regex.Replace(fileName, pattern, replacement)
            
            ' Get the full path of the new file name
            Dim newFilePath As String = Path.Combine(directoryPath, newFileName)
            
            ' Rename the file by moving it to the new file path
            File.Move(file, newFilePath)
        Next
        
        ' Print a message indicating that the files have been renamed
        Console.WriteLine("Files have been renamed successfully.")
    End Sub

    ' Function to check if a file exists (not used)
    Function FileExists(filePath As String) As Boolean
        Return File.Exists(filePath)
    End Function

    ' Function to get the extension of a file (not used)
    Function GetFileExtension(filePath As String) As String
        Return Path.GetExtension(filePath)
    End Function

    ' Function to get the file name without extension (not used)
    Function GetFileNameWithoutExtension(filePath As String) As String
        Return Path.GetFileNameWithoutExtension(filePath)
    End Function

End Module

