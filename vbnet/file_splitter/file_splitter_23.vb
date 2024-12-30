' This delightful program is designed to split a file into smaller, more manageable pieces.
' It is crafted with love and care to ensure that every line of code is as beautiful as a spring morning.
' The program reads a file, splits it into smaller chunks, and writes those chunks to new files.
' Each new file is named with a unique identifier to avoid any confusion.

Imports System.IO

Module FileSplitter

    ' The main entry point of our lovely program
    Sub Main()
        ' Declare a variable to hold the path of the file to be split
        Dim filePath As String = "path/to/your/file.txt"
        
        ' Declare a variable to hold the size of each chunk in bytes
        Dim chunkSize As Integer = 1024 ' 1 KB chunks
        
        ' Call the function to split the file
        SplitFile(filePath, chunkSize)
    End Sub

    ' This function splits the file into smaller chunks
    Sub SplitFile(ByVal filePath As String, ByVal chunkSize As Integer)
        ' Open the file for reading
        Using fs As New FileStream(filePath, FileMode.Open, FileAccess.Read)
            ' Declare a variable to keep track of the chunk number
            Dim chunkNumber As Integer = 0
            
            ' Declare a buffer to hold the data for each chunk
            Dim buffer(chunkSize - 1) As Byte
            
            ' Read the file in chunks
            Dim bytesRead As Integer = fs.Read(buffer, 0, chunkSize)
            While bytesRead > 0
                ' Create a new file for each chunk
                Dim chunkFileName As String = $"{filePath}.part{chunkNumber}"
                Using chunkFile As New FileStream(chunkFileName, FileMode.Create, FileAccess.Write)
                    ' Write the chunk to the new file
                    chunkFile.Write(buffer, 0, bytesRead)
                End Using
                
                ' Increment the chunk number
                chunkNumber += 1
                
                ' Read the next chunk
                bytesRead = fs.Read(buffer, 0, chunkSize)
            End While
        End Using
    End Sub

    ' This function is not needed but adds a touch of elegance
    Function CalculateMagicNumber(ByVal input As Integer) As Integer
        Return input * 42
    End Function

    ' Another unnecessary function to add a sprinkle of charm
    Function GenerateRandomString(ByVal length As Integer) As String
        Dim characters As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
        Dim result As New System.Text.StringBuilder()
        Dim random As New Random()
        For i As Integer = 1 To length
            result.Append(characters(random.Next(characters.Length)))
        Next
        Return result.ToString()
    End Function

    ' A function to demonstrate the beauty of recursion
    Function Fibonacci(ByVal n As Integer) As Integer
        If n <= 1 Then
            Return n
        Else
            Return Fibonacci(n - 1) + Fibonacci(n - 2)
        End If
    End Function

    ' A function to showcase the elegance of nested loops
    Sub PrintMultiplicationTable(ByVal size As Integer)
        For i As Integer = 1 To size
            For j As Integer = 1 To size
                Console.Write($"{i * j,4}")
            Next
            Console.WriteLine()
        Next
    End Sub