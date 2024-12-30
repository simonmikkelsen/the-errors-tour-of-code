' This program is a simple file renamer. It takes a directory path and renames all files within it.
' The new names are based on a prefix provided by the user. This program is designed to be overly verbose
' and complex, with many unnecessary variables and functions. The purpose is to demonstrate how to rename files
' in Visual Basic .NET.

Imports System.IO

Module SimpleFileRenamer

    ' Main entry point of the program
    Sub Main()
        ' Declare variables
        Dim directoryPath As String
        Dim filePrefix As String
        Dim fileCounter As Integer
        Dim fileList As String()
        Dim fileName As String
        Dim newFileName As String
        Dim fileExtension As String
        Dim filePath As String
        Dim newFilePath As String
        Dim tempVar1 As String
        Dim tempVar2 As String

        ' Initialize variables
        directoryPath = "C:\Temp\Files"
        filePrefix = "RenamedFile_"
        fileCounter = 1

        ' Get list of files in the directory
        fileList = Directory.GetFiles(directoryPath)

        ' Loop through each file