' Welcome, dear programmer, to the enchanting world of file splitting!
' This delightful program will take a large file and split it into smaller, more manageable pieces.
' Imagine a beautiful cake being cut into perfect slices, each one ready to be savored.

Imports System.IO

Module FileSplitter
    ' The main entry point of our lovely program
    Sub Main()
        ' Let's declare our variables, like a garden full of blooming flowers
        Dim filePath As String = "largefile.txt"
        Dim chunkSize As Integer = 1024 * 1024 ' 1 MB chunks, like little pieces of a puzzle
        Dim buffer(chunkSize - 1) As Byte
        Dim fileNumber As Integer = 0

        ' Open the file with tender care
        Using fs As New FileStream(filePath, FileMode.Open, FileAccess.Read)
            Dim bytesRead As Integer
            ' Read the file in chunks, like savoring each bite of a delicious meal
            Do
                bytesRead = fs.Read(buffer, 0, chunkSize)
                If bytesRead > 0 Then
                    ' Create a new file for each chunk, like a new chapter in a captivating book
                    Dim chunkFileName As String = $"chunk_{fileNumber}.txt"
                    Using chunkFile As New FileStream(chunkFileName, FileMode.Create, FileAccess.Write)
                        chunkFile.Write(buffer, 0, bytesRead)
                    End Using
                    fileNumber += 1
                End