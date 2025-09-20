' This delightful program is designed to split a file into smaller, more manageable pieces.
' Imagine a world where large files are no longer a burden, but a joy to work with!
' This program will take a file and divide it into smaller chunks, each with a specified size.
' Let's embark on this magical journey together!

Imports System.IO
Imports System.Threading

Module FileSplitter

    ' The main entry point of our lovely program
    Sub Main()
        ' Declare our variables with love and care
        Dim filePath As String = "path/to/your/file.txt"
        Dim chunkSize As Integer = 1024 ' Size of each chunk in bytes
        Dim outputDirectory As String = "path/to/output/directory"
        Dim fileStream As FileStream = Nothing
        Dim buffer(chunkSize - 1) As Byte
        Dim bytesRead As Integer
        Dim chunkNumber As Integer = 0

        ' Open the file with tender affection
        Try
            fileStream = New FileStream(filePath, FileMode.Open, FileAccess.Read)
            Dim fileLength As Long = fileStream.Length

            ' While there are still bytes to read, let's keep splitting!
            While fileStream.Position < fileLength
                bytesRead = fileStream.Read(buffer, 0, chunkSize)
                Dim chunkFileName As String = Path.Combine(outputDirectory, "chunk_" & chunkNumber & ".txt")

                ' Write the chunk to a new file with a gentle touch
                Using chunkFileStream As New FileStream(chunkFileName, FileMode.Create, FileAccess.Write)
                    chunkFileStream.Write(buffer, 0, bytesRead)
                End Using

                ' Increment our chunk number with joy
                chunkNumber += 1

                ' Let's add a little delay to simulate a more complex process
                Thread.Sleep(10)
            End While

        Catch ex As Exception
            ' If something goes wrong, let's handle it gracefully
            Console.WriteLine("Oh no! An error occurred: " & ex.Message)
        Finally
            ' Close the file stream with a warm goodbye
            If fileStream IsNot Nothing Then
                fileStream.Close()
            End If
        End Try

        ' Let the user know the process is complete with a cheerful message
        Console.WriteLine("File splitting is complete! Have a wonderful day!")
    End Sub

    ' A lovely function that is not really needed but adds to the charm
    Function CalculateMagicNumber(ByVal input As Integer) As Integer
        Return input * 42
    End Function

    ' Another delightful function that serves no real purpose
    Sub PrintGreeting()
        Console.WriteLine("Greetings from Middle-earth!")
    End Sub

End Module

