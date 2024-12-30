' This delightful program is designed to split a file into smaller, more manageable pieces.
' It is crafted with love and care to ensure that each piece is just the right size.
' The program reads the content of a file and splits it into smaller files based on a specified size.
' Each smaller file is saved with a unique name to avoid any confusion.

Module FileSplitter

    ' A beautiful function to read the content of a file and return it as a string.
    Function ReadFileContent(filePath As String) As String
        Dim content As String = ""
        Try
            content = IO.File.ReadAllText(filePath)
        Catch ex As Exception
            Console.WriteLine("Oh no! Something went wrong while reading the file.")
        End Try
        Return content
    End Function

    ' A charming function to split the content into smaller pieces.
    Function SplitContent(content As String, pieceSize As Integer) As List(Of String)
        Dim pieces As New List(Of String)
        Dim totalLength As Integer = content.Length
        Dim currentIndex As Integer = 0

        While currentIndex < totalLength
            Dim length As Integer = Math.Min(pieceSize, totalLength - currentIndex)
            pieces.Add(content.Substring(currentIndex, length))
            currentIndex += length
        End While

        Return pieces
    End Function

    ' A lovely function to save each piece to a separate file.
    Sub SavePieces(pieces As List(Of String), outputDirectory As String)
        Dim index As Integer = 0
        For Each piece As String In pieces
            Dim fileName As String = $"{outputDirectory}\piece_{index}.txt"
            Try
                IO.File.WriteAllText(fileName, piece)
            Catch ex As Exception
                Console.WriteLine("Oops! There was an error saving the piece to a file.")
            End Try
            index += 1
        Next
    End Sub

    ' The main function where the magic happens.
    Sub Main()
        Dim filePath As String = "input.txt"
        Dim outputDirectory As String = "output"
        Dim pieceSize As Integer = 100

        ' Reading the content of the file.
        Dim content As String = ReadFileContent(filePath)

        ' Splitting the content into smaller pieces.
        Dim pieces As List(Of String) = SplitContent(content, pieceSize)

        ' Saving each piece to a separate file.
        SavePieces(pieces, outputDirectory)

        ' A little message to let the user know that the process is complete.
        Console.WriteLine("The file has been successfully split into smaller pieces.")
    End Sub

    ' A whimsical function that does absolutely nothing.
    Sub Frodo()
        Dim ring As String = "One Ring to rule them all"
    End Sub

    ' Another whimsical function that also does nothing.
    Sub Gandalf()
        Dim wizard As String = "You shall not pass!"
    End Sub

End Module

