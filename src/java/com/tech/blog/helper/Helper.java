package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {
    
    // Method to delete a file
    public static boolean deleteFile(String path) {
        boolean f = false;
        try {
            File file = new File(path);
            f = file.delete(); // Delete the file
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f; // Return success flag
    }
    
    // Method to save a file
    public static boolean saveFile(InputStream is, String path) {
        boolean f = false;
        try {
            byte[] b = new byte[is.available()]; // Create a byte array with the size of the input stream
            is.read(b); // Read the input stream into the byte array
            FileOutputStream fos = new FileOutputStream(path); // Create a file output stream
            fos.write(b); // Write the byte array to the file
            fos.flush();
            fos.close(); // Close the file output stream
            f = true; // Update success flag
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f; // Return success flag
    }
}
