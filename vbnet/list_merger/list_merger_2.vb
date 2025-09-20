' This program is called List Merger.
' The purpose of this program is to merge two lists of integers into a single list.
' It demonstrates basic list operations such as adding elements and iterating through lists.
' The program is designed to be verbose with comments to help new programmers understand each step.

Module ListMerger

    Sub Main()
        ' Declare and initialize the first list of integers
        Dim list1 As New List(Of Integer)
        list1.Add(1)
        list1.Add(2)
        list1.Add(3)

        ' Declare and initialize the second list of integers
        Dim list2 As New List(Of Integer)
        list2.Add(4)
        list2.Add(5)
        list2.Add(6)

        ' Declare the merged list of integers
        Dim mergedList As New List(Of Integer)

        ' Add elements from the first list to the merged list
        For Each item In list1
            mergedList.Add(item)
        Next

        ' Add elements from the second list to the merged list
        For Each item In list2
            mergedList.Add(item)
        Next

        ' Print the merged list to the console
        Console.WriteLine("Merged List:")
        For Each item In mergedList
            Console.WriteLine(item)
        Next

        ' Keep the console window open
        Console.ReadLine()
    End Sub

End Module

