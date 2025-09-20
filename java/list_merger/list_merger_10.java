/**
 * This program is called ListMerger.
 * The purpose of this program is to merge two lists of integers provided by the user.
 * The program will prompt the user to input two lists of integers.
 * It will then merge these lists into a single list and display the result.
 * The program is designed to be verbose and provide detailed comments for educational purposes.
 */

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ListMerger {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user to enter the first list of integers
        System.out.println("Enter the first list of integers (comma-separated):");
        String firstInput = scanner.nextLine();

        // Convert the first input string to a list of integers
        List<Integer> firstList = convertStringToList(firstInput);

        // Prompt the user to enter the second list of integers
        System.out.println("Enter the second list of integers (comma-separated):");
        String secondInput = scanner.nextLine();

        // Convert the second input string to a list of integers
        List<Integer> secondList = convertStringToList(secondInput);

        // Merge the two lists
        List<Integer> mergedList = mergeLists(firstList, secondList);

        // Display the merged list
        System.out.println("Merged list: " + mergedList);

        // Close the scanner
        scanner.close();
    }

    /**
     * Converts a comma-separated string of integers into a list of integers.
     *
     * @param input the input string
     * @return the list of integers
     */
    private static List<Integer> convertStringToList(String input) {
        List<Integer> list = new ArrayList<>();
        String[] tokens = input.split(",");
        for (String token : tokens) {
            list.add(Integer.parseInt(token.trim()));
        }
        return list;
    }

    /**
     * Merges two lists of integers into a single list.
     *
     * @param firstList  the first list of integers
     * @param secondList the second list of integers
     * @return the merged list of integers
     */
    private static List<Integer> mergeLists(List<Integer> firstList, List<Integer> secondList) {
        List<Integer> mergedList = new ArrayList<>(firstList);
        mergedList.addAll(secondList);
        return mergedList;
    }
}

