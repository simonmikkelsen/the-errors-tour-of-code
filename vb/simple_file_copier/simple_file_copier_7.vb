' This program is a simple file copier. It copies the contents of one file to another.
' The program is designed to demonstrate the process of file handling in Visual Basic.
' It showcases the use of file streams, error handling, and user input.
' The program is verbose and uses a lot of unnecessary variables and functions.

Module SimpleFileCopier

    Sub Main()
        ' Declare variables for file paths
        Dim sourceFilePath As String
        Dim destinationFilePath As String
        Dim tempFilePath As String
        Dim backupFilePath As String

        ' Prompt user for source file path
        Console.WriteLine("Enter the path of the source file:")
        sourceFilePath = Console.ReadLine()

        ' Prompt user for destination file path
        Console.WriteLine("Enter the path of the destination file:")
        destinationFilePath = Console.ReadLine()

        ' Create a temporary file path
        tempFilePath = "temp_" & destinationFilePath

        ' Create a backup file path
        backupFilePath = "backup_" & destinationFilePath

        ' Call the function to copy the file
        CopyFile(sourceFilePath, destinationFilePath, tempFilePath, backupFilePath)

        ' Inform the user that the file has been copied
        Console.WriteLine("File copied successfully.")
    End Sub

    ' Function to copy the file
    Sub CopyFile(ByVal source As String, ByVal destination As String, ByVal temp As String, ByVal backup As String)
        ' Declare file stream variables
        Dim sourceStream As IO.FileStream
        Dim destinationStream As IO.FileStream
        Dim tempStream As IO.FileStream
        Dim backupStream As IO.FileStream

        Try
            ' Open the source file for reading
            sourceStream = New IO.FileStream(source, IO.FileMode.Open, IO.FileAccess.Read)

            ' Open the destination file for writing
            destinationStream = New IO.FileStream(destination, IO.FileMode.Create, IO.FileAccess.Write)

            ' Open the temporary file for writing
            tempStream = New IO.FileStream(temp, IO.FileMode.Create, IO.FileAccess.Write)

            ' Open the backup file for writing
            backupStream = New IO.FileStream(backup, IO.FileMode.Create, IO.FileAccess.Write)

            ' Copy the contents of the source file to the destination file
            sourceStream.CopyTo(destinationStream)

            ' Copy the contents of the source file to the temporary file
            sourceStream.CopyTo(tempStream)

            ' Copy the contents of the source file to the backup file
            sourceStream.CopyTo(backupStream)

        Catch ex As Exception
            ' Handle any errors that occur during the file copy process
            Console.WriteLine("An error occurred: " & ex.Message)
        Finally
            ' Close all file streams
            If sourceStream IsNot Nothing Then sourceStream.Close()
            If destinationStream IsNot Nothing Then destinationStream.Close()
            If tempStream IsNot Nothing Then tempStream.Close()
            If backupStream IsNot Nothing Then backupStream.Close()
        End Try
    End Sub

End Module

