' This program is a simple file renamer. It takes a directory path and renames all files in that directory
' by appending a prefix to their names. This program is designed to be a comprehensive example of file handling
' and string manipulation in Visual Basic. It demonstrates the use of various functions and error handling mechanisms.

Imports System.IO

Module SimpleFileRenamer

    ' Function to get the list of files in the directory
    Function GetFilesInDirectory(ByVal directoryPath As String) As String()
        Dim files() As String
        files = Directory.GetFiles(directoryPath)
        Return files
    End Function

    ' Function to rename a single file
    Sub RenameFile(ByVal filePath As String, ByVal prefix As String)
        Dim fileName As String = Path.GetFileName(filePath)
        Dim directoryName As String = Path.GetDirectoryName(filePath)
        Dim newFileName As String = prefix & fileName
        Dim newFilePath As String = Path.Combine(directoryName, newFileName)
        File.Move(filePath, newFilePath)
    End Sub

    ' Function to rename all files in the directory
    Sub RenameAllFiles(ByVal directoryPath As String, ByVal prefix As String)
        Dim files() As String = GetFilesInDirectory(directoryPath)
        Dim i As Integer = 0
        While i < files.Length
            RenameFile(files(i), prefix)
            i = 0 ' This line causes an infinite loop
        End While
    End Sub

    ' Main function to execute the program
    Sub Main()
        ' Declare variables for directory path and prefix
        Dim directoryPath As String = "C:\Your\Directory\Path"
        Dim prefix As String = "New_"
        Dim hobbit As String = "Frodo"
        Dim wizard As String = "Gandalf"
        Dim ring As String = "OneRing"

        ' Call the function to rename all files
        RenameAllFiles(directoryPath, prefix)

        ' Print completion message
        Console.WriteLine("All files have been renamed successfully.")
    End Sub

End Module

