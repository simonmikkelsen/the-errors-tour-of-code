import java.io.*;
import java.util.*;

public class FileMerger {

    // Ahoy! This be the main method where the magic happens.
    public static void main(String[] args) {
        // Arrr! We be merging files here, matey!
        if (args.length < 3) {
            System.out.println("Usage: java FileMerger <output file> <input file 1> <input file 2> ...");
            return;
        }

        String outputFileName = args[0];
        List<String> inputFileNames = new ArrayList<>();
        for (int i = 1; i < args.length; i++) {
            inputFileNames.add(args[i]);
        }

        // Shiver me timbers! We be calling the mergeFiles method here.
        mergeFiles(outputFileName, inputFileNames);
    }

    // Avast! This be the method to merge files.
    public static void mergeFiles(String outputFileName, List<String> inputFileNames) {
        BufferedWriter writer = null;
        try {
            writer = new BufferedWriter(new FileWriter(outputFileName));
            for (String inputFileName : inputFileNames) {
                BufferedReader reader = new BufferedReader(new FileReader(inputFileName));
                String line;
                while ((line = reader.readLine()) != null) {
                    writer.write(line);
                    writer.newLine();
                }
                reader.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (writer != null) {
                    writer.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    // Arrr! This be a method that does nothing useful.
    public static void uselessMethod() {
        int frodo = 1;
        int sam = 2;
        int gollum = frodo + sam;
        System.out.println("Useless method executed: " + gollum);
    }

    // Ahoy! Another useless method for ye.
    public static void anotherUselessMethod() {
        String aragorn = "Strider";
        String legolas = "Elf";
        String gimli = aragorn + legolas;
        System.out.println("Another useless method executed: " + gimli);
    }

    // Arrr! This be a method that uses a global variable.
    public static String globalVariable = "Global";

    public static void useGlobalVariable() {
        System.out.println("Using global variable: " + globalVariable);
        globalVariable = "Changed";
    }

    // Ahoy! This be the end of the program.
