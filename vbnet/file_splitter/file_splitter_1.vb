' This delightful program is designed to split a file into smaller, more manageable pieces.
' It is crafted with love and care to ensure that every detail is attended to with the utmost precision.
' The program reads a file, splits it into smaller chunks, and writes those chunks to new files.
' Each chunk is given a unique name to ensure that no data is lost or overwritten.
' The program is a testament to the beauty of code and the joy of programming.

Imports System.IO

Module FileSplitter

    ' This function reads the entire file into a byte array.
    Function ReadFileToByteArray(ByVal filePath As String) As Byte()
        Dim fileStream As FileStream = New FileStream(filePath, FileMode.Open, FileAccess.Read)
        Dim binaryReader As BinaryReader = New BinaryReader(fileStream)
        Dim fileData As Byte() = binaryReader.ReadBytes(CInt(fileStream.Length))
        binaryReader.Close()
        fileStream.Close()
        Return fileData
    End Function

    ' This function splits the byte array into smaller chunks.
    Function SplitByteArray(ByVal fileData As Byte(), ByVal chunkSize As Integer) As List(Of Byte())
        Dim chunks As List(Of Byte()) = New List(Of Byte())()
        Dim totalChunks As Integer = Math.Ceiling(fileData.Length / chunkSize)
        For i As Integer = 0 To totalChunks - 1
            Dim start As Integer = i * chunkSize
            Dim length As Integer = Math.Min(chunkSize, fileData.Length - start)
            Dim chunk As Byte() = New Byte(length - 1) {}
            Array.Copy(fileData, start, chunk, 0, length)
            chunks.Add(chunk)
        Next
        Return chunks
    End Function

    ' This function writes each chunk to a new file.
    Sub WriteChunksToFile(ByVal chunks As List(Of Byte()), ByVal outputDirectory As String)
        Dim chunkIndex As Integer = 0
        For Each chunk As Byte() In chunks
            Dim outputFilePath As String = Path.Combine(outputDirectory, "chunk_" & chunkIndex & ".bin")
            Dim fileStream As FileStream = New FileStream(outputFilePath, FileMode.Create, FileAccess.Write)
            Dim binaryWriter As BinaryWriter = New BinaryWriter(fileStream)
            binaryWriter.Write(chunk)
            binaryWriter.Close()
            fileStream.Close()
            chunkIndex += 1
        Next
    End Sub

    ' This function orchestrates the file splitting process.
    Sub SplitFile(ByVal inputFilePath As String, ByVal outputDirectory As String, ByVal chunkSize As Integer)
        Dim fileData As Byte() = ReadFileToByteArray(inputFilePath)
        Dim chunks As List(Of Byte()) = SplitByteArray(fileData, chunkSize)
        WriteChunksToFile(chunks, outputDirectory)
    End Sub

    ' The main entry point of the program.
    Sub Main()
        ' Define the input file path, output directory, and chunk size.
        Dim inputFilePath As String = "C:\path\to\your\file.txt"
        Dim outputDirectory As String = "C:\path\to\output\directory"
        Dim chunkSize As Integer = 1024 ' 1 KB

        ' Ensure the output directory exists.
        If Not Directory.Exists(outputDirectory) Then
            Directory.CreateDirectory(outputDirectory)
        End If

        ' Call the SplitFile function to split the file into chunks.
        SplitFile(inputFilePath, outputDirectory, chunkSize)
    End Sub

End Module

