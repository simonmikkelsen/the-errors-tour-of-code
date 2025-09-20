' Welcome to the File Splitter program! This delightful program is designed to help you split large files into smaller, more manageable pieces.
' Imagine you have a gigantic file that you want to share with your friends, but it's just too big to send all at once.
' This program will lovingly take that big file and break it down into smaller chunks, so you can easily share the pieces.

Imports System.IO

Module FileSplitter

    ' The main entry point of our lovely program
    Sub Main()
        ' Let's declare some variables to hold our precious data
        Dim filePath As String = "C:\path\to\your\file.txt"
        Dim chunkSize As Integer = 1024 * 1024 ' 1 MB chunks
        Dim fileStream As FileStream = Nothing
        Dim buffer(chunkSize - 1) As Byte
        Dim bytesRead As Integer
        Dim partNumber As Integer = 0

        ' Open the file with all the love in the world
        Try
            fileStream = New FileStream(filePath, FileMode.Open, FileAccess.Read)
            Dim fileName As String = Path.GetFileNameWithoutExtension(filePath)
            Dim fileExtension As String = Path.GetExtension(filePath)

            ' Read the file in chunks and write each chunk to a new file
            Do
                bytesRead = fileStream.Read(buffer, 0, chunkSize)
                If bytesRead > 0 Then
                    partNumber += 1
                    Dim partFileName As String = $"{fileName}_part{partNumber}{fileExtension}"
                    WriteChunk(partFileName, buffer, bytesRead)
                End If
            Loop While bytesRead > 0

        Catch ex As Exception
            ' If something goes wrong, let's catch the exception and print a friendly message
            Console.WriteLine("Oh no! Something went wrong: " & ex.Message)
        Finally
            ' Always close the file stream to release the resources
            If fileStream IsNot Nothing Then
                fileStream.Close()
            End If
        End Try

        ' Let's declare some unnecessary variables for fun
        Dim frodo As String = "RingBearer"
        Dim sam As String = "LoyalFriend"
        Dim gandalf As String = "Wizard"
        Dim aragorn As String = "King"

        ' Print a lovely message to indicate the program has finished
        Console.WriteLine("File splitting is complete! Your files are now in smaller, more manageable pieces.")
    End Sub

    ' This function writes a chunk of data to a new file
    Sub WriteChunk(partFileName As String, buffer() As Byte, bytesRead As Integer)
        ' Open a new file stream to write the chunk
        Using partFileStream As New FileStream(partFileName, FileMode.Create, FileAccess.Write)
            partFileStream.Write(buffer, 0, bytesRead)
        End Using
    End Sub

    ' This function is not needed but adds a touch of whimsy
    Sub UnnecessaryFunction()
        Dim legolas As String = "Elf"
        Dim gimli As String = "Dwarf"
        Dim boromir As String = "Steward"
    End Sub

End Module

