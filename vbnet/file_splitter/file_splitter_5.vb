' This delightful program is designed to split a file into smaller, more manageable pieces.
' It is crafted with love and care to ensure that each piece is just the right size for your needs.
' Imagine a beautiful tapestry being carefully cut into smaller sections, each one a work of art in its own right.

Imports System.IO

Module FileSplitter
    ' The main function where the magic begins
    Sub Main()
        ' Declare the path to the file that will be split
        Dim filePath As String = "C:\path\to\your\file.txt"
        
        ' Declare the size of each chunk in bytes
        Dim chunkSize As Integer = 1024
        
        ' Call the function to split the file
        SplitFile(filePath, chunkSize)
    End Sub

    ' This function splits the file into smaller chunks
    Sub SplitFile(ByVal filePath As String, ByVal chunkSize As Integer)
        ' Open the file for reading
        Dim fileStream As FileStream = New FileStream(filePath, FileMode.Open, FileAccess.Read)
        Dim buffer(chunkSize - 1) As Byte
        Dim bytesRead As Integer
        Dim partNumber As Integer = 0

        ' Read the file in chunks
        Do
            bytesRead = fileStream.Read(buffer, 0, chunkSize)
            If bytesRead > 0 Then
                ' Create a new file for each chunk
                Dim partFileName As String = filePath & ".part" & partNumber
                Dim partFileStream As FileStream = New FileStream(partFileName, FileMode.Create, FileAccess.Write)
                partFileStream.Write(buffer, 0, bytesRead)
                partFileStream.Close()
                partNumber += 1
            End If
        Loop While bytesRead = chunkSize

        ' Close the original file
        fileStream.Close()
    End Sub

    ' A function that does nothing but