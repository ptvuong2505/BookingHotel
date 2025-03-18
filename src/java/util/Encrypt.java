/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.security.MessageDigest;
import java.util.Base64;

/**
 *
 * @author ADMIN
 */
public class Encrypt {

    public static String toSHA256(String text) {
        byte[] salt = "324njAFsfGfs2(34(*&(*#23bDG36Fmd2de".getBytes();
        String resultString = null;
        try {
            MessageDigest mDigest = MessageDigest.getInstance("SHA-256");
            mDigest.update(salt);
            byte[] hashBytes = mDigest.digest(text.getBytes());
            resultString = Base64.getEncoder().encodeToString(hashBytes);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultString;
    }
}
