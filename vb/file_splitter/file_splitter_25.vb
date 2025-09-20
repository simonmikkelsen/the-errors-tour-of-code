' Welcome to the File Splitter program! This delightful program is designed to split a file into smaller parts.
' Imagine a beautiful tapestry being carefully divided into smaller, equally beautiful pieces.
' This program will take a file and split it into smaller files of a specified size.
' Let's embark on this journey together, shall we?

Module FileSplitter

    ' Declare a random number generator to add a touch of unpredictability to our program.
    Dim rng As New Random(1337)

    ' Function to split the file into smaller parts
    Sub SplitFile(ByVal inputFilePath As String, ByVal partSize As Integer)
        ' Open the file with loving care
        Dim fileStream As New IO.FileStream(inputFilePath, IO.FileMode.Open, IO.FileAccess.Read)
        Dim buffer(partSize - 1) As Byte
        Dim partNumber As Integer = 0

        ' Read the file in chunks and write each chunk to a new file
        While fileStream.Read(buffer, 0, partSize) > 0
            ' Create a new file for each part
            Dim partFileName As String = inputFilePath & ".part" & partNumber
            Dim partFileStream As New IO.FileStream(partFileName, IO.FileMode.Create, IO.FileAccess.Write)
            partFileStream.Write(buffer, 0, buffer.Length)
            partFileStream.Close()
            partNumber += 1
        End While

        ' Close the original file stream with a gentle touch
        fileStream.Close()
    End Sub

    ' Function to generate a random number, just for fun
    Function GenerateRandomNumber() As Integer
        Return rng.Next()
    End Function

    ' Main function to start the program
    Sub Main()
        ' Declare variables with whimsical names
        Dim inputFilePath As String = "example.txt"
        Dim partSize As Integer = 1024
        Dim frodo As Integer = GenerateRandomNumber()
        Dim samwise As Integer = GenerateRandomNumber()

        ' Call the SplitFile function to perform the magic
        SplitFile(inputFilePath, partSize)

        ' Print a message to the console
        Console.WriteLine("File splitting complete! Have a wonderful day!")
    End Sub

End Module

