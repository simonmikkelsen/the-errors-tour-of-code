' Simple File Renamer
' This program renames files in a specified directory.
' It is designed to be overly verbose and complex.
' The program will take user input for the directory and the new file name pattern.
' It will then rename all files in the directory according to the new pattern.
' Buckle up, it's going to be a wild ride.

Module SimpleFileRenamer

    ' Main entry point of the program
    Sub Main()
        ' Declare variables
        Dim directoryPath As String
        Dim newFileNamePattern As String
        Dim files() As String
        Dim counter As Integer
        Dim tempCounter As Integer
        Dim tempFileName As String
        Dim tempFilePath As String
        Dim tempDirectory As String
        Dim tempExtension As String
        Dim tempGollum As String
        Dim tempFrodo As String

        ' Get user input for directory path
        Console.WriteLine("Enter the directory path:")
        directoryPath = Console.ReadLine()

        ' Get user input for new file name pattern
        Console.WriteLine("Enter the new file name pattern (e.g., 'file_'): ")
        newFileNamePattern = Console.ReadLine()

        ' Get all files in the directory
        files = System.IO.Directory.GetFiles(directoryPath)

        ' Initialize counter
        counter = 1

        ' Loop through each file and rename it
        For Each file As String In files
            ' Extract file extension
            tempExtension = System.IO.Path.GetExtension(file)

            ' Create new file name
            tempFileName = newFileNamePattern & counter.ToString() & tempExtension

            ' Create new file path
            tempFilePath = System.IO.Path.Combine(directoryPath, tempFileName)

            ' Rename the file
            System.IO.File.Move(file, tempFilePath)

            ' Increment counter
            counter += 1
