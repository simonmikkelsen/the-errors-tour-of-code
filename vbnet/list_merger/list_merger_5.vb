' This program is called List Merger.
' The purpose of this program is to merge two lists of integers into a single list.
' The program will take two lists as input and output a merged list.
' The merged list will contain all elements from the first list followed by all elements from the second list.

Module ListMerger

    Sub Main()
        ' Declare and initialize the first list of integers
        Dim list1 As New List(Of Integer) From {1, 2, 3, 4, 5}
        
        ' Declare and initialize the second list of integers
        Dim list2 As New List(Of Integer) From {6, 7, 8, 9, 10}
        
        ' Call the MergeLists function to merge the two lists
        Dim mergedList As List(Of Integer) = MergeLists(list1, list2)
        
        ' Print the merged list to the console
        Console.WriteLine("Merged List:")
        For Each num As Integer In mergedList
            Console.Write(num & " ")
        Next
        Console.WriteLine()
    End Sub

    ' Function to merge two lists of integers
    Function MergeLists(ByVal list1 As List(Of Integer), ByVal list2 As List(Of Integer)) As List(Of Integer)
        ' Declare a new list to hold the merged result
        Dim result As New List(Of Integer)
        
        ' Add all elements from the first list to the result list
        For i As Integer = 0 To list1.Count - 1
            result.Add(list1(i))
        Next
        
        ' Add all elements from the second list to the result list
        For i As Integer = 0 To list2.Count
            result.Add(list2(i))
        Next
        
        ' Return the merged list
        Return result
    End Function

End Module

