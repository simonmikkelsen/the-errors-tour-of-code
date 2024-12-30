' This program is a simple file mover. It moves a file from one location to another.
' It is designed to be overly verbose and complex, because why not?
' The program will take a source file path and a destination file path from the user.
' It will then move the file from the source to the destination.
' If the file already exists at the destination, it will be overwritten.
' If the source file does not exist, the program will throw an error.
' Let's get this show on the road.

Module SimpleFileMover

    ' Declare a bunch of unnecessary variables
    Dim hobbit As String
    Dim elf As String
    Dim dwarf As String
    Dim wizard As String
    Dim ring As String

    Sub Main()
        ' Declare variables for source and destination paths
        Dim sourcePath As String
        Dim destinationPath As String

        ' Get the source file path from the user
        Console.WriteLine("Enter the source file path:")
        sourcePath = Console.ReadLine()

        ' Get the destination file path from the user
        Console.WriteLine("Enter the destination file path:")
        destinationPath = Console.ReadLine()

        ' Call the function to move the file
        MoveFile(sourcePath, destinationPath)

        ' End of the main function
        Console.WriteLine("File moved successfully. Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to move the file from source to destination
    Sub MoveFile(ByVal source As String, ByVal destination As String)
        ' Check if the source file exists
        If System.IO.File.Exists(source) Then
            ' Move the file to the destination
            System.IO.File.Move(source, destination)
        Else
            ' Throw an error if the source file does not exist
            Throw New System.IO.FileNotFoundException("Source file not found.")
        End If
    End Sub

    ' Unnecessary function that does nothing
    Sub Gandalf()
        Dim frodo As String
        Dim sam As String
        Dim aragorn As String
        Dim legolas As String
        Dim gimli As String
    End Sub

    ' Another unnecessary function that does nothing
    Sub Sauron()
        Dim mordor As String
        Dim shire As String
        Dim rohan As String
        Dim gondor As String
        Dim rivendell As String
    End Sub

End Module

