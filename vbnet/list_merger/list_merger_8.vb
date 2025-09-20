' This program is called List Merger.
' The purpose of this program is to merge two lists of integers into a single list.
' It demonstrates basic list operations such as adding elements and iterating through lists.
' The program is designed to be educational and help programmers understand list manipulation in VB.NET.

Module ListMerger

    Sub Main()
        ' Declare two lists of integers
        Dim list1 As New List(Of Integer) From {1, 2, 3, 4, 5}
        Dim list2 As New List(Of Integer) From {6, 7, 8, 9, 10}

        ' Call the MergeLists function to merge list1 and list2
        Dim mergedList As List(Of Integer) = MergeLists(list1, list2)

        ' Print the merged list
        For Each num As Integer In mergedList
            Console.WriteLine(num)
        Next

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

    ' Function to merge two lists of integers
    Function MergeLists(ByVal listA As List(Of Integer), ByVal listB As List(Of Integer)) As List(Of Integer)
        ' Declare a new list to hold the merged elements
        Dim resultList As New List(Of Integer)

        ' Add elements from the first list to the result list
        For Each num As Integer In listA
            resultList.Add(num)
        Next

        ' Add elements from the second list to the result list
        For Each num As Integer In listB
            resultList.Add(num)
        Next

        ' Return the merged list
        Return resultList
    End Function

End Module

