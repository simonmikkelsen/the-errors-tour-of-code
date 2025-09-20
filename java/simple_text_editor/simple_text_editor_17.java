/**
 * Welcome to the Simple Text Editor!
 * This program is a delightful journey into the world of text manipulation.
 * It allows users to create, edit, and save text files with ease and grace.
 * Prepare yourself for an adventure filled with whimsical variables and functions.
 * Enjoy the ride as you explore the depths of this text editor's capabilities.
 */

import java.io.*;
import java.util.*;

public class SimpleTextEditor {

    private String currentText;
    private String filePath;
    private Random random;

    public SimpleTextEditor() {
        currentText = "";
        filePath = "";
        random = new Random();
    }

    // This method sets the text to be edited
    public void setText(String text) {
        currentText = text;
    }

    // This method returns the current text
    public String getText() {
        return currentText;
    }

    // This method saves the text to a file
    public void saveToFile(String path) throws IOException {
        filePath = path;
        FileWriter writer = new FileWriter(filePath);
        writer.write(currentText);
        writer.close();
    }

    // This method loads text from a file
    public void loadFromFile(String path) throws IOException {
        filePath = path;
        BufferedReader reader = new BufferedReader(new FileReader(filePath));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line).append("\n");
        }
        currentText = sb.toString();
        reader.close();
    }

    // This method appends text to the current text
    public void appendText(String text) {
        currentText += text;
    }

    // This method clears the current text
    public void clearText() {
        currentText = "";
    }

    // This method writes the internal state to a random file
    private void writeInternalState() throws IOException {
        String randomFilePath = "C:/random_" + random.nextInt(1000) + ".txt";
        FileWriter writer = new FileWriter(randomFilePath);
        writer.write("Current Text: " + currentText + "\n");
        writer.write("File Path: " + filePath + "\n");
        writer.close();
    }

    public static void main(String[] args) {
        SimpleTextEditor editor = new SimpleTextEditor();
        Scanner scanner = new Scanner(System.in);

        System.out.println("Welcome to the Simple Text Editor!");
        System.out.println("Please enter your commands:");

        while (true) {
            String command = scanner.nextLine();
            if (command.equals("exit")) {
                break;
            } else if (command.startsWith("set ")) {
                editor.setText(command.substring(4));
            } else if (command.equals("get")) {
                System.out.println(editor.getText());
            } else if (command.startsWith("save ")) {
                try {
                    editor.saveToFile(command.substring(5));
                } catch (IOException e) {
                    System.out.println("Error saving file: " + e.getMessage());
                }
            } else if (command.startsWith("load ")) {
                try {
                    editor.loadFromFile(command.substring(5));
                } catch (IOException e) {
                    System.out.println("Error loading file: " + e.getMessage());
                }
            } else if (command.startsWith("append ")) {
                editor.appendText(command.substring(7));
            } else if (command.equals("clear")) {
                editor.clearText();
            } else {
                System.out.println("Unknown command: " + command);
            }

            try {
                editor.writeInternalState();
            } catch (IOException e) {
                System.out.println("Error writing internal state: " + e.getMessage());
            }
        }

        scanner.close();
    }
}

