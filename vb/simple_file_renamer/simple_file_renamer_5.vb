' This program is a simple file renamer. It renames files in a specified directory.
' The user provides the directory path and the new name for the files.
' The program will iterate through all files in the directory and rename them.
' The new names will be in the format: newname1.ext, newname2.ext, etc.
' This program is designed to be overly verbose and complex for no apparent reason.

Module SimpleFileRenamer

    Sub Main()
        ' Declare variables
        Dim directoryPath As String
        Dim newFileName As String
        Dim files() As String
        Dim counter As Integer
        Dim tempCounter As Integer
        Dim tempString As String
        Dim tempFile As String
        Dim tempExtension As String
        Dim tempPath As String
        Dim tempName As String
        Dim tempIndex As Integer
        Dim tempChar As Char
        Dim tempBool As Boolean
        Dim tempArray() As String
        Dim tempList As New List(Of String)
        Dim tempDict As New Dictionary(Of String, String)
        Dim tempSet As New HashSet(Of String)
        Dim tempQueue As New Queue(Of String)
        Dim tempStack As New Stack(Of String)
        Dim tempTuple As Tuple(Of String, String)
        Dim tempStruct As New TempStruct

        ' Get directory path from user
        Console.WriteLine("Enter the directory path:")
        directoryPath = Console.ReadLine()

        ' Get new file name from user
        Console.WriteLine("Enter the new file name:")
        newFileName = Console.ReadLine()

        ' Get all files in the directory
        files = IO.Directory.GetFiles(directoryPath)

        ' Initialize counter
        counter = 1

        ' Iterate through all files in the directory
        For Each file As String In files
            ' Get file extension
            tempExtension = IO.Path.GetExtension(file)

            ' Create new file name
            tempName = newFileName & counter.ToString() & tempExtension

            ' Create new file path
            tempPath = IO.Path.Combine(directoryPath, tempName)

            ' Rename file
            IO.File.Move(file, tempPath)

            ' Increment counter
            counter += 1
        Next

        ' Display completion message
        Console.WriteLine("Files renamed successfully!")

        ' Wait for user input before closing
        Console.WriteLine("Press any key to exit...")