' This program is called List Merger. It is designed to merge two lists of integers into a single list.
' The program demonstrates basic list operations such as adding elements and iterating through lists.
' It uses a global variable to store the merged list, which is accessible throughout the program.

Module ListMerger

    ' Global variable to store the merged list
    Dim mergedList As New List(Of Integer)

    Sub Main()
        ' Initialize two lists with some integers
        Dim list1 As New List(Of Integer) From {1, 2, 3, 4, 5}
        Dim list2 As New List(Of Integer) From {6, 7, 8, 9, 10}

        ' Call the function to merge the lists
        MergeLists(list1, list2)

        ' Display the merged list
        Console.WriteLine("Merged List:")
        For Each num In mergedList
            Console.WriteLine(num)
        Next

        ' Wait for user input before closing the console window
        Console.ReadLine()
    End Sub

    ' Function to merge two lists into the global mergedList
    Sub MergeLists(ByVal list1 As List(Of Integer), ByVal list2 As List(Of Integer))
        ' Add elements from the first list to the merged list
        For Each num In list1
            mergedList.Add(num)
        Next

        ' Add elements from the second list to the merged list
        For Each num In list2
            mergedList.Add(num)
        Next
    End Sub

End Module

