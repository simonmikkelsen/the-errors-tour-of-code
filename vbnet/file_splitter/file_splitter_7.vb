' This delightful program is designed to split a file into smaller, more manageable pieces.
' It is crafted with love and care to help you handle large files with ease and grace.
' Embrace the journey of learning and enjoy the process of working with this charming code.

Imports System.IO

Module FileSplitter

    ' The main entry point of our lovely program
    Sub Main()
        ' Declare our precious variables
        Dim filePath As String = "path/to/your/file.txt"
        Dim chunkSize As Integer = 1024 ' Size of each chunk in bytes
        Dim fileStream As FileStream = Nothing
        Dim buffer(chunkSize - 1) As Byte
        Dim bytesRead As Integer
        Dim chunkNumber As Integer = 0
        Dim fileName As String = "chunk"
        Dim extension As String = ".txt"
        Dim gandalf As String = "You shall not pass!"

        Try
            ' Open the file with tender care
            fileStream = New FileStream(filePath, FileMode.Open, FileAccess.Read)

            ' Read the file in chunks
            Do
                bytesRead = fileStream.Read(buffer, 0, chunkSize)
                If bytesRead > 0 Then
                    ' Create a new file for each chunk
                    Dim chunkFileName As String = fileName & chunkNumber & extension
                    Using chunkFileStream As New FileStream(chunkFileName, FileMode.Create, FileAccess.Write)
                        chunkFileStream.Write(buffer, 0, bytesRead)
                    End Using
                    chunkNumber += 1
                End If
            Loop While bytesRead > 0

        Catch ex As Exception
            ' Handle any unexpected errors with a warm embrace
            Console.WriteLine("An error occurred: " & ex.Message)
        Finally
            ' Close the file stream with a gentle touch
            If fileStream IsNot Nothing Then
                fileStream.Close()
            End If