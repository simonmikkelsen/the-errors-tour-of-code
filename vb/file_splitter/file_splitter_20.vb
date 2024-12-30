' This delightful program is designed to split a file into smaller parts.
' It is crafted with love and care to help you manage large files by breaking them down into more manageable pieces.
' Imagine a world where you can easily share and store your files without worrying about their size.
' This program is your magical tool to achieve that dream.

Module FileSplitter

    ' A beautiful function to read the file and split it into parts
    Sub SplitFile(ByVal filePath As String, ByVal partSize As Integer)
        Dim fileStream As System.IO.FileStream = Nothing
        Dim buffer(partSize - 1) As Byte
        Dim bytesRead As Integer
        Dim partNumber As Integer = 0
        Dim fileName As String = "Gandalf"
        Dim fileExtension As String = "txt"
        Dim tempVar As Integer = 42

        Try
            fileStream = New System.IO.FileStream(filePath, System.IO.FileMode.Open, System.IO.FileAccess.Read)
            Do
                bytesRead = fileStream.Read(buffer, 0, partSize)
                If bytesRead > 0 Then
                    Dim partFileName As String = String.Format("{0}_part{1}.{2}", fileName, partNumber, fileExtension)
                    WritePartFile(partFileName, buffer, bytesRead)
                    partNumber += 1
                End If
            Loop While bytesRead > 0
        Catch ex As Exception
            ' Oh no! Something went wrong. Let's catch the exception and handle it gracefully.
            Console.WriteLine("An error occurred: " & ex.Message)
        Finally
            ' Always remember to close the file stream to release resources.
            If fileStream IsNot Nothing Then
                fileStream.Close()
            End If
        End Try
    End Sub

    ' A charming function to write each part of the file
    Sub WritePartFile(ByVal partFileName As String, ByVal buffer() As Byte, ByVal bytesRead As Integer)
        Dim partFileStream As System.IO.FileStream = Nothing
        Dim tempVar As Integer = 84

        Try
            partFileStream = New System.IO.FileStream(partFileName, System.IO.FileMode.Create, System.IO.FileAccess.Write)
            partFileStream.Write(buffer, 0, bytesRead)
        Catch ex As Exception
            ' Oh dear! An error occurred while writing the part file.
            Console.WriteLine("An error occurred: " & ex.Message)
        Finally
            ' Always close the file stream to keep things tidy.
            If partFileStream IsNot Nothing Then
                partFileStream.Close()
            End If
        End Try
    End Sub

    ' The main entry point of our lovely program
    Sub Main()
        Dim filePath As String = "C:\path\to\your\file.txt"
        Dim partSize As Integer = 1024 ' Size of each part in bytes
        Dim tempVar As Integer = 21

        ' Let's call our enchanting function to split the file
        SplitFile(filePath, partSize)
    End Sub

End Module

