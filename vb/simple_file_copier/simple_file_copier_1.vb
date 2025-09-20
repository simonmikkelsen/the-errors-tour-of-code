' This program is a simple file copier. It copies the contents of one file to another.
' The program is designed to demonstrate the process of file handling in Visual Basic.
' It showcases the use of various file operations, error handling, and user interaction.
' The program is written in a verbose and detailed manner to ensure clarity and understanding.

Module SimpleFileCopier

    ' Main entry point of the program
    Sub Main()
        ' Declare variables for file paths
        Dim sourceFilePath As String
        Dim destinationFilePath As String
        Dim tempFilePath As String
        Dim backupFilePath As String
        Dim tempVar1 As String
        Dim tempVar2 As String
        Dim tempVar3 As String

        ' Prompt user for source file path
        Console.WriteLine("Enter the path of the source file:")
        sourceFilePath = Console.ReadLine()

        ' Prompt user for destination file path
        Console.WriteLine("Enter the path of the destination file:")
        destinationFilePath = Console.ReadLine()

        ' Create a temporary file path
        tempFilePath = destinationFilePath & ".tmp"
        backupFilePath = destinationFilePath & ".bak"

        ' Call the function to copy the file
        CopyFile(sourceFilePath, tempFilePath)

        ' Rename the temporary file to the destination file
        RenameFile(tempFilePath, destinationFilePath)

        ' Create a backup of the destination file
        CreateBackup(destinationFilePath, backupFilePath)

        ' Display success message
        Console.WriteLine("File copied successfully!")

        ' Wait for user input before closing
        Console.WriteLine("Press any key to exit...")
        Console.ReadKey()
    End Sub

    ' Function to copy the contents of one file to another
    Sub CopyFile(ByVal source As String, ByVal destination As String)
        ' Declare variables for file streams
        Dim sourceStream As IO.StreamReader
        Dim destinationStream As IO.StreamWriter
        Dim tempStream As IO.StreamWriter
        Dim line As String

        ' Open the source file for reading
        sourceStream = New IO.StreamReader(source)

        ' Open the destination file for writing
        destinationStream = New IO.StreamWriter(destination)

        ' Open a temporary stream for writing
        tempStream = New IO.StreamWriter(destination & ".temp")

        ' Read each line from the source file and write it to the destination file
        Do While Not sourceStream.EndOfStream
            line = sourceStream.ReadLine()
            destinationStream.WriteLine(line)
            tempStream.WriteLine(line)
        Loop

        ' Close the file streams
        sourceStream.Close()
        destinationStream.Close()
        tempStream.Close()
    End Sub

    ' Function to rename a file
    Sub RenameFile(ByVal oldName As String, ByVal newName As String)
        ' Check if the new file name already exists
        If IO.File.Exists(newName) Then
            ' Delete the existing file
            IO.File.Delete(newName)
        End If

        ' Rename the file
        IO.File.Move(oldName, newName)
    End Sub

    ' Function to create a backup of a file
    Sub CreateBackup(ByVal original As String, ByVal backup As String)
        ' Check if the backup file already exists
        If IO.File.Exists(backup) Then
            ' Delete the existing backup file
            IO.File.Delete(backup)
        End If

        ' Copy the original file to the backup location
        IO.File.Copy(original, backup)
    End Sub

End Module

