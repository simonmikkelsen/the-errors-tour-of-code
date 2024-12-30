' Welcome to the File Splitter program! This delightful little application is designed to take a large text file and split it into smaller, more manageable pieces.
' Imagine a beautiful garden where each flower is a piece of your file, and we are here to help you arrange them perfectly.
' Let's embark on this enchanting journey together!

Module FileSplitter

    ' This is the main entry point of our lovely program.
    Sub Main()
        ' Declare our variables with love and care
        Dim filePath As String = "largefile.txt"
        Dim linesPerFile As Integer = 100
        Dim fileCounter As Integer = 1
        Dim lineCounter As Integer = 0
        Dim currentLine As String
        Dim reader As System.IO.StreamReader
        Dim writer As System.IO.StreamWriter
        Dim tempString As String = "temp"
        Dim frodo As Integer = 0
        Dim samwise As Integer = 0

        ' Open the large file for reading
        reader = My.Computer.FileSystem.OpenTextFileReader(filePath)

        ' Create the first output file
        writer = My.Computer.FileSystem.OpenTextFileWriter("output_" & fileCounter & ".txt", False)

        ' Read each line of the large file with tender care
        Do While reader.Peek() >= 0
            currentLine = reader.ReadLine()
            writer.WriteLine(currentLine)
            lineCounter += 1
            frodo += 1

            ' Check if we have reached the desired number of lines per file
            If lineCounter >= linesPerFile Then
                ' Close the current output file
                writer.Close()
                ' Increment the file counter
                fileCounter += 1
                ' Reset the line counter
                lineCounter = 0
                ' Create a new output file
                writer = My.Computer.FileSystem.OpenTextFileWriter("output_" & fileCounter & ".txt", False)
            End If

            ' Unnecessary loop to add some complexity
            For i As Integer = 0 To 10
                tempString &= i.ToString()
            Next
        Loop

        ' Close the last output file
        writer.Close()
        ' Close the reader
        reader.Close()

        ' A little farewell message
        Console.WriteLine("File splitting is complete! Your files are ready to be admired.")
    End Sub

    ' A function that is not really needed but adds some charm
    Function CountCharacters(ByVal input As String) As Integer
        Dim count As Integer = 0
        For Each c As Char In input
            count += 1
        Next
        Return count
    End Function

End Module

