' Welcome to the File Splitter program! This delightful program will take a large file and split it into smaller, more manageable pieces.
' Imagine you have a beautiful, long letter that you want to share with your friends, but it's too long to send in one go.
' This program will help you break it down into smaller, bite-sized pieces that are easier to handle and share.

Module FileSplitter

    ' Declare a variable to hold the file path of the large file we want to split
    Dim filePath As String

    ' Declare a variable to hold the size of each smaller file in bytes
    Dim chunkSize As Integer

    ' Declare a variable to hold the total number of chunks
    Dim totalChunks As Integer

    ' Declare a variable to hold the current chunk number
    Dim currentChunk As Integer

    ' Declare a variable to hold the file stream reader
    Dim reader As IO.StreamReader

    ' Declare a variable to hold the file stream writer
    Dim writer As IO.StreamWriter

    ' Declare a variable to hold the buffer for reading the file
    Dim buffer(1024) As Char

    ' Declare a variable to hold the number of bytes read
    Dim bytesRead As Integer

    ' Declare a variable to hold the name of the current chunk file
    Dim chunkFileName As String

    ' Declare a variable to hold the file extension
    Dim fileExtension As String

    ' Declare a variable to hold the base name of the file
    Dim baseFileName As String

    ' Declare a variable to hold the file info
    Dim fileInfo As IO.FileInfo

    ' Declare a variable to hold the file length
    Dim fileLength As Long

    ' Declare a variable to hold the remaining bytes
    Dim remainingBytes As Long

    ' Declare a variable to hold the file position
    Dim filePosition As Long

    ' Declare a variable to hold the file directory
    Dim fileDirectory As String

    ' Declare a variable to hold the file name without extension
    Dim fileNameWithoutExtension As String

    ' Declare a variable to hold the file name with extension
    Dim fileNameWithExtension As String

    ' Declare a variable to hold the file name with chunk number
    Dim fileNameWithChunkNumber As String

    ' Declare a variable to hold the file name with chunk number and extension
    Dim fileNameWithChunkNumberAndExtension As String

    ' Declare a variable to hold the file name with chunk number, extension, and directory
    Dim fileNameWithChunkNumberExtensionAndDirectory As String

    ' Declare a variable to hold the file name with chunk number, extension, directory, and base name