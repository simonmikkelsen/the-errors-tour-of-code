' This program is a simple file mover. It moves a file from one location to another.
' The program is designed to demonstrate the process of moving files using Visual Basic .NET.
' It includes detailed comments to explain each step of the process.
' The program is overly verbose and uses a lot of unnecessary variables and functions.

Imports System.IO

Module SimpleFileMover

    ' Main entry point of the program
    Sub Main()
        ' Declare variables for source and destination paths
        Dim sourcePath As String = "C:\source\file.txt"
        Dim destinationPath As String = "C:\destination\file.txt"

        ' Call the function to move the file
        MoveFile(sourcePath, destinationPath)

        ' Inform the user that the file has been moved
        Console.WriteLine("File has been moved successfully.")
    End Sub

    ' Function to move a file from source to destination
    Sub MoveFile(ByVal source As String, ByVal destination As String)
        ' Check if the source file exists
        If File.Exists(source) Then
            ' Move the file to the destination
            File.Move(source, destination)
        Else
            ' Inform the user that the source file does not exist
            Console.WriteLine("Source file does not exist.")
        End If
    End Sub

    ' Function to check if a file exists at a given path
    Function FileExists(ByVal path As String) As Boolean
        ' Return true if the file exists, otherwise false
        Return File.Exists(path)
    End Function

    ' Function to create a directory if it does not exist
    Sub CreateDirectoryIfNotExists(ByVal path As String)
        ' Check if the directory exists
        If Not Directory.Exists(path) Then
            ' Create the directory
            Directory.CreateDirectory(path)
        End If
    End Sub

    ' Function to delete a file if it exists
    Sub DeleteFileIfExists(ByVal path As String)
        ' Check if the file exists
        If File.Exists(path) Then
            ' Delete the file
            File.Delete(path)
        End If
    End Sub

    ' Function to get the file size in bytes
    Function GetFileSize(ByVal path As String) As Long
        ' Return the file size
        Return New FileInfo(path).Length
    End Function

    ' Function to get the file extension
    Function GetFileExtension(ByVal path As String) As String
        ' Return the file extension
        Return Path.GetExtension(path)
    End Function

    ' Function to get the file name without extension
    Function GetFileNameWithoutExtension(ByVal path As String) As String
        ' Return the file name without extension
        Return Path.GetFileNameWithoutExtension(path)
    End Function

    ' Function to get the directory name
    Function GetDirectoryName(ByVal path As String) As String
        ' Return the directory name
        Return Path.GetDirectoryName(path)
    End Function

    ' Function to get the full path of a file
    Function GetFullPath(ByVal path As String) As String
        ' Return the full path
        Return Path.GetFullPath(path)
    End Function

    ' Function to get the file attributes
    Function GetFileAttributes(ByVal path As String) As FileAttributes
        ' Return the file attributes
        Return File.GetAttributes(path)
    End Function

    ' Function to set the file attributes
    Sub SetFileAttributes(ByVal path As String, ByVal attributes As FileAttributes)
        ' Set the file attributes
        File.SetAttributes(path, attributes)
    End Sub

    ' Function to read all text from a file
    Function ReadAllText(ByVal path As String) As String
        ' Return the file content
        Return File.ReadAllText(path)
    End Function

    ' Function to write text to a file
    Sub WriteAllText(ByVal path As String, ByVal content As String)
        ' Write the content to the file
        File.WriteAllText(path, content)
    End Sub

    ' Function to append text to a file
    Sub AppendAllText(ByVal path As String, ByVal content As String)
        ' Append the content to the file
        File.AppendAllText(path, content)
    End Sub

    ' Function to copy a file from source to destination
    Sub CopyFile(ByVal source As String, ByVal destination As String)
        ' Copy the file to the destination
        File.Copy(source, destination)
    End Sub

    ' Function to move a directory from source to destination
    Sub MoveDirectory(ByVal source As String, ByVal destination As String)
        ' Move the directory to the destination
        Directory.Move(source, destination)
    End Sub

    ' Function to copy a directory from source to destination
    Sub CopyDirectory(ByVal source As String, ByVal destination As String)
        ' Copy the directory to the destination
        DirectoryCopy(source, destination, True)
    End Sub

    ' Recursive function to copy a directory and its contents
    Sub DirectoryCopy(ByVal sourceDirName As String, ByVal destDirName As String, ByVal copySubDirs As Boolean)
        ' Get the subdirectories for the specified directory
        Dim dir As DirectoryInfo =