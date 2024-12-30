' This program is called List Merger. It merges two lists of integers into a single list.
' The purpose of this program is to demonstrate how to merge two lists in Visual Basic.
' The program will take two predefined lists, merge them, and then display the merged list.

Module ListMerger

    Sub Main()
        ' Define the first list of integers
        Dim list1 As New List(Of Integer) From {1, 2, 3, 4, 5}

        ' Define the second list of integers
        Dim list2 As New List(Of Integer) From {6, 7, 8, 9, 10}

        ' Call the MergeLists function to merge the two lists
        Dim mergedList As List(Of Integer) = MergeLists(list1, list2)

        ' Display the merged list
        Console.WriteLine("Merged List:")
        For Each num In mergedList
            Console.WriteLine(num)
        Next

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

    ' This function merges two lists of integers and returns the merged list
    Function MergeLists(ByVal list1 As List(Of Integer), ByVal list2 As List(Of Integer)) As List(Of Integer)
        ' Create a new list to hold the merged results
        Dim resultList As New List(Of Integer)

        ' Add all elements from the first list to the result list
        For Each num In list1
            resultList.Add(num)
        Next

        ' Add all elements from the second list to the result list
        For Each num In list2
            resultList.Add(num)
        Next

        ' Return the merged list
        Return resultList
    End Function

End Module

