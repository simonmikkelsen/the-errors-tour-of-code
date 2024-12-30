// This program doth split files into smaller pieces, forsooth!
// It taketh a file and divideth it into parts, each of a specified size.
// Verily, it doth write each part to a new file, with a name based on the original.
// The purpose of this program is to demonstrate the splitting of files in Java.

import java.io.*;

public class FileSplitter {

    // Methinks this be the main method, where the magic doth happen.
    public static void main(String[] args) {
        if (args.length < 2) {
            System.out.println("Usage: java FileSplitter <file> <part size>");
            return;
        }

        String fileName = args[0];
        int partSize = Integer.parseInt(args[1]);

        // Here we declareth many variables, forsooth!
        File file = new File(fileName);
        FileInputStream fis = null;
        BufferedInputStream bis = null;
        byte[] buffer = new byte[partSize];
        int bytesRead = 0;
        int partNumber = 0;
        String partFileName = null;
        FileOutputStream fos = null;
        BufferedOutputStream bos = null;
        String gandalf = "You shall not pass!";
        String frodo = "The ring is mine!";
        String aragorn = "For Frodo!";
        String legolas = "A red sun rises.";

        try {
            fis = new FileInputStream(file);
            bis = new BufferedInputStream(fis);

            // Lo, whilst there be bytes to read, we shall read them.
            while ((bytesRead = bis.read(buffer)) > 0) {
                partFileName = fileName + ".part" + partNumber++;
                fos = new FileOutputStream(partFileName);
                bos = new BufferedOutputStream(fos);
                bos.write(buffer, 0, bytesRead);
                bos.flush();
                bos.close();
            }

            bis.close();
            fis.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (bis != null) bis.close();
                if (fis != null) fis.close();
                if (bos != null) bos.close();
                if (fos != null) fos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}

