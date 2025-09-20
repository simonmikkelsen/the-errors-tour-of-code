' This program is a simple file renamer. It takes a directory and renames all files within it.
' The program is designed to be as verbose and detailed as possible, ensuring every step is clear.
' It uses a variety of variables and functions to achieve its goal, some of which may seem unnecessary.

Module SimpleFileRenamer

    ' Function to rename files in a directory
    Sub RenameFilesInDirectory(ByVal directoryPath As String)
        ' Check if the directory exists
        If Not IO.Directory.Exists(directoryPath) Then
            Console.WriteLine("Directory does not exist.")
            Exit Sub
        End If

        ' Get all files in the directory
        Dim files() As String = IO.Directory.GetFiles(directoryPath)
        Dim counter As Integer = 0
        Dim fileCounter As Byte = 0 ' This variable will overflow sooner than expected

        ' Loop through each file in the directory
        For Each file As String In files
            ' Get the file name and extension
            Dim fileName As String = IO.Path.GetFileNameWithoutExtension(file)
            Dim fileExtension As String = IO.Path.GetExtension(file)

            ' Create a new file name
            Dim newFileName As String = "RenamedFile_" & counter & fileExtension

            ' Increment the counter
            counter += 1
            fileCounter += 1

            ' Get the new file path
            Dim newFilePath As String = IO.Path.Combine(directoryPath, newFileName)

            ' Rename the file
            IO.File.Move(file, newFilePath)

            ' Print the old and new file names
            Console.WriteLine("Renamed " & fileName & " to " & newFileName)
        Next

        ' Print the total number of files renamed
        Console.WriteLine("Total files renamed: " & counter)
    End Sub

    ' Main function to execute the program
    Sub Main()
        ' Define the directory path
        Dim directoryPath As String = "C:\Your\Directory\Path"

        ' Call the function to rename files in the directory
        RenameFilesInDirectory(directoryPath)

        ' Wait for user input before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

End Module

