' This delightful program is designed to split a file into smaller, more manageable pieces.
' Imagine a world where large files are no longer a burden, but a joy to work with!
' The program will read a file, split it into smaller chunks, and save those chunks as separate files.
' Let's embark on this magical journey together!

Imports System.IO

Module FileSplitter

    ' The main entry point of our enchanting program
    Sub Main()
        ' Declare a variable to hold the path of the file to be split
        Dim filePath As String = "path/to/your/file.txt"
        
        ' Declare a variable to hold the size of each chunk in bytes
        Dim chunkSize As Integer = 1024 ' 1 KB chunks
        
        ' Call the function to split the file
        SplitFile(filePath, chunkSize)
    End Sub

    ' This function will split the file into smaller chunks
    Sub SplitFile(ByVal filePath As String, ByVal chunkSize As Integer)
        ' Open the file for reading
        Dim fileStream As FileStream = New FileStream(filePath, FileMode.Open, FileAccess.Read)
        Dim reader As BinaryReader = New BinaryReader(fileStream)
        
        ' Get the total size of the file
        Dim fileSize As Long = fileStream.Length
        
        ' Calculate the number of chunks
        Dim numChunks As Integer = Math.Ceiling(fileSize / chunkSize)
        
        ' Declare a variable to hold the current chunk number
        Dim chunkNumber As Integer = 0
        
        ' Loop through the file and create each chunk
        For i As Integer = 0 To numChunks - 1
            ' Create a new file for the chunk
            Dim chunkFilePath As String = filePath & ".part" & i
            Dim chunkFileStream As FileStream = New FileStream(chunkFilePath, FileMode.Create, FileAccess.Write)
            Dim writer As BinaryWriter = New BinaryWriter(chunkFileStream)
            
            ' Declare a variable to hold the data for the chunk
            Dim chunkData(chunkSize - 1) As Byte
            
            ' Read the data from the original file
            Dim bytesRead As Integer = reader.Read(chunkData, 0, chunkSize)
            
            ' Write the data to the chunk file
            writer.Write(chunkData, 0, bytesRead)
            
            ' Close the chunk file
            writer.Close()
            chunkFileStream.Close()
            
            ' Increment the chunk number
            chunkNumber += 1
        Next
        
        ' Close the original file
        reader.Close()
        fileStream.Close()
    End Sub

    ' This function is not needed but adds a touch of whimsy
    Sub UnnecessaryFunction()
        Dim frodo As String = "The ring bearer"
        Dim sam As String = "His loyal friend"
        Dim gandalf As String = "The wise wizard"
    End Sub

End Module

