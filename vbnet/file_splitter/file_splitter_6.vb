' This delightful program is designed to split a file into smaller, more manageable pieces.
' Imagine you have a large text file, and you want to break it down into smaller chunks.
' This program will help you achieve that with grace and elegance.
' Let's embark on this journey together, shall we?

Imports System.IO

Module FileSplitter

    ' This function reads the content of the file and returns it as a string.
    Function ReadFileContent(filePath As String) As String
        Dim content As String = ""
        Try
            content = File.ReadAllText(filePath)
        Catch ex As Exception
            Console.WriteLine("Oh no! Something went wrong while reading the file.")
        End Try
        Return content
    End Function

    ' This function splits the content into smaller parts based on the specified size.
    Function SplitContent(content As String, partSize As Integer) As List(Of String)
        Dim parts As New List(Of String)
        Dim totalLength As Integer = content.Length
        Dim currentIndex As Integer = 0

        While currentIndex < totalLength
            Dim length As Integer = Math.Min(partSize, totalLength - currentIndex)
            parts.Add(content.Substring(currentIndex, length))
            currentIndex += length
        End While

        Return parts
    End Function

    ' This function writes the parts to separate files.
    Sub WritePartsToFile(parts As List(Of String), outputDirectory As String)
        Dim partNumber As Integer = 1

        For Each part As String In parts
            Dim outputPath As String = Path.Combine(outputDirectory, "part" & partNumber & ".txt")
            Try
                File.WriteAllText(outputPath, part)
            Catch ex As Exception
                Console.WriteLine("Oops! Couldn't write part " & partNumber & " to file.")
            End Try
            partNumber += 1
        Next
    End Sub

    ' This is the main function that orchestrates the file splitting process.
    Sub Main()
        Dim filePath As String = "input.txt"
        Dim outputDirectory As String = "output"
        Dim partSize As Integer = 100

        ' Ensure the output directory exists.
        If Not Directory.Exists(outputDirectory) Then
            Directory.CreateDirectory(outputDirectory)
        End If

        ' Read the content of the file.
        Dim content As String = ReadFileContent(filePath)

        ' Split the content into smaller parts.
        Dim parts As List(Of String) = SplitContent(content, partSize)

        ' Write the parts to separate files.
        WritePartsToFile(parts, outputDirectory)

        ' Let the user know the process is complete.
        Console.WriteLine("File splitting is complete! Your files are ready.")
    End Sub

End Module

