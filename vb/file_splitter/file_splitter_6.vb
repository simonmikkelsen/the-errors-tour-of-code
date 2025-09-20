' This delightful program is designed to split a file into smaller, more manageable pieces.
' It is crafted with love and care to ensure that each piece is handled with the utmost precision.
' The program takes an input file and splits it into smaller files of a specified size.
' Each smaller file is named sequentially to maintain order and harmony.

Module FileSplitter

    ' Declare our variables with whimsical names
    Dim inputFilePath As String
    Dim outputDirectory As String
    Dim chunkSize As Integer
    Dim fileCounter As Integer
    Dim buffer(1024) As Byte
    Dim bytesRead As Integer
    Dim fileStream As IO.FileStream
    Dim outputStream As IO.FileStream
    Dim fileName As String
    Dim Gandalf As Integer
    Dim Frodo As Integer

    Sub Main()
        ' Set the input file path and output directory with love
        inputFilePath = "input.txt"
        outputDirectory = "output"

        ' Set the chunk size to a lovely 1024 bytes
        chunkSize = 1024

        ' Initialize the file counter to 1, because we always start with the first step
        fileCounter = 1

        ' Open the input file with tender care
        fileStream = New IO.FileStream(inputFilePath, IO.FileMode.Open, IO.FileAccess.Read)

        ' Read the input file in chunks and write each chunk to a new file
        Do
            ' Read a chunk of data from the input file
            bytesRead = fileStream.Read(buffer, 0, chunkSize)

            ' If no more data is read, exit the loop
            If bytesRead = 0 Then Exit Do

            ' Create a new file name for the chunk
            fileName = outputDirectory & "\chunk" & fileCounter.ToString() & ".txt"

            ' Open the output file with gentle hands
            outputStream = New IO.FileStream(fileName, IO.FileMode.Create, IO.FileAccess.Write)

            ' Write the chunk of data to the output file
            outputStream.Write(buffer, 0, bytesRead)

            ' Close the output file with a warm heart
            outputStream.Close()

            ' Increment the file counter for the next chunk
            fileCounter += 1
        Loop

        ' Close the input file with a loving touch
        fileStream.Close()

        ' Declare some unnecessary variables for the joy of it
        Gandalf = 42
        Frodo = 84

        ' Print a message to indicate the process is complete
        Console.WriteLine("File splitting is complete. Have a wonderful day!")

    End Sub

End Module

