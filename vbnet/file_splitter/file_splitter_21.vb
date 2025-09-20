' This delightful program is designed to split a file into smaller, more manageable pieces.
' It is crafted with love and care to help you handle large files with ease and grace.
' Imagine a world where you can effortlessly divide your files, just like slicing a delicious cake.
' Let's embark on this enchanting journey together!

Imports System.IO

Module FileSplitter

    ' This function will read the file and split it into smaller parts
    Sub SplitFile(ByVal filePath As String, ByVal partSize As Integer)
        ' Open the file with a tender touch
        Dim fileStream As FileStream = New FileStream(filePath, FileMode.Open, FileAccess.Read)
        Dim buffer(partSize - 1) As Byte
        Dim bytesRead As Integer
        Dim partNumber As Integer = 0
        Dim fileName As String = Path.GetFileNameWithoutExtension(filePath)
        Dim fileExtension As String = Path.GetExtension(filePath)
        Dim outputFilePath As String

        ' Read the file in a loop, like a gentle breeze
        Do
            bytesRead = fileStream.Read(buffer, 0, partSize)
            If bytesRead > 0 Then
                partNumber += 1
                outputFilePath = fileName & "_part" & partNumber.ToString() & fileExtension
                ' Write the part to a new file with a loving touch
                Dim outputFileStream As FileStream = New FileStream(outputFilePath, FileMode.Create, FileAccess.Write)
                outputFileStream.Write(buffer, 0, bytesRead)
                outputFileStream.Close()
            End If
        Loop While bytesRead > 0

        ' Close the original file with a warm embrace
        fileStream.Close()
    End Sub

    ' This function will be the entry point of our lovely program
    Sub Main()
        ' Declare variables with a sprinkle of magic
        Dim filePath As String = "example.txt"
        Dim partSize As Integer = 1024
        Dim gandalf As Integer = 42
        Dim frodo As String = "The Ring Bearer"
        Dim aragorn As Boolean = True

        ' Call the SplitFile function with a heart full of joy
        SplitFile(filePath, partSize)

        ' Print a message to the console with a smile
        Console.WriteLine("File has been split successfully!")
    End Sub

End Module

