package com.wechat.util;

import com.wechat.entity.SystemUser;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Random;

public class CheckUtil {
    private static String token;

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    /*
* 产生随机字符串
* */
    public static String getRandomString(int length){
        //定义一个字符串（a-z，0-9）即62位；
        String str="zxcvbnmlkjhgfdsaqwertyuiop1234567890";
        //由Random生成随机数
        Random random=new Random();
        StringBuffer sb=new StringBuffer();
        //长度为几就循环几次
        for(int i=0; i<length; ++i){
            //产生0-61的数字
            int number=random.nextInt(36);
            //将产生的数字通过length次承载到sb中
            sb.append(str.charAt(number));
        }
        //将承载的字符转换成字符串
        token=sb.toString();
        System.out.println("token:"+token);
        return token;
    }
    /*
    * 位数为8的随机字符串（只有小写字母和数字）作为token
    * */
    public static boolean checkSignature(String signature, String timestamp, String nonce,String token) {
        String[] arr = new String[]{token, timestamp, nonce};
        //排序
        Arrays.sort(arr);
        System.out.println(token);
        //生成字符串
        StringBuffer content = new StringBuffer();
        for (int i = 0; i < arr.length; i++) {
            content.append(arr[i]);
        }
        String temp = getSha1(content.toString());
        System.out.println(temp);
        return temp.equals(signature);
    }

    public static String getSha1(String str) {
        if (null == str || 0 == str.length()) {
            return null;
        }
        char[] hexDigits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'a', 'b', 'c', 'd', 'e', 'f'};
        try {
            MessageDigest mdTemp = MessageDigest.getInstance("SHA1");
            mdTemp.update(str.getBytes("UTF-8"));

            byte[] md = mdTemp.digest();
            int j = md.length;
            char[] buf = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                buf[k++] = hexDigits[byte0 >>> 4 & 0xf];
                buf[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(buf);
        } catch (Exception e) {
           return null;
        }
    }

}
