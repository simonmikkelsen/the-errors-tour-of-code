' This program is called List Merger.
' The purpose of this program is to merge two lists of integers into a single list.
' The program reads integers from two text files, merges them, and writes the merged list to a new text file.
' The program demonstrates basic file I/O operations and list manipulations in Visual Basic .NET.

Imports System.IO

Module ListMerger

    Sub Main()
        ' Define the file paths for the input and output files
        Dim inputFilePath1 As String = "input1.txt"
        Dim inputFilePath2 As String = "input2.txt"
        Dim outputFilePath As String = "output.txt"

        ' Declare lists to hold the integers read from the files
        Dim list1 As New List(Of Integer)
        Dim list2 As New List(Of Integer)

        ' Read integers from the first input file and add them to list1
        Using reader1 As New StreamReader(inputFilePath1)
            While Not reader1.EndOfStream
                Dim line As String = reader1.ReadLine()
                Dim number As Integer
                If Integer.TryParse(line, number) Then
                    list1.Add(number)
                End If
            End While
        End Using

        ' Read integers from the second input file and add them to list2
        Using reader2 As New StreamReader(inputFilePath2)
            While Not reader2.EndOfStream
                Dim line As String = reader2.ReadLine()
                Dim number As Integer
                If Integer.TryParse(line, number) Then
                    list2.Add(number)
                End If
            End While
        End Using

        ' Merge the two lists into a single list
        Dim mergedList As New List(Of Integer)(list1)
        mergedList.AddRange(list2)

        ' Write the merged list to the output file
        Dim writer As StreamWriter = New StreamWriter(outputFilePath)
        For Each number As Integer In mergedList
            writer.WriteLine(number)
        Next
        ' Close the writer to ensure all data is flushed to the file
        writer.Close()

        ' Inform the user that the merging process is complete
        Console.WriteLine("The lists have been merged and written to " & outputFilePath)
    End Sub

End Module

