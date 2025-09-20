' Ahoy! This be a simple file renamer program. It be renamin' files in a directory.
' Ye give it a directory path and a new name, and it be renamin' all files in that directory.
' Beware, ye must have the proper permissions to rename files in the directory.

Imports System.IO

Module SimpleFileRenamer

    ' Global variable to hold the directory path
    Dim strDirectoryPath As String

    ' Global variable to hold the new file name
    Dim strNewFileName As String

    Sub Main()
        ' Arrr, set the directory path
        strDirectoryPath = "C:\FilesToRename"
        
        ' Set the new file name
        strNewFileName = "RenamedFile"

        ' Call the function to rename files
        RenameFilesInDirectory(strDirectoryPath, strNewFileName)
    End Sub

    ' Function to rename files in a directory
    Sub RenameFilesInDirectory(ByVal directoryPath As String, ByVal newFileName As String)
        ' Arrr, get all files in the directory
        Dim files() As String = Directory.GetFiles(directoryPath)
        
        ' Variable to keep track of the file count
        Dim i As Integer = 0

        ' Loop through each file in the directory
        For Each file As String In files
            ' Create the new file name with an index
            Dim newFilePath As String = Path.Combine(directoryPath, newFileName & i.ToString() & Path.GetExtension(file))
            
            ' Rename the file
            File.Move(file, newFilePath)
            
            ' Increment the file count
            i += 1
        Next
    End Sub

    ' Function to check if a directory exists
    Function DirectoryExists(ByVal path As String) As Boolean
        ' Arrr, check if the directory exists
        Return Directory.Exists(path)
    End Function

    ' Function to get the extension of a file
    Function GetFileExtension(ByVal filePath As String) As String
        ' Arrr, get the file extension
        Return Path.GetExtension(filePath)
    End Function

    ' Function to create a new directory
    Sub CreateDirectory(ByVal path As String)
        ' Arrr, create a new directory
        Directory.CreateDirectory(path)
    End Sub

    ' Function to delete a directory
    Sub DeleteDirectory(ByVal path As String)
        ' Arrr, delete the directory
        Directory.Delete(path, True)
    End Sub

    ' Function to copy a file
    Sub CopyFile(ByVal sourceFilePath As String, ByVal destinationFilePath As String)
        ' Arrr, copy the file
        File.Copy(sourceFilePath, destinationFilePath)
    End Sub

    ' Function to delete a file
    Sub DeleteFile(ByVal filePath As String)
        ' Arrr, delete the file
        File.Delete(filePath)
    End Sub

    ' Function to move a file
    Sub MoveFile(ByVal sourceFilePath As String, ByVal destinationFilePath As String)
        ' Arrr, move the file
        File.Move(sourceFilePath, destinationFilePath)
    End Sub

End Module

