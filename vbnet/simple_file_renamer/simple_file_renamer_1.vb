' This program is a simple file renamer.
' It renames files in a specified directory to a new name with a specified prefix.
' The program demonstrates the use of various VB.NET features.
' It is designed to be overly verbose and complex for educational purposes.

Imports System.IO

Module SimpleFileRenamer

    ' Main entry point of the program
    Sub Main()
        ' Declare and initialize variables
        Dim directoryPath As String = "C:\Temp"
        Dim newPrefix As String = "RenamedFile_"
        Dim fileCounter As Integer = 0
        Dim fileList As List(Of String) = New List(Of String)
        Dim fileName As String = ""
        Dim newFileName As String = ""
        Dim fileInfo As FileInfo
        Dim fileIndex As Integer = 0
        Dim fileCount As Integer = 0
        Dim filePath As String = ""
        Dim fileExtension As String = ""
        Dim fileRenamed As Boolean = False
        Dim fileRenamedCount As Integer = 0
        Dim fileRenamedList As List(Of String) = New List(Of String)
        Dim fileRenamedName As String = ""
        Dim fileRenamedPath As String = ""
        Dim fileRenamedExtension As String = ""
        Dim fileRenamedInfo As FileInfo

        ' Get the list of files in the specified directory
        fileList = GetFileList(directoryPath)

        ' Get the count of files in the list
        fileCount = fileList.Count

        ' Loop through each file in the list
        For fileIndex = 0 To fileCount - 1
            ' Get the file path
            filePath = fileList(fileIndex)

            ' Get the file info
            fileInfo = New FileInfo(filePath)

            ' Get the file name
            fileName = fileInfo.Name

            ' Get the file extension
            fileExtension = fileInfo.Extension

            ' Generate the new file name
            newFileName = GenerateNewFileName(newPrefix, fileCounter, fileExtension)

            ' Rename the file
            fileRenamed = RenameFile(filePath, newFileName)

            ' Check if the file was renamed successfully
            If fileRenamed Then
                ' Increment the file counter
                fileCounter += 1

                ' Add the renamed file to the list