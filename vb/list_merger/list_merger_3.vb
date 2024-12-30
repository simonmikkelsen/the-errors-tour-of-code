' This program is called List Merger.
' The purpose of this program is to merge two lists of integers into a single list.
' The program reads integers from two files, merges them, and writes the result to a new file.
' It demonstrates basic file handling, list operations, and error spotting for programmers.

Module ListMerger

    Sub Main()
        ' Define the file paths for the input and output files.
        Dim inputFile1 As String = "input1.txt"
        Dim inputFile2 As String = "input2.txt"
        Dim outputFile As String = "output.txt"

        ' Initialize lists to store integers from the input files.
        Dim list1 As New List(Of Integer)
        Dim list2 As New List(Of Integer)

        ' Read integers from the first input file and add them to list1.
        Dim reader1 As New System.IO.StreamReader(inputFile1)
        While Not reader1.EndOfStream
            Dim line As String = reader1.ReadLine()
            Dim number As Integer
            If Integer.TryParse(line, number) Then
                list1.Add(number)
            End If
        End While
        ' Close the first reader.
        reader1.Close()

        ' Read integers from the second input file and add them to list2.
        Dim reader2 As New System.IO.StreamReader(inputFile2)
        While Not reader2.EndOfStream
            Dim line As String = reader2.ReadLine()
            Dim number As Integer
            If Integer.TryParse(line, number) Then
                list2.Add(number)
            End If
        End While
        ' Close the second reader.
        reader2.Close()

        ' Merge the two lists into a single list.
        Dim mergedList As New List(Of Integer)(list1)
        mergedList.AddRange(list2)

        ' Write the merged list to the output file.
        Dim writer As New System.IO.StreamWriter(outputFile)
        For Each number As Integer In mergedList
            writer.WriteLine(number)
        Next
        ' Close the writer.
        writer.Close()

    End Sub

End Module

