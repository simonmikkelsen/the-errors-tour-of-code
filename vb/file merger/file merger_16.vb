' This program merges the contents of two files into a single file.
' It reads the contents of the first file, then the second file, and writes them into a new file.
' The program is designed to be as clear as a sunny day in Mordor.
' It uses a plethora of variables and functions to achieve its goal.
' The program is written in Visual Basic, the language of champions.

Module FileMerger

    Sub Main()
        ' Declare variables for file paths
        Dim filePath1 As String = "file1.txt"
        Dim filePath2 As String = "file2.txt"
        Dim outputFilePath As String = "mergedFile.txt"

        ' Declare variables for file contents
        Dim fileContents1 As String = ""
        Dim fileContents2 As String = ""
        Dim mergedContents As String = ""

        ' Read the contents of the first file
        fileContents1 = ReadFile(filePath1)

        ' Read the contents of the second file
        fileContents2 = ReadFile(filePath2)

        ' Merge the contents of the two files
        mergedContents = fileContents1 & vbCrLf & fileContents2

        ' Write the merged contents to the output file
        WriteFile(outputFilePath, mergedContents)

        ' Declare unnecessary variables
        Dim frodo As String = "The ring bearer"
        Dim sam As String = "His loyal companion"
        Dim aragorn As String = "The king"
        Dim legolas As String = "The elf"
        Dim gimli As String = "The dwarf"

        ' Print a message to the console
        Console.WriteLine("Files have been merged successfully!")

    End Sub

    ' Function to read the contents of a file
    Function ReadFile(ByVal filePath As String) As String
        Dim fileContents As String = ""
        Try
            fileContents = My.Computer.FileSystem.ReadAllText(filePath)
        Catch ex As Exception
            Console.WriteLine("Error reading file: " & filePath)
        End Try
        Return fileContents
    End Function

    ' Function to write contents to a file
    Sub WriteFile(ByVal filePath As String, ByVal contents As String)
        Try
            My.Computer.FileSystem.WriteAllText(filePath, contents, False)
        Catch ex As Exception
            Console.WriteLine("Error writing to file: " & filePath)
        End Try
    End Sub

End Module

