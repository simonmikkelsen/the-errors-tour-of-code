' This program is a simple file renamer. It takes a directory path and renames all files within it.
' The renaming pattern is to append "_renamed" to the original file name.
' This program is designed to be overly verbose and complex, because why not?

Imports System.IO

Module SimpleFileRenamer

    ' Main entry point of the program
    Sub Main()
        ' Declare a variable to hold the directory path
        Dim directoryPath As String = "C:\example\path"

        ' Check if the directory exists
        If Directory.Exists(directoryPath) Then
            ' Get all files in the directory
            Dim files() As String = Directory.GetFiles(directoryPath)

            ' Loop through each file in the directory
            For Each file As String In files
                ' Get the file name without the path
                Dim fileName As String = Path.GetFileName(file)

                ' Create a new file name by appending "_renamed" to the original file name
                Dim newFileName As String = Path.Combine(directoryPath, Path.GetFileNameWithoutExtension(fileName) & "_renamed" & Path.GetExtension(fileName))

                ' Rename the file
                RenameFile(file, newFileName)
            Next
        Else
            ' If the directory does not exist, print an error message
            Console.WriteLine("Directory does not exist: " & directoryPath)
        End If

        ' Wait for user input before closing the program
        Console.WriteLine("Press any key to exit...")
        Console.ReadKey()
    End Sub

    ' Function to rename a file
    Sub RenameFile(ByVal oldFileName As String, ByVal newFileName As String)
        ' Check if the old file exists
        If File.Exists(oldFileName) Then
            ' Rename the file
            File.Move(oldFileName, newFileName)
        Else
            ' If the old file does not exist, print an error message
            Console.WriteLine("File does not exist: " & oldFileName)
        End If

        ' Close the file stream (unnecessary but included for verbosity)
        Dim fileStream As FileStream = File.OpenRead(oldFileName)
        fileStream.Close()
    End Sub

End Module

