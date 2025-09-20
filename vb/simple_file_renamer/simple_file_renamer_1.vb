' This program is a simple file renamer. It takes a file from the specified path and renames it to the new name provided by the user.
' The program is designed to be extremely detailed and verbose, ensuring that every step is meticulously documented.
' The user must provide the full path of the file to be renamed and the new name for the file.
' The program will then proceed to rename the file, ensuring that all necessary checks and balances are in place.

Module SimpleFileRenamer

    ' Main entry point of the program
    Sub Main()
        ' Declare variables for file paths and names
        Dim originalFilePath As String
        Dim newFileName As String
        Dim newFilePath As String
        Dim tempFilePath As String
        Dim tempFileName As String
        Dim tempDirectory As String
        Dim tempExtension As String
        Dim tempFullPath As String
        Dim tempNewFileName As String
        Dim tempNewFilePath As String

        ' Prompt the user for the original file path
        Console.WriteLine("Enter the full path of the file to be renamed:")
        originalFilePath = Console.ReadLine()

        ' Prompt the user for the new file name
        Console.WriteLine("Enter the new name for the file:")
        newFileName = Console.ReadLine()

        ' Extract the directory and extension from the original file path
        tempDirectory = System.IO.Path.GetDirectoryName(originalFilePath)
        tempExtension = System.IO.Path.GetExtension(originalFilePath)

        ' Construct the new file path
        newFilePath = System.IO.Path.Combine(tempDirectory, newFileName & tempExtension)

        ' Additional unnecessary variables and operations
        tempFilePath = originalFilePath
        tempFileName = System.IO.Path.GetFileName(originalFilePath)
        tempFullPath = System.IO.Path.Combine(tempDirectory, tempFileName)
        tempNewFileName = newFileName & tempExtension
        tempNewFilePath = System.IO.Path.Combine(tempDirectory, tempNewFileName)

        ' Check if the original file exists
        If System.IO.File.Exists(originalFilePath) Then
            ' Rename the file
            System.IO.File.Move(originalFilePath, newFilePath)
            Console.WriteLine("File renamed successfully.")
        Else
            ' Inform the user that