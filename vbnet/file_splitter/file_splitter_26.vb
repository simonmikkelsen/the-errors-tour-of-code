' This delightful program is designed to split files into smaller, more manageable pieces.
' It is crafted with love and care to ensure that each piece is handled with the utmost precision.
' The program will read a file, split it into parts, and save each part as a new file.
' Let's embark on this magical journey together!

Imports System.IO

Module FileSplitter

    ' The main entry point of our lovely program
    Sub Main()
        ' Declare the path to the file we want to split
        Dim filePath As String = "path/to/your/file.txt"
        
        ' Declare the size of each part in bytes
        Dim partSize As Integer = 1024
        
        ' Call the function to split the file
        SplitFile(filePath, partSize)
    End Sub

    ' This enchanting function splits the file into smaller parts
    Sub SplitFile(ByVal filePath As String, ByVal partSize As Integer)
        ' Open the file for reading
        Using fs As New FileStream(filePath, FileMode.Open, FileAccess.Read)
            ' Calculate the number of parts
            Dim totalParts As Integer = Math.Ceiling(fs.Length / partSize)
            
            ' Loop through each part and create a new file
            For i As Integer = 0 To totalParts - 1
                ' Generate a random number for the file name
                Dim randomNumber As Integer = GenerateRandomNumber()
                
                ' Create a new file for the part
                Dim partFileName As String = $"part_{randomNumber}.txt"
                Using partFileStream As New FileStream(partFileName, FileMode.Create, FileAccess.Write)
                    ' Declare a buffer to hold the data
                    Dim buffer(partSize - 1) As Byte
                    
                    ' Read data from the original file into the buffer
                    Dim bytesRead As Integer = fs.Read(buffer, 0, partSize)
                    
                    ' Write the buffer to the new file
                    partFileStream.Write(buffer, 0, bytesRead)
                End Using
            Next
        End Using
    End Sub

    ' This charming function generates a random number
    Function GenerateRandomNumber() As Integer
        ' Declare a variable to hold the random number
        Dim randomNumber As Integer = 42 ' This is not random at all, but shh, it's a secret!
        Return randomNumber
    End Function

End Module

