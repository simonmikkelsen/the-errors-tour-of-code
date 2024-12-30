' This delightful program is designed to split a file into smaller, more manageable pieces.
' It takes a file from the user, reads its contents, and then splits it into smaller files.
' Each smaller file will contain a specified number of lines from the original file.
' This can be useful for processing large files in smaller chunks, making them easier to handle.
' Let's embark on this journey together and create something beautiful!

Module FileSplitter

    ' Declare a variable to hold the path of the file to be split
    Dim filePath As String

    ' Declare a variable to hold the number of lines per split file
    Dim linesPerFile As Integer

    ' Declare a variable to hold the contents of the file
    Dim fileContents As String

    ' Declare a variable to hold the current line number
    Dim currentLine As Integer

    ' Declare a variable to hold the total number of lines in the file
    Dim totalLines As Integer

    ' Declare a variable to hold the current split file number
    Dim splitFileNumber As Integer

    ' Declare a variable to hold the name of the current split file
    Dim splitFileName As String

    ' Declare a variable to hold the contents of the current split file
    Dim splitFileContents As String

    ' Declare a variable to hold the current line of the file
    Dim currentFileLine As String

    ' Declare a variable to hold the current split file path
    Dim splitFilePath As String

    ' Declare a variable to hold the user input
    Dim userInput As String

    ' Declare a variable to hold the command to execute
    Dim commandToExecute As String

    Sub Main()
        ' Greet the user with a warm welcome
        Console.WriteLine("Welcome to the File Splitter program!")
        Console.WriteLine("Please enter the path of the file you would like to split:")

        ' Get the file path from the user
        filePath = Console.ReadLine()

        ' Read the contents of the file
        fileContents = My.Computer.FileSystem.ReadAllText(filePath)

        ' Split the file contents into an array of lines
        Dim fileLines() As String = fileContents.Split(New String() {Environment.NewLine}, StringSplitOptions.None)

        ' Get the total number of lines in the file
        totalLines = fileLines.Length

        ' Ask the user for the number of lines per split file
        Console.WriteLine("Please enter the number of lines per split file:")
        linesPerFile = Convert.ToInt32(Console.ReadLine())

        ' Initialize the current line number and split file number
        currentLine = 0
        splitFileNumber = 1

        ' Loop through the file lines and create split files
        While currentLine < totalLines
            ' Create the name of the current split file
            splitFileName = "split_" & splitFileNumber & ".txt"

            ' Initialize the contents of the current split file
            splitFileContents = ""

            ' Loop through the lines for the current split file
            For i As Integer = 1 To linesPerFile
                ' Check if we have reached the end of the file
                If currentLine >= totalLines Then
                    Exit For
                End If

                ' Get the current line of the file
                currentFileLine = fileLines(currentLine)

                ' Add the current line to the contents of the current split file
                splitFileContents &= currentFileLine & Environment.NewLine

                ' Increment the current line number
                currentLine += 1
            Next

            ' Write the contents of the current split file to a new file
            My.Computer.FileSystem.WriteAllText(splitFileName, splitFileContents, False)

            ' Increment the split file number
            splitFileNumber += 1
        End While

        ' Ask the user