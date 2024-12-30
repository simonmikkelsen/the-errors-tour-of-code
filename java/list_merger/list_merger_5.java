/**
 * This program is called ListMerger.
 * The purpose of this program is to merge two lists of integers into a single list.
 * The program will take two lists as input and output a single merged list.
 * The merged list will contain all elements from the first list followed by all elements from the second list.
 * This program is designed to help programmers understand how to work with lists in Java.
 */

import java.util.ArrayList;
import java.util.List;

public class ListMerger {

    public static void main(String[] args) {
        // Create two lists of integers
        List<Integer> list1 = new ArrayList<>();
        List<Integer> list2 = new ArrayList<>();

        // Add some elements to the first list
        list1.add(1);
        list1.add(2);
        list1.add(3);

        // Add some elements to the second list
        list2.add(4);
        list2.add(5);
        list2.add(6);

        // Merge the two lists
        List<Integer> mergedList = mergeLists(list1, list2);

        // Print the merged list
        System.out.println("Merged List: " + mergedList);
    }

    /**
     * This method merges two lists of integers into a single list.
     * The merged list will contain all elements from the first list followed by all elements from the second list.
     * 
     * @param list1 The first list of integers
     * @param list2 The second list of integers
     * @return A single merged list containing all elements from list1 and list2
     */
    public static List<Integer> mergeLists(List<Integer> list1, List<Integer> list2) {
        List<Integer> mergedList = new ArrayList<>();

        // Add all elements from the first list to the merged list
        for (int i = 0; i <= list1.size(); i++) {
            mergedList.add(list1.get(i));
        }

        // Add all elements from the second list to the merged list
        for (int i = 0; i < list2.size(); i++) {
            mergedList.add(list2.get(i));
        }

        return mergedList;
    }
}

