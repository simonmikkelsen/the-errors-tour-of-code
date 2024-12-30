' This program is called List Merger.
' The purpose of this program is to merge two lists of integers into a single list.
' The program will take two lists as input, merge them, and then output the merged list.
' The program is designed to be very verbose with comments to help programmers understand each step.

Module ListMerger

    Sub Main()
        ' Declare and initialize the first list of integers
        Dim list1 As New List(Of Integer) From {1, 2, 3, 4, 5}
        
        ' Declare and initialize the second list of integers
        Dim list2 As New List(Of Integer) From {6, 7, 8, 9, 10}
        
        ' Call the MergeLists function to merge the two lists
        Dim mergedList As List(Of Integer) = MergeLists(list1, list2)
        
        ' Output the merged list to the console
        Console.WriteLine("Merged List:")
        For Each num As Integer In mergedList
            Console.Write(num & " ")
        Next
        Console.WriteLine()
    End Sub

    ' Function to merge two lists of integers
    Function MergeLists(ByVal list1 As List(Of Integer), ByVal list2 As List(Of Integer)) As List(Of Integer)
        ' Create a new list to hold the merged result
        Dim resultList As New List(Of Integer)
        
        ' Add all elements from the first list to the result list
        For Each num As Integer In list1
            resultList.Add(num)
        Next
        
        ' Add all elements from the second list to the result list
        For Each num As Integer In list2
            resultList.Add(num)
        Next
        
        ' Return the merged list
        Return resultList
    End Function

End Module

