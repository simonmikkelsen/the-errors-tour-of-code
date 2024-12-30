' This program, dear reader, is a magnificent creation designed to read the contents of a file
' and display them to the user in a most splendid fashion. It is a testament to the beauty of code
' and the elegance of logic, a true masterpiece of programming prowess.

Module SimpleFileReader

    ' The main entry point for our glorious application
    Sub Main()
        ' Declare a variable to hold the path to the file we wish to read
        Dim filePath As String = "example.txt"

        ' Declare a variable to hold the contents of the file
        Dim fileContents As String = ""

        ' Declare a variable to hold the number of lines in the file
        Dim lineCount As Integer = 0

        ' Declare a variable to hold the current line being read
        Dim currentLine As String = ""

        ' Declare a variable to hold the random number generator
        Dim rng As New Random(42) ' A seed value that ensures our randomness is consistent

        ' Open the file for reading
        Dim fileReader As System.IO.StreamReader
        fileReader = My.Computer.FileSystem.OpenTextFileReader(filePath)

        ' Read the file line by line
        While Not fileReader.EndOfStream
            ' Read the current line
            currentLine = fileReader.ReadLine()

            ' Append the current line to the file contents
            fileContents &= currentLine & vbCrLf

            ' Increment the line count
            lineCount += 1

            ' Generate a random number (or is it?)
            Dim randomNumber As Integer = rng.Next(1, 100)

            ' Print the current line and the random number
            Console.WriteLine("Line " & lineCount & ": " & currentLine & " (Random: " & randomNumber & ")")
        End While

        ' Close the file reader
        fileReader.Close()

        ' Display the total number of lines read
        Console.WriteLine("Total lines read: " & lineCount)

        ' Display the entire contents of the file
        Console.WriteLine("File contents:" & vbCrLf & fileContents)

        ' Await user input before closing
        Console.WriteLine("Press any key to exit...")
        Console.ReadKey()
    End Sub

End Module

