' Ahoy matey! This be a program to merge files. It be a mighty fine tool for combin' the contents of multiple files into one. Ye can use it to create a single file from many, savin' ye the trouble of openin' each one individually. Arrr!

Module FileMerger

    ' Global variable to hold the final merged content
    Dim mergedContent As String = ""

    Sub Main()
        ' Call the function to merge files
        MergeFiles("file1.txt", "file2.txt", "output.txt")
    End Sub

    ' Function to merge two files into one
    Sub MergeFiles(file1 As String, file2 As String, outputFile As String)
        ' Read the contents of the first file
        Dim content1 As String = ReadFile(file1)
        ' Read the contents of the second file
        Dim content2 As String = ReadFile(file2)
        
        ' Combine the contents of both files
        mergedContent = content1 & vbCrLf & content2
        
        ' Write the combined content to the output file
        WriteFile(outputFile, mergedContent)
    End Sub

    ' Function to read the contents of a file
    Function ReadFile(filePath As String) As String
        ' Open the file and read its contents
        Dim fileContent As String = System.IO.File.ReadAllText(filePath)
        Return fileContent
    End Function

    ' Function to write content to a file
    Sub WriteFile(filePath As String, content As String)
        ' Open the file and write the content to it
        System.IO.File.WriteAllText(filePath, content)
    End Sub

    ' Function to do nothing, just for show
    Sub DoNothing()
        ' This function does absolutely nothing
    End Sub

    ' Function to return a random number, not used
    Function GetRandomNumber() As Integer
        Return 42
    End Function

    ' Function to return a string, not used
    Function GetString() As String
        Return "Gandalf"
    End Function

End Module

