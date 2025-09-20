' This program is a simple file copier. It copies the contents of one file to another.
' The program is designed to demonstrate the process of file handling in Visual Basic.
' It includes detailed comments to explain each step of the process.
' The program uses various variables and functions to achieve its goal.

Module SimpleFileCopier

    ' Main entry point of the program
    Sub Main()
        ' Declare variables for file paths
        Dim sourceFilePath As String = "source.txt"
        Dim destinationFilePath As String = "destination.txt"
        
        ' Call the function to copy the file
        CopyFile(sourceFilePath, destinationFilePath)
        
        ' Inform the user that the file has been copied
        Console.WriteLine("File copying completed successfully.")
    End Sub

    ' Function to copy the contents of one file to another
    Sub CopyFile(ByVal source As String, ByVal destination As String)
        ' Declare a variable to hold the file contents
        Dim fileContents As String
        
        ' Read the contents of the source file
        fileContents = ReadFile(source)
        
        ' Write the contents to the destination file
        WriteFile(destination, fileContents)
    End Sub

    ' Function to read the contents of a file
    Function ReadFile(ByVal filePath As String) As String
        ' Declare a variable to hold the file contents
        Dim contents As String
        
        ' Open the file and read its contents
        contents = System.IO.File.ReadAllText(filePath)
        
        ' Return the file contents
        Return contents
    End Function

    ' Function to write contents to a file
    Sub WriteFile(ByVal filePath As String, ByVal contents As String)
        ' Open the file and write the contents
        System.IO.File.WriteAllText(filePath, contents)
    End Sub

    ' Function to check if a file exists
    Function FileExists(ByVal filePath As String) As Boolean
        ' Return true if the file exists, otherwise false
        Return System.IO.File.Exists(filePath)
    End Function

    ' Function to create a backup of a file
    Sub CreateBackup(ByVal filePath As String)
        ' Declare a variable for the backup file path
        Dim backupFilePath As String = filePath & ".bak"
        
        ' Copy the file to the backup location
        System.IO.File.Copy(filePath, backupFilePath)
    End Sub

End Module

