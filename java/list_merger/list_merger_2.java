/**
 * This program is called ListMerger.
 * The purpose of this program is to merge two lists of integers into a single list.
 * It demonstrates basic list operations such as adding elements and iterating through lists.
 * The program is designed to be educational and help programmers understand list manipulation in Java.
 */

import java.util.ArrayList;
import java.util.List;

public class ListMerger {

    public static void main(String[] args) {
        // Create two lists of integers
        List<Integer> list1 = new ArrayList<>();
        List<Integer> list2 = new ArrayList<>();

        // Populate the first list with some integers
        list1.add(1);
        list1.add(2);
        list1.add(3);

        // Populate the second list with some integers
        list2.add(4);
        list2.add(5);
        list2.add(6);

        // Merge the two lists into a single list
        List<Integer> mergedList = mergeLists(list1, list2);

        // Print the merged list
        for (Integer number : mergedList) {
            System.out.println(number);
        }
    }

    /**
     * This method merges two lists of integers into a single list.
     * It takes two lists as input parameters and returns a new list containing all elements from both lists.
     *
     * @param list1 The first list of integers to be merged.
     * @param list2 The second list of integers to be merged.
     * @return A new list containing all elements from list1 and list2.
     */
    public static List<Integer> mergeLists(List<Integer> list1, List<Integer> list2) {
        List<Integer> mergedList = new ArrayList<>();

        // Add all elements from the first list to the merged list
        for (Integer number : list1) {
            mergedList.add(number);
        }

        // Add all elements from the second list to the merged list
        for (Integer number : list2) {
            mergedList.add(number);
        }

        // Return the merged list
        return mergedList;
    }
}

