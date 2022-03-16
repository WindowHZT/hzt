//package org.lionsoul.ip2region.test;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class HMacMd5Utils {
    private static byte[] a(byte[] bArr) throws NoSuchAlgorithmException {
        MessageDigest instance = MessageDigest.getInstance("MD5");
        instance.update(bArr);
        return instance.digest();
    }

    public static byte[] a(byte[] bArr, byte[] bArr2) throws NoSuchAlgorithmException {
        byte[] bArr3 = new byte[64];
        byte[] bArr4 = new byte[64];
        for (int i = 0; i < 64; i++) {
            bArr3[i] = 54;
            bArr4[i] = 92;
        }
        byte[] bArr5 = new byte[64];
        if (bArr.length > 64) {
            bArr = a(bArr);
        }
        for (int i2 = 0; i2 < bArr.length; i2++) {
            bArr5[i2] = bArr[i2];
        }
        if (bArr.length < 64) {
            for (int length = bArr.length; length < bArr5.length; length++) {
                bArr5[length] = 0;
            }
        }
        byte[] bArr6 = new byte[64];
        for (int i3 = 0; i3 < 64; i3++) {
            bArr6[i3] = (byte) (bArr5[i3] ^ bArr3[i3]);
        }
        byte[] bArr7 = new byte[(bArr6.length + bArr2.length)];
        for (int i4 = 0; i4 < bArr6.length; i4++) {
            bArr7[i4] = bArr6[i4];
        }
        for (int i5 = 0; i5 < bArr2.length; i5++) {
            bArr7[bArr5.length + i5] = bArr2[i5];
        }
        byte[] a2 = a(bArr7);
        byte[] bArr8 = new byte[64];
        for (int i6 = 0; i6 < 64; i6++) {
            bArr8[i6] = (byte) (bArr5[i6] ^ bArr4[i6]);
        }
        byte[] bArr9 = new byte[(bArr8.length + a2.length)];
        for (int i7 = 0; i7 < bArr8.length; i7++) {
            bArr9[i7] = bArr8[i7];
        }
        for (int i8 = 0; i8 < a2.length; i8++) {
            bArr9[bArr5.length + i8] = a2[i8];
        }
        return a(bArr9);
    }

    public static String a(String str, String str2) {
        String str3 = "";
        try {
            byte[] a2 = a(str.getBytes("UTF-8"), str2.getBytes("UTF-8"));
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < a2.length; i++) {
                if (Integer.toHexString(a2[i] & 255).length() == 1) {
                    sb.append("0");
                    sb.append(Integer.toHexString(a2[i] & 255));
                } else {
                    sb.append(Integer.toHexString(a2[i] & 255));
                }
                str3 = sb.toString().toLowerCase();
            }
        } catch (Exception unused) {
        }
        return str3;
    }

    public static void main(String[] args) {
        String pno = "666666666666";
        long millis = System.currentTimeMillis();
        String a = HMacMd5Utils.a("0f90529eeccc1539b5cf6f0101a97ff2", "{\"nationalCode\":\"86\",\"phoneNum\":\""+pno+"\",\"type\":\"1\"}"+millis);
        System.out.println(millis);
        System.out.println(a);
    }
}






