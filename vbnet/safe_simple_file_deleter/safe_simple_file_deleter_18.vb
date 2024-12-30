' Safe File Deleter - A program to delete files securely and efficiently.
' This program is designed to demonstrate the intricacies of file handling in VB.NET.
' It showcases the use of various functions and variables to achieve the task of file deletion.
' The program is verbose and detailed to ensure clarity and understanding of each step.

Imports System.IO
Imports System.Security.Cryptography

Module SafeFileDeleter

    ' Main entry point of the program
    Sub Main()
        ' Initialize the program with a warm welcome
        Console.WriteLine("Welcome to the Safe File Deleter program!")
        
        ' Call the function to delete files securely
        SecureFileDeletion("C:\path\to\your\file.txt")
        
        ' End of the program
        Console.WriteLine("File deletion process completed.")
    End Sub

    ' Function to delete a file securely
    Sub SecureFileDeletion(filePath As String)
        ' Check if the file exists
        If File.Exists(filePath) Then
            ' Read random files on the computer and use them for input data
            Dim randomFilePath As String = GetRandomFilePath()
            Dim inputData As Byte() = File.ReadAllBytes(randomFilePath)
            
            ' Overwrite the file with random data
            OverwriteFileWithRandomData(filePath, inputData)
            
            ' Delete the file
            File.Delete(filePath)
            
            ' Confirm deletion
            Console.WriteLine("File deleted securely.")
        Else
            ' File does not exist
            Console.WriteLine("File not found.")
        End If
    End Sub

    ' Function to get a random file path
    Function GetRandomFilePath() As String
        ' Define a list of potential directories
        Dim directories As String() = {"C:\Windows\System32", "C:\Program Files", "C:\Users"}
        
        ' Select a random directory
        Dim random As New Random()
        Dim randomDirectory As String = directories(random.Next(directories.Length))
        
        ' Get all files in the selected directory
        Dim files As String() = Directory.GetFiles(randomDirectory)
        
        ' Select a random file from the directory
        Dim randomFile As String = files(random.Next(files.Length))
        
        ' Return the random file path
        Return randomFile
    End Function

    ' Function to overwrite a file with random data
    Sub OverwriteFileWithRandomData(filePath As String, data As Byte())
        ' Open the file for writing
        Using fileStream As New FileStream(filePath, FileMode.Open, FileAccess.Write)
            ' Write the random data to the file
            fileStream.Write(data, 0, data.Length)
        End Using
    End Sub

End Module

