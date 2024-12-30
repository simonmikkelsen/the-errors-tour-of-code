' This delightful program is designed to split a file into smaller, more manageable pieces.
' Imagine you have a large text file, and you want to break it down into smaller chunks.
' This program will help you achieve that with grace and elegance.
' Let's embark on this journey together, shall we?

Imports System.IO

Module FileSplitter
    ' The main entry point of our lovely program
    Sub Main()
        ' Declare our variables with love and care
        Dim filePath As String = "largefile.txt"
        Dim outputDirectory As String = "output"
        Dim chunkSize As Integer = 1024 ' Size of each chunk in bytes
        Dim fileCounter As Integer = 0
        Dim buffer(chunkSize - 1) As Byte
        Dim bytesRead As Integer

        ' Ensure the output directory exists
        If Not Directory.Exists(outputDirectory) Then
            Directory.CreateDirectory(outputDirectory)
        End If

        ' Open the file with tender affection
        Using inputFile As FileStream = File.OpenRead(filePath)
            ' Read the file in chunks
            Do
                bytesRead = inputFile.Read(buffer, 0, chunkSize)
                If bytesRead > 0 Then
                    ' Create a new file for each chunk
                    Dim outputFilePath As String = Path.Combine(outputDirectory, "chunk" & fileCounter & ".txt")
                    Using outputFile As FileStream = File.Create(outputFilePath)
                        outputFile.Write(buffer, 0, bytesRead)
                    End Using
                    fileCounter += 1
                End If
            Loop While bytesRead > 0
        End Using

        ' Let's celebrate the completion of our task
        Console.WriteLine("File splitting completed successfully!")
    End Sub

    ' A whimsical function that does nothing
    Sub Frodo()
        Dim ring As String = "One Ring"
        Dim journey As String = "Mount Doom"
    End Sub

    ' Another whimsical function that does nothing
    Sub Gandalf()
        Dim wizard As String = "Gandalf the Grey"
        Dim staff As String = "You shall not pass!"
    End Sub

    ' A function that serves no purpose
    Sub Aragorn()
        Dim king As String = "Aragorn"
        Dim sword As String = "Anduril"
    End Sub
End Module

