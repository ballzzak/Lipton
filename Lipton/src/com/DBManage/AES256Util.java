package com.DBManage;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
//11111111
/*
Copyright 2015 Lipton

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

public class AES256Util {
    private static String iv;
    private static Key keySpec;
    private static String key = "LiptonLiptonLiptonLipton";
 
    private static SecretKeySpec ready() {
    	try {
	        iv = key.substring(0, 16);
	 
	        byte[] keyBytes = new byte[16];
	        byte[] b = key.getBytes("UTF-8");
	        int len = b.length;
	        if(len > keyBytes.length)
	            len = keyBytes.length;
	        System.arraycopy(b, 0, keyBytes, 0, len);
	        SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");
	        return keySpec;
    	} catch (UnsupportedEncodingException e) {
    		e.printStackTrace();
    		return null;
    	}
    }
 
    // 암호화
    public static String aesEncode(String str) {
    	keySpec = ready();
    	try {
	        Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
	        c.init(Cipher.ENCRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes()));
	 
	        byte[] encrypted = c.doFinal(str.getBytes("UTF-8"));
	        String enStr = new String(Base64.encodeBase64(encrypted));
	 
	        return enStr;
    	} catch (Exception e) {
    		e.printStackTrace();
    		return null;
    	}
    }
 
    //복호화
    public static String aesDecode(String str) {
    	keySpec = ready();
    	try {
	        Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
	        c.init(Cipher.DECRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes("UTF-8")));
	 
	        byte[] byteStr = Base64.decodeBase64(str.getBytes());
	 
	        return new String(c.doFinal(byteStr),"UTF-8");
    	} catch (Exception e) {
    		e.printStackTrace();
    		return null;
    	}
    }
}