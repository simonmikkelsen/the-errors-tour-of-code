' Ahoy, me hearties! This be a program to split files into smaller pieces.
' It be written in Visual Basic .NET, and it be a treasure trove of learning.
' Ye shall find it full of vibrant comments and whimsical variables.
' Set sail on this coding adventure and enjoy the journey!

Imports System.IO

Module FileSplitter

    ' Global variable to hold the file path, arrr!
    Dim strFilePath As String

    ' Function to split the file into smaller pieces, aye!
    Sub SplitFile(ByVal filePath As String, ByVal chunkSize As Integer)
        ' Set the global variable to the file path, matey!
        strFilePath = filePath

        ' Open the file for reading, lass!
        Using fs As New FileStream(filePath, FileMode.Open, FileAccess.Read)
            Dim buffer(chunkSize - 1) As Byte
            Dim bytesRead As Integer
            Dim partNumber As Integer = 0

            ' Read the file in chunks, arrr!
            Do
                bytesRead = fs.Read(buffer, 0, chunkSize)
                If bytesRead > 0 Then
                    ' Write each chunk to a new file, aye!
                    Dim partFileName As String = filePath & ".part" & partNumber
                    WriteChunk(partFileName, buffer, bytesRead)
                    partNumber += 1
                End If
            Loop While bytesRead > 0
        End Using
    End Sub

    ' Function to write a chunk to a new file, matey!
    Sub WriteChunk(ByVal partFileName As String, ByVal buffer() As Byte, ByVal bytesRead As Integer)
        ' Open the new file for writing, lass!
        Using fs As New FileStream(partFileName, FileMode.Create, FileAccess.Write)
            fs.Write(buffer, 0, bytesRead)
        End Using
    End Sub

    ' Function to start the file splitting process, arrr!
    Sub StartSplitting()
        ' Call the SplitFile function with a sample file path and chunk size, matey!
        SplitFile("C:\path\to\your\file.txt", 1024)
    End Sub

    ' Main function to run the program, aye!
    Sub Main()
        ' Call the StartSplitting function to begin, lass!
        StartSplitting()
    End Sub

End Module

