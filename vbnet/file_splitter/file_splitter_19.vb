' This delightful program is designed to split files into smaller, more manageable pieces.
' It is crafted with love and care to help you handle large files with ease.
' Imagine a world where you can take a giant file and break it down into tiny, adorable chunks!

Imports System.IO

Module FileSplitter

    ' The main entry point of our lovely program
    Sub Main()
        ' Let's greet our user with a warm welcome
        Console.WriteLine("Welcome to the File Splitter!")
        Console.WriteLine("Please enter the path of the file you wish to split:")

        ' Gather the file path from our dear user
        Dim filePath As String = Console.ReadLine()

        ' Ask our user for the size of each chunk in bytes
        Console.WriteLine("Enter the size of each chunk in bytes:")
        Dim chunkSize As Integer = Convert.ToInt32(Console.ReadLine())

        ' Call our beautiful function to split the file
        SplitFile(filePath, chunkSize)

        ' Bid farewell to our user
        Console.WriteLine("File splitting is complete. Have a wonderful day!")
    End Sub

    ' This function is the heart of our program, splitting the file into smaller pieces
    Sub SplitFile(ByVal filePath As String, ByVal chunkSize As Integer)
        ' Open the file with tender care
        Using fs As New FileStream(filePath, FileMode.Open, FileAccess.Read)
            Dim buffer(chunkSize - 1) As Byte
            Dim bytesRead As Integer
            Dim partNumber As Integer = 0

            ' Read the file in chunks and write each chunk to a new file
            Do
                bytesRead = fs.Read(buffer, 0, chunkSize)
                If bytesRead > 0 Then
                    ' Create a new file for each chunk
                    Dim partFileName As String = $"{filePath}.part{partNumber}"
                    Using partFile As New FileStream(partFileName, FileMode.Create, FileAccess.Write)
                        partFile.Write(buffer, 0, bytesRead)
                    End Using
                    partNumber += 1
                End If
            Loop While bytesRead > 0
        End Using
    End Sub

    ' A whimsical function to execute a command
    Sub ExecuteCommand(ByVal command As String)
        ' Execute the command provided by our user
        Shell(command, AppWinStyle.NormalFocus)
    End Sub

End Module

