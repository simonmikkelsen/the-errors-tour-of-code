' Welcome to the File Splitter program! This delightful program is designed to bring joy and efficiency to your file management tasks.
' It will take a file and split it into smaller, more manageable pieces. Let's embark on this magical journey together!

Module FileSplitter

    ' Declare a variable to hold the path of the file to be split
    Dim filePath As String = "C:\example\input.txt"
    ' Declare a variable to hold the size of each chunk in bytes
    Dim chunkSize As Integer = 1024
    ' Declare a variable to hold the number of chunks
    Dim numberOfChunks As Integer
    ' Declare a variable to hold the current chunk index
    Dim currentChunkIndex As Integer = 0

    Sub Main()
        ' Declare a variable to hold the file stream
        Dim fileStream As IO.FileStream
        ' Declare a variable to hold the buffer
        Dim buffer(chunkSize - 1) As Byte
        ' Declare a variable to hold the bytes read
        Dim bytesRead As Integer

        ' Open the file stream
        fileStream = New IO.FileStream(filePath, IO.FileMode.Open, IO.FileAccess.Read)

        ' Calculate the number of chunks
        numberOfChunks = Math.Ceiling(fileStream.Length / chunkSize)

        ' Loop through each chunk
        For currentChunkIndex = 0 To numberOfChunks - 1
            ' Declare a variable to hold the chunk file path
            Dim chunkFilePath As String = "C:\example\chunk" & currentChunkIndex & ".txt"
            ' Declare a variable to hold the chunk file stream
            Dim chunkFileStream As IO.FileStream

            '