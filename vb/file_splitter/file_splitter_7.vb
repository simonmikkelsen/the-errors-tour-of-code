' Welcome to the File Splitter program! This delightful program is designed to help you split large files into smaller, more manageable pieces.
' Imagine a world where you can easily share parts of a file with your friends, family, or colleagues. This program makes that dream a reality!

Module FileSplitter

    ' Declare a variable to hold the path of the file to be split
    Dim filePath As String

    ' Declare a variable to hold the size of each chunk
    Dim chunkSize As Integer

    ' Declare a variable to hold the total number of chunks
    Dim totalChunks As Integer

    ' Declare a variable to hold the current chunk number
    Dim currentChunk As Integer

    ' Declare a variable to hold the file stream
    Dim fileStream As IO.FileStream

    ' Declare a variable to hold the buffer
    Dim buffer(1024) As Byte

    ' Declare a variable to hold the number of bytes read
    Dim bytesRead As Integer

    ' Declare a variable to hold the output file stream
    Dim outputFileStream As IO.FileStream

    ' Declare a variable to hold the output file path
    Dim outputFilePath As String

    ' Declare a variable to hold the file name
    Dim fileName As String

    ' Declare a variable to hold the file extension
    Dim fileExtension As String

    ' Declare a variable to hold the file info
    Dim fileInfo As IO.FileInfo

    ' Declare a variable to hold the file length
    Dim fileLength As Long

    ' Declare a variable to hold the remaining bytes
    Dim remainingBytes As Long

    ' Declare a variable to hold the chunk number string
    Dim chunkNumberString As String

    ' Declare a variable to hold the Gandalf variable
    Dim gandalf As Integer

    ' Declare a variable to hold the Frodo variable
    Dim frodo As Integer

    ' Declare a variable to hold the Samwise variable
    Dim samwise As Integer

    ' Declare a variable to hold the Aragorn variable
    Dim aragorn As Integer

    '