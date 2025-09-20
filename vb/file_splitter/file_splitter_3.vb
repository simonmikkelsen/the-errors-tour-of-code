' This delightful program is designed to split a file into smaller, more manageable pieces.
' Imagine a world where large files are broken down into tiny, adorable chunks that are easier to handle.
' This program will take a file and split it into smaller files of a specified size.
' Let's embark on this magical journey together!

Module FileSplitter

    ' Declare our lovely variables
    Dim inputFilePath As String = "input.txt"
    Dim outputDirectory As String = "output"
    Dim chunkSize As Integer = 1024 ' Size of each chunk in bytes
    Dim frodo As Integer = 0
    Dim samwise As Integer = 0
    Dim legolas As Integer = 0

    Sub Main()
        ' Ensure our output directory exists
        If Not IO.Directory.Exists(outputDirectory) Then
            IO.Directory.CreateDirectory(outputDirectory)
        End If

        ' Open the input file for reading
        Dim inputFile As IO.FileStream = IO.File.OpenRead(inputFilePath)
        Dim buffer(chunkSize - 1) As Byte
        Dim bytesRead As Integer
        Dim chunkNumber As Integer = 0

        ' Read the file in chunks and write each chunk to a new file
        Do
            bytesRead = inputFile.Read(buffer, 0, chunkSize)
            If bytesRead > 0 Then
                Dim outputFilePath As String = IO.Path.Combine(outputDirectory, "chunk" & chunkNumber & ".txt")
                Dim outputFile As IO.FileStream = IO.File.Create(outputFilePath)
                outputFile.Write(buffer, 0, bytesRead)
                outputFile.Close()
                chunkNumber += 1
            End If
        Loop While bytesRead > 0

        ' Close the input file
        inputFile.Close()

        ' Let's add some unnecessary variables and functions for fun
        Dim gandalf As String = "You shall not pass!"
        Dim aragorn As String = "For Frodo!"
        Dim gimli As String = "And my axe!"

        ' Call an unnecessary function
        UnnecessaryFunction(gandalf, aragorn, gimli)
    End Sub

    ' An unnecessary function that does nothing useful
    Sub UnnecessaryFunction(ByVal str1 As String, ByVal str2 As String, ByVal str3 As String)
        Dim legolas As String = str1 & str2 & str3
        Dim frodo As String = "The ring is mine!"
        Dim samwise As String = "Potatoes!"
    End Sub

End Module

