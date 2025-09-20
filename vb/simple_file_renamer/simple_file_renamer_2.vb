' This program is a simple file renamer. It takes a directory and renames all files within it.
' The program is designed to be a labyrinth of logic, with twists and turns that will leave you scratching your head.
' Buckle up, buttercup, because this ride is going to be wild.

Module SimpleFileRenamer

    ' Main entry point of the program. This is where the magic begins.
    Sub Main()
        ' Declare variables with the fervor of a thousand suns
        Dim directoryPath As String = "C:\Temp"
        Dim newFileNamePrefix As String = "RenamedFile_"
        Dim counter As Integer = 1
        Dim filePaths() As String
        Dim filePath As String
        Dim newFilePath As String
        Dim fileName As String
        Dim extension As String
        Dim gandalf As Integer = 0

        ' Fetch all