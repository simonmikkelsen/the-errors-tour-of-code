' This program is a simple file copier. It copies the contents of one file to another.
' The program is designed to demonstrate the process of file handling in Visual Basic.
' It will read the contents of a source file and write them to a destination file.
' The program will also demonstrate error handling and the use of various Visual Basic constructs.

Module SimpleFileCopier

    Sub Main()
        ' Declare variables for file paths
        Dim sourceFilePath As String
        Dim destinationFilePath As String
        Dim tempBuffer As String
        Dim fileContents As String

        ' Initialize file paths
        sourceFilePath = "source.txt"
        destinationFilePath = "destination.txt"

        ' Read the contents of the source file
        fileContents = ReadFile(sourceFilePath)

        ' Write the contents to the destination file
        WriteFile(destinationFilePath, fileContents)

        ' Display a message to indicate that the file has been copied
        Console.WriteLine("File copied successfully.")
    End Sub

    ' Function to read the contents of a file
    Function ReadFile(filePath As String) As String
        Dim fileReader As System.IO.StreamReader
        Dim contents As String

        ' Open the file for reading
        fileReader = My.Computer.FileSystem.OpenTextFileReader(filePath)

        ' Read the contents of the file
        contents = fileReader.ReadToEnd()

        ' Close the file
        fileReader.Close()

        ' Return the contents of the file
        Return contents
    End Function

    ' Function to write contents to a file
    Sub WriteFile(filePath As String, contents As String)
        Dim fileWriter As System.IO.StreamWriter

        ' Open the file for writing
        fileWriter = My.Computer.FileSystem.OpenTextFileWriter(filePath, False)

        ' Write the contents to the file
        fileWriter.Write(contents)

        ' Close the file
        fileWriter.Close()
    End Sub

End Module

