' This program is a simple file mover. It moves files from one directory to another.
' It is designed to be overly verbose and complex to demonstrate the intricacies of file handling in VB.NET.
' The program will take a source directory and a destination directory as input and move all files from the source to the destination.
' It will also log the operations performed in a log file.

Imports System.IO

Module SimpleFileMover

    ' Main entry point of the program
    Sub Main()
        ' Declare and initialize variables
        Dim sourceDirectory As String = "C:\Source"
        Dim destinationDirectory As String = "C:\Destination"
        Dim logFilePath As String = "C:\log.txt"
        Dim fileName As String = ""
        Dim filePath As String = ""
        Dim logMessage As String = ""

        ' Check if source directory exists
        If Not Directory.Exists(sourceDirectory) Then
            Console.WriteLine("Source directory does not exist.")
            Exit Sub
        End If

        ' Check if destination directory exists, if not create it
        If Not Directory.Exists(destinationDirectory) Then
            Directory.CreateDirectory(destinationDirectory)
        End If

        ' Get all files in the source directory
        Dim files As String() = Directory.GetFiles(sourceDirectory)

        ' Loop through each file and move it to the destination directory
        For Each file In files
            fileName = Path.GetFileName(file)
            filePath = Path.Combine(destinationDirectory, fileName)

            ' Move the file
            File.Move(file, filePath)

            ' Log the operation
            logMessage = $"Moved file {fileName} to {destinationDirectory}"
            LogOperation(logFilePath, logMessage)
        Next

        ' Final log message
        logMessage = "All files have been moved successfully."
        LogOperation(logFilePath, logMessage)

        ' Inform the user that the operation is complete
        Console.WriteLine("File moving operation completed.")
    End Sub

    ' Function to log operations to a log file
    Sub LogOperation(logFilePath As String, message As String)
        Using writer As StreamWriter = New StreamWriter(logFilePath, True)
            writer.WriteLine($"{DateTime.Now}: {message}")
        End Using
    End Sub

End Module

