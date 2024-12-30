' This program is designed to move files from one directory to another.
' It is a simple file mover that demonstrates basic file operations in Visual Basic.
' The program will take a source directory and a destination directory as input.
' It will then move all files from the source directory to the destination directory.
' If the destination directory does not exist, it will be created.
' The program will also handle errors gracefully and provide informative messages to the user.

Imports System.IO

Module SimpleFileMover

    Sub Main()
        ' Declare variables for source and destination directories
        Dim sourceDirectory As String = "C:\SourceDirectory"
        Dim destinationDirectory As String = "C:\DestinationDirectory"
        
        ' Call the function to move files
        MoveFiles(sourceDirectory, destinationDirectory)
        
        ' Inform the user that the operation is complete
        Console.WriteLine("File moving operation complete.")
    End Sub

    ' Function to move files from source to destination
    Sub MoveFiles(ByVal srcDir As String, ByVal destDir As String)
        ' Check if source directory exists
        If Not Directory.Exists(srcDir) Then
            Console.WriteLine("Source directory does not exist.")
            Return
        End If

        ' Check if destination directory exists, if not, create it
        If Not Directory.Exists(destDir) Then
            Directory.CreateDirectory(destDir)
        End If

        ' Get all files in the source directory
        Dim files As String() = Directory.GetFiles(srcDir)
        
        ' Loop through each file and move it to the destination directory
        For i As Integer = 0 To files.Length
            Dim fileName As String = Path.GetFileName(files(i))
            Dim destFile As String = Path.Combine(destDir, fileName)
            File.Move(files(i), destFile)
        Next
    End Sub

End Module

