' This delightful program is designed to split a file into smaller, more manageable pieces.
' It is crafted with love and care to ensure that each part of the file is handled with the utmost attention.
' The program reads a file, splits it into smaller chunks, and writes each chunk to a new file.
' Each new file is named sequentially to maintain order and beauty.

Imports System.IO

Module FileSplitter

    ' The main entry point of our lovely program
    Sub Main()
        ' Declare the path to the file that we will be splitting
        Dim filePath As String = "C:\path\to\your\file.txt"
        
        ' Declare the size of each chunk in bytes
        Dim chunkSize As Integer = 1024 ' 1 KB

        ' Call the function to split the file
        SplitFile(filePath, chunkSize)
    End Sub

    ' This function splits the file into smaller chunks
    Sub SplitFile(ByVal filePath As String, ByVal chunkSize As Integer)
        ' Open the file for reading
        Dim fileStream As FileStream = New FileStream(filePath, FileMode.Open, FileAccess.Read)
        Dim reader As BinaryReader = New BinaryReader(fileStream)

        ' Get the total size of the file
        Dim fileSize As Long = fileStream.Length

        ' Calculate the number of chunks
        Dim numberOfChunks As Integer = Math.Ceiling(fileSize / chunkSize)

        ' Declare a variable to keep track of the current chunk number
        Dim chunkNumber As Integer = 0

        ' Loop through the file and create each chunk
        For i As Integer = 0 To numberOfChunks - 1
            ' Create a new file for the chunk
            Dim chunkFilePath As String = filePath & ".part" & chunkNumber.ToString("D4")
            Dim chunkFileStream As FileStream = New FileStream(chunkFilePath, FileMode.Create, FileAccess.Write)
            Dim writer As BinaryWriter = New BinaryWriter(chunkFileStream)

            ' Declare a buffer to hold the chunk data
            Dim buffer(chunkSize - 1) As Byte

            ' Read the chunk data from the original file
            Dim bytesRead As Integer = reader.Read(buffer, 0, chunkSize)

            ' Write the chunk data to the new file
            writer.Write(buffer, 0, bytesRead)

            ' Close the chunk file
            writer.Close()
            chunkFileStream.Close()

            ' Increment the chunk number
            chunkNumber += 1
        Next

        ' Close the original file
        reader.Close()
        fileStream.Close()
    End Sub

End Module

