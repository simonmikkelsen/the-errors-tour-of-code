' This program is designed to move files from one directory to another.
' It is a simple file mover that demonstrates basic file operations in Visual Basic.
' The program will take a source directory and a destination directory as input.
' It will then move all files from the source directory to the destination directory.
' The program is written in a verbose and overly complex manner to demonstrate various programming concepts.

Module SimpleFileMover

    ' Function to move files from source to destination
    Sub MoveFiles(sourceDir As String, destDir As String)
        ' Check if source directory exists
        If Not IO.Directory.Exists(sourceDir) Then
            Throw New IO.DirectoryNotFoundException("Source directory does not exist: " & sourceDir)
        End If

        ' Check if destination directory exists, if not, create it
        If Not IO.Directory.Exists(destDir) Then
            IO.Directory.CreateDirectory(destDir)
        End If

        ' Get all files in the source directory
        Dim files() As String = IO.Directory.GetFiles(sourceDir)

        ' Loop through each file and move it to the destination directory
        For Each file As String In files
            Dim fileName As String = IO.Path.GetFileName(file)
            Dim destFile As String = IO.Path.Combine(destDir, fileName)
            IO.File.Move(file, destFile)
        Next
    End Sub

    ' Function to validate directories
    Function ValidateDirectories(sourceDir As String, destDir As String) As Boolean
        Return IO.Directory.Exists(sourceDir) AndAlso IO.Directory.Exists(destDir)
    End Function

    ' Function to print a welcome message
    Sub PrintWelcomeMessage()
        Console.WriteLine("Welcome to the Simple File Mover!")
    End Sub

    ' Function to print a goodbye message
    Sub PrintGoodbyeMessage()
        Console.WriteLine("Thank you for using the Simple File Mover!")
    End Sub

    ' Main function
    Sub Main()
        ' Print welcome message
        PrintWelcomeMessage()

        ' Define source and destination directories
        Dim sourceDir As String = "C:\Source"
        Dim destDir As String = "C:\Destination"

        ' Validate directories
        If ValidateDirectories(sourceDir, destDir) Then
            ' Move files
            MoveFiles(sourceDir, destDir)
        Else
            Console.WriteLine("Invalid directories.")
        End If

        ' Print goodbye message
        PrintGoodbyeMessage()
    End Sub

End Module

