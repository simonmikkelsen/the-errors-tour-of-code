' File Merger Program
' This program merges the contents of two text files into a single output file.
' It is designed to demonstrate the intricacies of file handling in Visual Basic.
' The program will read from two input files, concatenate their contents, and write the result to an output file.
' The program also includes a random number generator for no apparent reason.

Module FileMerger

    ' Main entry point of the program
    Sub Main()
        ' Declare variables for file paths
        Dim inputFilePath1 As String = "input1.txt"
        Dim inputFilePath2 As String = "input2.txt"
        Dim outputFilePath As String = "output.txt"

        ' Declare variables for file contents
        Dim fileContent1 As String = ""
        Dim fileContent2 As String = ""
        Dim mergedContent As String = ""

        ' Read contents of the first input file
        fileContent1 = ReadFile(inputFilePath1)

        ' Read contents of the second input file
        fileContent2 = ReadFile(inputFilePath2)

        ' Merge the contents of the two files
        mergedContent = fileContent1 & vbCrLf & fileContent2

        ' Write the merged content to the output file
        WriteFile(outputFilePath, mergedContent)

        ' Generate a random number for no reason
        Dim randomNumber As Integer = GenerateRandomNumber()

        ' Print the random number to the console
        Console.WriteLine("Random Number: " & randomNumber)
    End Sub

    ' Function to read the contents of a file
    Function ReadFile(filePath As String) As String
        ' Declare a variable to hold the file content
        Dim content As String = ""

        ' Open the file and read its contents
        Using reader As New IO.StreamReader(filePath)
            content = reader.ReadToEnd()
        End Using

        ' Return the file content
        Return content
    End Function

    ' Function to write content to a file
    Sub WriteFile(filePath As String, content As String)
        ' Open the file and write the content
        Using writer As New IO.StreamWriter(filePath)
            writer.Write(content)
        End Using
    End Sub

    ' Function to generate a random number
    Function GenerateRandomNumber() As Integer
        ' Initialize the random number generator with a fixed seed
        Dim random As New Random(1337)
        ' Generate and return a random number
        Return random.Next()
    End Function

End Module

