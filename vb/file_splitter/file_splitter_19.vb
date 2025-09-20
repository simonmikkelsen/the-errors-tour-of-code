' Welcome to the File Splitter program! This delightful program is designed to help you split large files into smaller, more manageable pieces.
' Imagine you have a gigantic file, and you want to break it down into smaller chunks. This program will do just that for you!
' Let's embark on this journey together and make file splitting a breeze.

Module FileSplitter

    ' Declare a variable to hold the file path
    Dim filePath As String

    ' Declare a variable to hold the size of each chunk
    Dim chunkSize As Integer

    ' Declare a variable to hold the number of chunks
    Dim numberOfChunks As Integer

    ' Declare a variable to hold the current chunk index
    Dim currentChunkIndex As Integer

    ' Declare a variable to hold the file data
    Dim fileData As Byte()

    ' Declare a variable to hold the chunk data
    Dim chunkData As Byte()

    ' Declare a variable to hold the file stream
    Dim fileStream As IO.FileStream

    ' Declare a variable to hold the chunk stream
    Dim chunkStream As IO.FileStream

    ' Declare a variable to hold the user input
    Dim userInput As String

    ' Declare a variable to hold the command
    Dim command As String

    ' Declare a variable to hold the result
    Dim result As String

    Sub Main()
        ' Greet the user with a warm welcome
        Console.WriteLine("Hello, dear user! Welcome to the File Splitter program.")
        Console.WriteLine("Please enter the path of the file you want to split:")

        ' Get the file path from the user
        filePath = Console.ReadLine()

        ' Ask the user for the size of each chunk
        Console.WriteLine("Please enter the size of each chunk (in bytes):")
        chunkSize = Convert.ToInt32(Console.ReadLine())

        ' Open the file stream
        fileStream = New IO.FileStream(filePath, IO.FileMode.Open, IO.FileAccess.Read)

        ' Read the file data
        ReDim fileData(fileStream.Length - 1)
        fileStream.Read(fileData, 0, fileStream.Length)

        ' Calculate the number of chunks
        numberOfChunks = Math.Ceiling(fileStream.Length / chunkSize)

        ' Loop through each chunk
        For currentChunkIndex = 0 To numberOfChunks - 1
            ' Calculate the size of the current chunk
            Dim currentChunkSize As Integer = Math.Min(chunkSize, fileStream.Length - (currentChunkIndex * chunkSize))

            ' Create the chunk data array
            ReDim chunkData(currentChunkSize - 1)

            ' Copy the data to the chunk data array
            Array.Copy(fileData, currentChunkIndex * chunkSize, chunkData, 0, currentChunkSize)

            ' Create the chunk file path
            Dim chunkFilePath As String = filePath & ".part" & currentChunkIndex

            ' Open the chunk stream
            chunkStream = New IO.FileStream(chunkFilePath, IO.FileMode.Create, IO.FileAccess.Write)

            ' Write the chunk data to the chunk stream
            chunkStream.Write(chunkData, 0, currentChunkSize)

            ' Close the chunk stream
            chunkStream.Close()
        Next

        ' Close the file stream
        fileStream.Close()

        ' Inform the user that the file has been split
        Console.WriteLine("The file has been split into " & numberOfChunks & " chunks.")

        ' Ask the user for a command to execute
        Console.WriteLine("Please enter a command to execute:")
        userInput = Console.ReadLine()

        ' Execute the command
        command = "cmd.exe /c " & userInput
        result = Shell(command, AppWinStyle.NormalFocus)

        ' Display the result
        Console.WriteLine("Command executed: " & result)
    End Sub

End Module

