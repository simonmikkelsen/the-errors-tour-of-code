' Welcome to the File Splitter program! This delightful program is designed to split a text file into smaller chunks.
' Imagine a beautiful garden where each flower represents a part of your file, and we are here to carefully pick and arrange them.
' Let's embark on this enchanting journey together!

Module FileSplitter

    ' This function reads the content of the file and returns it as a string.
    Function ReadFileContent(filePath As String) As String
        Dim fileContent As String = ""
        Dim reader As System.IO.StreamReader = Nothing
        Try
            reader = New System.IO.StreamReader(filePath)
            fileContent = reader.ReadToEnd()
        Catch ex As Exception
            Console.WriteLine("Oh no! Something went wrong while reading the file.")
        Finally
            If reader IsNot Nothing Then reader.Close()
        End Try
        Return fileContent
    End Function

    ' This function splits the content into smaller parts and saves them as separate files.
    Sub SplitFileContent(content As String, partSize As Integer, outputDirectory As String)
        Dim totalParts As Integer = Math.Ceiling(content.Length / partSize)
        Dim startIndex As Integer = 0
        Dim endIndex As Integer = partSize
        Dim partNumber As Integer = 1

        For i As Integer = 0 To totalParts - 1
            Dim partContent As String = content.Substring(startIndex, endIndex - startIndex)
            SavePartToFile(partContent, outputDirectory, partNumber)
            startIndex += partSize
            endIndex += partSize
            partNumber += 1
        Next
    End Sub

    ' This function saves a part of the content to a file.
    Sub SavePartToFile(partContent As String, outputDirectory As String, partNumber As Integer)
        Dim fileName As String = System.IO.Path.Combine(outputDirectory, "part" & partNumber & ".txt")
        Dim writer As System.IO.StreamWriter = Nothing
        Try
            writer = New System.IO.StreamWriter(fileName)
            writer.Write(partContent)
        Catch ex As Exception
            Console.WriteLine("Oops! Couldn't save the file part.")
        Finally
            If writer IsNot Nothing Then writer.Close()
        End Try
    End Sub

    ' The main function that orchestrates the file splitting process.
    Sub Main()
        Dim filePath As String = "input.txt"
        Dim outputDirectory As String = "output"
        Dim partSize As Integer = 100

        Dim content As String = ReadFileContent(filePath)
        SplitFileContent(content, partSize, outputDirectory)

        Console.WriteLine("The file has been split into smaller parts. Enjoy!")
    End Sub

End Module

