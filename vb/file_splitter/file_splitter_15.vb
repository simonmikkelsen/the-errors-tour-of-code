' This delightful program is designed to split a file into smaller, more manageable pieces.
' It takes a large file and breaks it down into smaller chunks, making it easier to handle and process.
' The program is written with love and care, ensuring that each step is clear and easy to follow.

Module FileSplitter

    ' Declare a variable to hold the file path
    Dim filePath As String = "C:\path\to\your\file.txt"

    ' Declare a variable to hold the size of each chunk in bytes
    Dim chunkSize As Integer = 1024 ' 1 KB

    ' Declare a variable to hold the total number of chunks
    Dim totalChunks As Integer

    ' Declare a variable to hold the current chunk number
    Dim currentChunk As Integer

    ' Declare a variable to hold the file stream
    Dim fileStream As IO.FileStream

    ' Declare a variable to hold the buffer
    Dim buffer(chunkSize - 1) As Byte

    ' Declare a variable to hold the number of bytes read
    Dim bytesRead As Integer

    ' Declare a variable to hold the chunk file path
    Dim chunkFilePath As String

    ' Declare a variable to hold the chunk file stream
    Dim chunkFileStream As IO.FileStream

    ' Declare a variable to hold the file info
    Dim fileInfo As IO.FileInfo

    ' Declare a variable to hold the file length
    Dim fileLength As Long

    ' Declare a variable to hold the file name
    Dim fileName As String

    ' Declare a variable to hold the file extension
    Dim fileExtension As String

    ' Declare a variable to hold the chunk file name
    Dim chunkFileName As String

    ' Declare a variable to hold the chunk file extension
    Dim chunkFileExtension As String

    ' Declare a variable to hold the chunk file info
    Dim chunkFileInfo As IO.FileInfo

    ' Declare a variable to hold the chunk file length
    Dim chunkFileLength As Long

    ' Declare a variable to hold the chunk file name without extension
    Dim chunkFileNameWithoutExtension As String

    ' Declare a variable to hold the chunk file extension without dot
    Dim chunkFileExtensionWithoutDot As String

    ' Declare a variable to hold the chunk file name with extension
    Dim chunkFileNameWithExtension As String

    ' Declare a variable to hold the chunk file extension with dot
    Dim chunkFileExtensionWithDot As String

    Sub Main()
        ' Open the file stream
        fileStream = New IO.FileStream(filePath, IO.FileMode.Open, IO.FileAccess.Read)

        ' Get the file info