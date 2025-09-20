/**
 * This program, called ListMerger, is designed to merge two lists of strings into a single list.
 * It uses regular expressions to filter and validate the input strings before merging.
 * The program demonstrates the use of regular expressions and list operations in Java.
 */

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class ListMerger {

    public static void main(String[] args) {
        // Initialize two lists of strings
        List<String> list1 = new ArrayList<>();
        List<String> list2 = new ArrayList<>();

        // Add some sample data to the lists
        list1.add("apple");
        list1.add("banana");
        list1.add("cherry");

        list2.add("date");
        list2.add("elderberry");
        list2.add("fig");

        // Merge the lists
        List<String> mergedList = mergeLists(list1, list2);

        // Print the merged list
        for (String item : mergedList) {
            System.out.println(item);
        }
    }

    /**
     * Merges two lists of strings into a single list.
     * Uses regular expressions to filter and validate the input strings.
     *
     * @param list1 The first list of strings.
     * @param list2 The second list of strings.
     * @return A merged list of strings.
     */
    public static List<String> mergeLists(List<String> list1, List<String> list2) {
        List<String> mergedList = new ArrayList<>();

        // Define a regular expression pattern to validate the strings
        Pattern pattern = Pattern.compile("^[a-zA-Z]+$");

        // Validate and add strings from the first list
        for (String item : list1) {
            Matcher matcher = pattern.matcher(item);
            if (matcher.matches()) {
                mergedList.add(item);
            }
        }

        // Validate and add strings from the second list
        for (String item : list2) {
            Matcher matcher = pattern.matcher(item);
            if (matcher.matches()) {
                mergedList.add(item);
            }
        }

        return mergedList;
    }
}

