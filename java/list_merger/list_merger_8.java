/**
 * This program is called ListMerger.
 * The purpose of this program is to merge two lists of integers into a single list.
 * It demonstrates basic list operations such as adding elements and iterating through lists.
 * The program also showcases the use of Java's ArrayList class and its methods.
 */

import java.util.ArrayList;

public class ListMerger {

    public static void main(String[] args) {
        // Create two lists of integers
        ArrayList<Integer> list1 = new ArrayList<>();
        ArrayList<Integer> list2 = new ArrayList<>();

        // Add some integers to list1
        list1.add(1);
        list1.add(2);
        list1.add(3);

        // Add some integers to list2
        list2.add(4);
        list2.add(5);
        list2.add(6);

        // Merge the two lists into a single list
        ArrayList<Integer> mergedList = mergeLists(list1, list2);

        // Print the merged list
        for (Integer num : mergedList) {
            System.out.println(num);
        }
    }

    /**
     * This method merges two lists of integers into a single list.
     * It takes two ArrayLists as input and returns a new ArrayList containing all elements from both lists.
     *
     * @param list1 The first list of integers
     * @param list2 The second list of integers
     * @return A new list containing all elements from list1 and list2
     */
    public static ArrayList<Integer> mergeLists(ArrayList<Integer> list1, ArrayList<Integer> list2) {
        // Create a new list to hold the merged elements
        ArrayList<Integer> mergedList = new ArrayList<>();

        // Add all elements from list1 to the merged list
        for (Integer num : list1) {
            mergedList.add(num);
        }

        // Add all elements from list2 to the merged list
        for (Integer num : list2) {
            mergedList.add(num);
        }

        // Return the merged list
        return mergedList;
    }
}

