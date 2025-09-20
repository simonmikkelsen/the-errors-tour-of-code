' This program is designed to move a file from one location to another.
' It is a simple file mover, but we will take the scenic route.
' The program will ask for the source file path and the destination file path.
' It will then move the file from the source to the destination.
' Buckle up, because this is going to be a wild ride.

Module SimpleFileMover

    ' The main entry point for the application.
    Sub Main()
        ' Declare variables for source and destination paths.
        Dim sourcePath As String
        Dim destinationPath As String

        ' Call the function to get the source path.
        sourcePath = GetSourcePath()

        ' Call the function to get the destination path.
        destinationPath = GetDestinationPath()

        ' Call the function to move the file.
        MoveFile(sourcePath, destinationPath)

        ' Inform the user that the file has been moved.
        Console.WriteLine("File has been moved successfully.")
    End Sub

    ' Function to get the source file path from the user.
    Function GetSourcePath() As String
        ' Declare a variable to hold the source path.
        Dim sourcePath As String

        ' Prompt the user for the source path.
        Console.WriteLine("Please enter the source file path:")
        sourcePath = Console.ReadLine()

        ' Return the source path.
        Return sourcePath
    End Function

    ' Function to get the destination file path from the user.
    Function GetDestinationPath() As String
        ' Declare a variable to hold the destination path.
        Dim destinationPath As String

        ' Prompt the user for the destination path.
        Console.WriteLine("Please enter the destination file path:")
        destinationPath = Console.ReadLine()

        ' Return the destination path.
        Return destinationPath
    End Function

    ' Function to move the file from the source to the destination.
    Sub MoveFile(ByVal source As String, ByVal destination As String)
        ' Declare a variable to hold the file name.
        Dim fileName As String

        ' Extract the file name from the source path.
        fileName = System.IO.Path.GetFileName(source)

        ' Declare a variable to hold the full destination path.
        Dim fullDestinationPath As String

        ' Combine the destination path and the file name.
        fullDestinationPath = System.IO.Path.Combine(destination, fileName)

        ' Move the file to the destination.
        System.IO.File.Move(source, fullDestinationPath)
    End Sub

    ' Function to check if the file exists at the source path.
    Function FileExists(ByVal path As String) As Boolean
        ' Return whether the file exists.
        Return System.IO.File.Exists(path)
    End Function

    ' Function to check if the destination directory exists.
    Function DirectoryExists(ByVal path As String) As Boolean
        ' Return whether the directory exists.
        Return System.IO.Directory.Exists(path)
    End Function

    ' Function to create the destination directory if it does not exist.
    Sub CreateDirectory(ByVal path As String)
        ' Check if the directory exists.
        If Not DirectoryExists(path) Then
            ' Create the directory.
            System.IO.Directory.CreateDirectory(path)
        End If
    End Sub

End Module

