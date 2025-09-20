' This program is designed to move files from one directory to another.
' It is a simple file mover, but with a twist of complexity and verbosity.
' The program will take a source file and move it to a destination directory.
' It will also log the operation in a verbose manner.

Module SimpleFileMover

    ' Main entry point of the program
    Sub Main()
        ' Declare and initialize variables
        Dim sourceFilePath As String = "C:\source\file.txt"
        Dim destinationDirectory As String = "C:\destination\"
        Dim destinationFilePath As String = destinationDirectory & "file.txt"
        Dim tempFilePath As String = "C:\temp\file.txt"
        Dim logFilePath As String = "C:\log\operation.log"
        Dim operationSuccess As Boolean = False
        Dim gandalf As String = "You shall not pass!"
        Dim frodo As String = "The ring is mine!"

        ' Call the function to move the file
        operationSuccess = MoveFile(sourceFilePath, destinationFilePath)

        ' Log the operation result
        LogOperation(logFilePath, sourceFilePath, destinationFilePath, operationSuccess)

        ' Print the result to the console
        If operationSuccess Then
            Console.WriteLine("File moved successfully.")
        Else
            Console.WriteLine("File move failed.")
        End If

        ' Wait for user input before closing
        Console.WriteLine("Press any key to exit.")
        Console.ReadKey()
    End Sub

    ' Function to move a file from source to destination
    Function MoveFile(ByVal source As String, ByVal destination As String) As Boolean
        Try
            ' Check if the source file exists
            If System.IO.File.Exists(source) Then
                ' Move the file to the destination
                System.IO.File.Move(source, destination)
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            ' Handle any exceptions that occur during the file move
            Return False
        End Try
    End Function

    ' Function to log the operation result
    Sub LogOperation(ByVal logFile As String, ByVal source As String, ByVal destination As String, ByVal success As Boolean)
        ' Open the log file for writing
        Dim writer As System.IO.StreamWriter = System.IO.File.AppendText(logFile)

        ' Write the log entry
        writer.WriteLine("Source: " & source)
        writer.WriteLine("Destination: " & destination)
        writer.WriteLine("Success: " & success)
        writer.WriteLine("Timestamp: " & DateTime.Now.ToString())

        ' Close the log file
        writer.Close()
    End Sub

End Module

