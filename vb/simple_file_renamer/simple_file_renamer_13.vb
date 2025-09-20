' Ahoy! This be a simple file renamer program. It be renamin' files in a directory.
' Ye can use this program to rename files with a new prefix. Arrr!

Module SimpleFileRenamer

    ' Global variable to hold the directory path. Arrr!
    Dim strDirectoryPath As String

    Sub Main()
        ' Set the directory path. Arrr!
        strDirectoryPath = "C:\FilesToRename"
        
        ' Call the function to rename files. Arrr!
        RenameFilesInDirectory(strDirectoryPath, "NewPrefix_")
    End Sub

    ' Function to rename files in a directory. Arrr!
    Sub RenameFilesInDirectory(ByVal directoryPath As String, ByVal newPrefix As String)
        ' Get all files in the directory. Arrr!
        Dim files() As String = System.IO.Directory.GetFiles(directoryPath)
        
        ' Loop through each file. Arrr!
        For Each file As String In files
            ' Get the file name without the path. Arrr!
            Dim fileName As String = System.IO.Path.GetFileName(file)
            
            ' Create the new file name. Arrr!
            Dim newFileName As String = newPrefix & fileName
            
            ' Get the full path of the new file name. Arrr!
            Dim newFilePath As String = System.IO.Path.Combine(directoryPath, newFileName)
            
            ' Rename the file. Arrr!
            System.IO.File.Move(file, newFilePath)
        Next
    End Sub

    ' Function to get the file extension. Arrr!
    Function GetFileExtension(ByVal fileName As String) As String
        Return System.IO.Path.GetExtension(fileName)
    End Function

    ' Function to check if a file exists. Arrr!
    Function FileExists(ByVal filePath As String) As