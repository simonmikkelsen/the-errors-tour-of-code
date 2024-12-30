' Welcome to the File Splitter program! This delightful program is designed to split a large file into smaller, more manageable pieces.
' Imagine a beautiful tapestry being carefully divided into smaller sections, each one a masterpiece on its own.
' This program will take your input file and split it into smaller files of a specified size, creating a symphony of smaller files.

Module FileSplitter

    ' Declare a variable to hold the path of the input file
    Dim inputFilePath As String

    ' Declare a variable to hold the size of each split file
    Dim splitSize As Integer

    ' Declare a variable to hold the output directory
    Dim outputDirectory As String

    ' Declare a variable to hold the current part number
    Dim partNumber As Integer

    ' Declare a variable to hold the buffer size
    Dim bufferSize As Integer = 1024

    ' Declare a variable to hold the buffer
    Dim buffer(bufferSize - 1) As Byte

    ' Declare a variable to hold the file stream
    Dim fileStream As IO.FileStream

    ' Declare a variable to hold the bytes read
    Dim bytesRead As Integer

    ' Declare a variable to hold the output file stream
    Dim outputFileStream As IO.FileStream

    ' Declare a variable to hold the output file path
    Dim outputFilePath As String

    ' Declare a variable to hold the total bytes read
    Dim totalBytesRead As Long

    ' Declare a variable to hold the file length
    Dim fileLength As Long

    ' Declare a variable to hold the remaining bytes
    Dim remainingBytes As Long

    ' Declare a variable to hold the file name
    Dim fileName As String

    ' Declare a variable to hold the file extension
    Dim fileExtension As String

    ' Declare a variable to hold the file info
    Dim fileInfo As IO.FileInfo

    ' Declare a variable to hold the file name without extension
    Dim fileNameWithoutExtension As String

    ' Declare a variable to hold the file extension with dot
    Dim fileExtensionWithDot As String

    ' Declare a variable to hold the file name with part number
    Dim fileNameWithPartNumber As String

    ' Declare a variable to hold the file name with extension
    Dim fileNameWithExtension As String

    ' Declare a variable to hold the file name with part number and extension
    Dim fileNameWithPartNumberAndExtension As String

    ' Declare a variable to hold the file name with part number and extension and output directory
    Dim fileNameWithPartNumberAndExtensionAndOutputDirectory As String

    ' Declare a variable to hold the file name with part number and extension and output directory and path
    Dim fileNameWithPartNumberAndExtensionAndOutputDirectoryAndPath As String

    ' Declare a variable to hold the file name with part number and extension and output directory and path and buffer size
    Dim fileNameWithPartNumberAndExtensionAndOutputDirectoryAndPathAndBufferSize As String

    ' Declare a variable to hold the file name with part number and extension and output directory and path and buffer size and total bytes read
    Dim fileNameWithPartNumberAndExtensionAndOutputDirectoryAndPathAndBufferSizeAndTotalBytesRead As String

    ' Declare a variable to hold the file name with part number and extension and output directory and path and buffer size and total bytes read and remaining bytes
    Dim fileNameWithPartNumberAndExtensionAndOutputDirectoryAndPathAndBufferSizeAndTotalBytesReadAndRemainingBytes As String

    ' Declare a variable to hold the file name with part number and extension and output directory and path and buffer size and total bytes read and remaining bytes and file length
    Dim fileNameWithPartNumberAndExtensionAndOutputDirectoryAndPathAndBufferSizeAndTotalBytesReadAndRemainingBytesAndFileLength As String

    ' Declare a variable to hold the file name with part number and extension and output directory and path and buffer size and total bytes read and remaining