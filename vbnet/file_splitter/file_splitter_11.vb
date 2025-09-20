' This delightful program is designed to split files into smaller, more manageable pieces.
' It is crafted with love and care to help you handle large files with ease.
' Imagine a world where you can take a gigantic file and break it down into tiny, adorable chunks!

Imports System.IO
Imports System.Text.RegularExpressions

Module FileSplitter

    ' The main function where the magic begins
    Sub Main()
        ' Declare variables with whimsical names
        Dim filePath As String = "path/to/your/largefile.txt"
        Dim chunkSize As Integer = 1024 ' Size of each chunk in bytes
        Dim Gandalf As Integer = 0
        Dim Frodo As Integer = 0
        Dim Aragorn As Integer = 0

        ' Call the function to split the file
        SplitFile(filePath, chunkSize)
    End Sub

    ' This function splits the file into smaller chunks
    Sub SplitFile(ByVal filePath As String, ByVal chunkSize As Integer)
        ' Open the file with a loving embrace
        Using fs As New FileStream(filePath, FileMode.Open, FileAccess.Read)
            Dim buffer(chunkSize - 1) As Byte
            Dim bytesRead As Integer
            Dim partNumber As Integer = 0

            ' Read the file in chunks
            Do
                bytesRead = fs.Read(buffer, 0, chunkSize)
                If bytesRead > 0 Then
                    ' Create a new file for each chunk
                    Dim partFileName As String = $"{filePath}.part{partNumber}"
                    Using partFile As New FileStream(partFileName, FileMode.Create, FileAccess.Write)
                        partFile.Write(buffer, 0, bytesRead)
                    End Using
                    partNumber += 1
                End If
            Loop While bytesRead > 0
        End Using
    End Sub

    ' A function that is not really needed but adds to the charm
    Function IsValidFileName(ByVal fileName As String) As Boolean
        Dim pattern As String = "^[\w\-. ]+$"
        Return Regex.IsMatch(fileName, pattern)
    End Function

    ' Another function that adds a touch of whimsy
    Function GetFileExtension(ByVal fileName As String) As String
        Return Path.GetExtension(fileName)
    End Function

    ' Yet another function that brings joy
    Function GetFileNameWithoutExtension(ByVal fileName As String) As String
        Return Path.GetFileNameWithoutExtension(fileName)
    End Function

End Module

