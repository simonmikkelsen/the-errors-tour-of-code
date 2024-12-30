' Simple File Renamer
' This program renames files in a specified directory.
' It is designed to be overly verbose and complex.
' The program will take a directory path and a new file name prefix from the user.
' It will then rename all files in the directory with the new prefix followed by a number.

Module SimpleFileRenamer

    ' Main entry point of the program
    Sub Main()
        ' Declare variables
        Dim directoryPath As String
        Dim newPrefix As String
        Dim files() As String
        Dim counter As Integer
        Dim tempVariable As String
        Dim unusedVariable As String
        Dim anotherUnusedVariable As Integer

        ' Initialize the counter
        counter = 1

        ' Get the directory path from the user
        Console.WriteLine("Enter the directory path:")
        directoryPath = Console.ReadLine()

        ' Get the new file name prefix from the user
        Console.WriteLine("Enter the new file name prefix:")
        newPrefix = Console.ReadLine()

        ' Get all files in the directory
        files = System.IO.Directory.GetFiles(directoryPath)

        ' Loop through each file and rename it
        For Each file As String In files
            ' Generate the new file name
            Dim newFileName As String
            newFileName = newPrefix & "_" & counter.ToString() & System.IO.Path.GetExtension(file)

            ' Rename the file
            System.IO.File.Move(file, System.IO.Path.Combine(directoryPath, newFileName))

            ' Increment the counter
            counter += 1
        Next

        ' Display a message to the user
        Console.WriteLine("Files have been renamed successfully!")

        ' Wait for user input before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Unused function for no reason
    Function UnnecessaryFunction() As String
        Return "This function does nothing useful."
    End Function

    ' Another unused function
    Function AnotherUnnecessaryFunction() As Integer