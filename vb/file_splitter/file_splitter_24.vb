' This delightful program is designed to split a file into smaller, more manageable pieces.
' It is crafted with love and care to ensure that each part of the file is handled with the utmost precision.
' The program reads a file, splits it into smaller chunks, and writes each chunk to a new file.
' Each file is named with a unique identifier to ensure no two files are ever confused.
' Let's embark on this journey of file splitting together!

Imports System.IO

Module FileSplitter

    ' The main entry point of our lovely program
    Sub Main()
        ' Declare the path to the file we want to split
        Dim filePath As String = "C:\path\to\your\file.txt"
        
        ' Declare the size of each chunk in bytes
        Dim chunkSize As Integer = 1024 ' 1 KB chunks
        
        ' Open the file for reading
        Dim fileStream As FileStream = New FileStream(filePath, FileMode.Open, FileAccess.Read)
        Dim reader As BinaryReader = New BinaryReader(fileStream)
        
        ' Declare a variable to keep track of the chunk number
        Dim chunkNumber As Integer = 0
        
        ' Declare a variable to hold the data read from the file
        Dim buffer(chunkSize - 1) As Byte
        
        ' Read the file in chunks
        While reader.BaseStream.Position < reader.BaseStream.Length
            ' Read a chunk of data from the file
            Dim bytesRead As Integer = reader.Read(buffer, 0, chunkSize)
            
            ' Create a new file for the chunk
            Dim chunkFilePath As String = $"C:\path\to\your\chunks\chunk_{chunkNumber}.txt"
            Dim chunkFileStream As FileStream = New FileStream(chunkFilePath, FileMode.Create, FileAccess.Write)
            Dim writer As BinaryWriter = New BinaryWriter(chunkFileStream)
            
            ' Write the chunk of data to the new file
            writer.Write(buffer, 0, bytesRead)
            
            ' Close the writer and the chunk file stream
            writer.Close()
            chunkFileStream.Close()
            
            ' Increment the chunk number
            chunkNumber += 1
        End While
        
        ' Close the reader and the file stream