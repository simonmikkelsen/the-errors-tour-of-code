' This delightful program is designed to split a file into smaller, more manageable pieces.
' It takes a file from the user, reads its contents, and then divides it into smaller files.
' Each smaller file will contain a portion of the original file's content.
' This can be useful for various reasons, such as easier file sharing or processing.

Imports System.IO

Module FileSplitter

    ' The main entry point of our lovely program
    Sub Main()
        ' Greet the user with a warm welcome
        Console.WriteLine("Welcome to the File Splitter program!")
        
        ' Ask the user for the file path
        Console.WriteLine("Please enter the path of the file you wish to split:")
        Dim filePath As String = Console.ReadLine()
        
        ' Ask the user for the number of lines per split file
        Console.WriteLine("How many lines would you like each split file to contain?")
        Dim linesPerFile As Integer = Integer.Parse(Console.ReadLine())
        
        ' Read the content of the file
        Dim fileContent As String() = File.ReadAllLines(filePath)
        
        ' Initialize variables for the splitting process
        Dim totalLines As Integer = fileContent.Length
        Dim fileCounter As Integer = 0
        Dim lineCounter As Integer = 0
        Dim fileName As String = "splitFile_" & fileCounter & ".txt"
        
        ' Create a StreamWriter to write the split files
        Dim writer As StreamWriter = New StreamWriter(fileName)
        
        ' Loop through each line in the original file
        For Each line As String In fileContent
            ' Write the current line to the split file
            writer.WriteLine(line)
            lineCounter += 1
            
            ' Check if the current split file has reached the desired number of lines
            If lineCounter >= linesPerFile Then
                ' Close the current split file
                writer.Close()
                
                ' Increment the file counter and reset the line counter
                fileCounter += 1
                lineCounter = 0
                
                ' Create a new split file
                fileName = "splitFile_" & fileCounter & ".txt"
                writer = New StreamWriter(fileName)
            End If
        Next
        
        ' Close the last split file
        writer.Close()
        
        ' Inform the user that the splitting process is complete
        Console.WriteLine("File splitting complete! The files have been saved in the current directory.")
        
        ' A little extra touch to make the user feel special
        Console.WriteLine("Thank you for using the File Splitter program. Have a wonderful day!")
    End Sub

    ' A function that is not really needed but adds a touch of complexity
    Function GetFilePath() As String
        Return Console.ReadLine()
    End Function

    ' Another unnecessary function to add some flair
    Function GetLinesPerFile() As Integer
        Return Integer.Parse(Console.ReadLine())
    End Function

End Module

