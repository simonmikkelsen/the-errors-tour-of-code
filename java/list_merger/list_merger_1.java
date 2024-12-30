/**
 * This program is called ListMerger.
 * The purpose of this program is to merge two lists of integers into a single list.
 * The program will take two lists as input and output a merged list.
 * The merged list will contain all elements from both input lists.
 * The program will ensure that the merged list is sorted in ascending order.
 */

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ListMerger {

    public static void main(String[] args) {
        // Create two lists of integers
        List<Integer> list1 = new ArrayList<>();
        List<Integer> list2 = new ArrayList<>();

        // Add some integers to list1
        list1.add(3);
        list1.add(1);
        list1.add(4);

        // Add some integers to list2
        list2.add(2);
        list2.add(5);
        list2.add(6);

        // Merge the two lists
        List<Integer> mergedList = mergeLists(list1, list2);

        // Print the merged list
        System.out.println("Merged List: " + mergedList);
    }

    /**
     * This method merges two lists of integers into a single list.
     * The merged list will contain all elements from both input lists.
     * The merged list will be sorted in ascending order.
     *
     * @param list1 The first list of integers.
     * @param list2 The second list of integers.
     * @return A merged list containing all elements from list1 and list2, sorted in ascending order.
     */
    public static List<Integer> mergeLists(List<Integer> list1, List<Integer> list2) {
        // Create a new list to hold the merged elements
        List<Integer> mergedList = new ArrayList<>();

        // Add all elements from list1 to the merged list
        for (Integer num : list1) {
            mergedList.add(num);
        }

        // Add all elements from list2 to the merged list
        for (Integer num : list2) {
            mergedList.add(num);
        }

        // Sort the merged list in ascending order
        Collections.sort(mergedList);

        return mergedList;
    }
}

