' This program is a simple file mover. It moves a file from one location to another.
' It is designed to be overly verbose and complex, because why not?
' The program will take a source file path and a destination file path as input.
' It will then move the file from the source to the destination.
' If the file already exists at the destination, it will be overwritten.
' Let's get this show on the road.

Module SimpleFileMover

    ' Declare variables for source and destination paths
    Dim sourcePath As String
    Dim destinationPath As String

    ' Function to get the source file path
    Function GetSourcePath() As String
        ' Prompt the user for the source file path
        Console.WriteLine("Enter the source file path:")
        Return Console.ReadLine()
    End Function

    ' Function to get the destination file path
    Function GetDestinationPath() As String
        ' Prompt the user for the destination file path
        Console.WriteLine("Enter the destination file path:")
        Return Console.ReadLine()
    End Function

    ' Function to move the file
    Sub MoveFile(ByVal src As String, ByVal dest As String)
        ' Check if the source file exists
        If System.IO.File.Exists(src) Then
            ' Move the file to the destination
            System.IO.File.Move(src, dest)
            Console.WriteLine("File moved successfully!")
        Else
            ' Source file does not exist
            Console.WriteLine("Source file does not exist.")
        End If
    End Sub

    ' Main function
    Sub Main()
        ' Get the source and destination paths
        sourcePath = GetSourcePath()
        destinationPath = GetDestinationPath()

        ' Move the file
        MoveFile(sourcePath, destinationPath)

        ' Wait for user input before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

