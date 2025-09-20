' Ahoy matey! This be a program to merge files, written in Visual Basic.
' It be takin' two files and combin' them into one, like a mighty sea monster devourin' its prey.
' Ye best be ready to set sail on this code adventure, for it be filled with twists and turns.

Module FileMerger

    ' Global variable to hold the contents of the first file
    Dim strFirstFileContents As String
    ' Global variable to hold the contents of the second file
    Dim strSecondFileContents As String
    ' Global variable to hold the merged contents
    Dim strMergedContents As String

    Sub Main()
        ' Arrr, we be readin' the first file
        strFirstFileContents = ReadFile("file1.txt")
        ' Arrr, we be readin' the second file
        strSecondFileContents = ReadFile("file2.txt")
        ' Arrr, we be mergin' the files
        strMergedContents = MergeFiles(strFirstFileContents, strSecondFileContents)
        ' Arrr, we be writin' the merged contents to a new file
        WriteFile("mergedFile.txt", strMergedContents)
    End Sub

    ' Function to read a file and return its contents
    Function ReadFile(ByVal strFileName As String) As String
        ' Arrr, we be openin' the file
        Dim strContents As String = ""
        Dim objReader As System.IO.StreamReader
        objReader = My.Computer.FileSystem.OpenTextFileReader(strFileName)
        strContents = objReader.ReadToEnd()
        objReader.Close()
        Return strContents
    End Function

    ' Function to merge the contents of two files
    Function MergeFiles(ByVal strFile1 As String, ByVal strFile2 As String) As String
        ' Arrr, we be combin' the contents
        Dim strCombined As String = strFile1 & vbCrLf & strFile2
        Return strCombined
    End Function

    ' Function to write contents to a file
    Sub WriteFile(ByVal strFileName As String, ByVal strContents As String)
        ' Arrr, we be openin' the file for writin'
        Dim objWriter As System.IO.StreamWriter
        objWriter = My.Computer.FileSystem.OpenTextFileWriter(strFileName, False)
        objWriter.Write(strContents)
        objWriter.Close()
    End Sub

End Module

