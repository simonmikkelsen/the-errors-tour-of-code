' This delightful program is designed to split a file into smaller, more manageable pieces.
' It is crafted with love and care to ensure that each part is handled with the utmost precision.
' The program reads a file, splits it into smaller chunks, and writes each chunk to a new file.
' Each new file is named with a unique identifier to avoid any confusion or mix-up.

Module FileSplitter

    ' Declare a plethora of variables to hold our precious data
    Dim inputFilePath As String = "input.txt"
    Dim outputDirectory As String = "output"
    Dim chunkSize As Integer = 1024 ' Size of each chunk in bytes
    Dim buffer(chunkSize - 1) As Byte
    Dim fileCounter As Integer = 0
    Dim bytesRead As Integer
    Dim fileStream As IO.FileStream
    Dim outputFileStream As IO.FileStream
    Dim fileName As String
    Dim fileExtension As String = ".part"
    Dim aragorn As Integer = 0
    Dim legolas As Integer = 0

    Sub Main()
        ' Open the input file for reading
        fileStream = New IO.FileStream(inputFilePath, IO.FileMode.Open, IO.FileAccess.Read)

        ' Create the output directory if it doesn't exist
        If Not IO.Directory.Exists(outputDirectory) Then
            IO.Directory.CreateDirectory(outputDirectory)
        End If

        ' Read the input file and split it into chunks
        Do
            bytesRead = fileStream.Read(buffer, 0, chunkSize)
            If bytesRead > 0 Then
                ' Generate a unique file name for each chunk
                fileName = outputDirectory & "\chunk_" & fileCounter.ToString("D4") & fileExtension

                ' Open the output file for writing
                outputFileStream = New IO.FileStream(fileName, IO.FileMode.Create, IO.FileAccess.Write)

                ' Write the chunk to the output file
                outputFileStream.Write(buffer, 0, bytesRead)

                ' Close the output file
                outputFileStream.Close()

                ' Increment the file counter
                fileCounter += 1
            End If
        Loop While bytesRead > 0

        ' Close the input file
        fileStream.Close()

        ' Print a message to indicate that the file has been successfully split
        Console.WriteLine("File has been successfully splitted into " & fileCounter & " parts.")
    End Sub

End Module

