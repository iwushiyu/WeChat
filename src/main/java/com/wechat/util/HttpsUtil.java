package com.wechat.util;

import com.alibaba.fastjson.JSONArray;
import net.sf.json.JSONObject;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;

import java.io.*;
import java.net.*;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.Map;

public class HttpsUtil {
    /*
    * 上传（临时素材）时HTTPS请求*/
    public String connectHttpBy(String path,String url)throws IOException,NoSuchAlgorithmException,NoSuchProviderException,KeyManagementException {
        File file=new File(path);

        if(!file.exists()){
            throw new IOException("文件不存在");
        }
        URL urlObj=new URL(url);
        //连接
        HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();
        String result = null;
        con.setDoInput(true);

        con.setDoOutput(true);
        // post方式不能使用缓存
        con.setUseCaches(false);

        // 设置请求头信息
        con.setRequestProperty("Connection", "Keep-Alive");
        con.setRequestProperty("Charset", "UTF-8");
        // 设置边界
        String BOUNDARY = "----------" + System.currentTimeMillis();
        con.setRequestProperty("Content-Type",
                "multipart/form-data; boundary="
                        + BOUNDARY);

        // 请求正文信息
        // 第一部分：
        StringBuilder sb = new StringBuilder();
        sb.append("--"); // 必须多两道线
        sb.append(BOUNDARY);
        sb.append("\r\n");
        sb.append("Content-Disposition: form-data;name=\"media\";filelength=\"" + file.length() + "\";filename=\""
                + file.getName() + "\"\r\n");
        sb.append("Content-Type:application/octet-stream\r\n\r\n");
        byte[] head = sb.toString().getBytes("utf-8");
        // 获得输出流
        OutputStream out = new DataOutputStream(con.getOutputStream());
        // 输出表头
        out.write(head);

        // 文件正文部分
        // 把文件已流文件的方式 推入到url中
        DataInputStream in = new DataInputStream(new FileInputStream(file));
        int bytes = 0;
        byte[] bufferOut = new byte[1024];
        while ((bytes = in.read(bufferOut)) != -1) {
            out.write(bufferOut, 0, bytes);
        }
        in.close();
        // 结尾部分
        byte[] foot = ("\r\n--" + BOUNDARY + "--\r\n").getBytes("utf-8");// 定义最后数据分隔线
        out.write(foot);
        out.flush();
        out.close();
        StringBuffer buffer = new StringBuffer();
        BufferedReader reader = null;
        try {
            // 定义BufferedReader输入流来读取URL的响应
            reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String line = null;
            while ((line = reader.readLine()) != null) {
                buffer.append(line);
            }
            if (result == null) {
                result = buffer.toString();
            }
        } catch (IOException e) {
            System.out.println("发送POST请求出现异常！" + e);
            e.printStackTrace();
        } finally {
            if (reader != null) {
                reader.close();
            }
        }
        return result;
    }
    /*
     * 上传永久素材（不包括图文素材）时HTTPS请求*/
    public static String connectHttpByPost(String filePath,String url,String type,String title,String introduction)throws IOException,NoSuchAlgorithmException,NoSuchProviderException,KeyManagementException {
        File file=new File(filePath);
        if(!file.exists()){
            throw new IOException("文件不存在");
        }
        URL urlObj=new URL(url);
        //连接
        HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();
        String result = null;

        con.setDoOutput(true);
        // post方式不能使用缓存
        con.setUseCaches(false);

        // 设置请求头信息
        con.setRequestProperty("Connection", "Keep-Alive");
        con.setRequestProperty("Charset", "UTF-8");
        // 设置边界
        String BOUNDARY = "----------" + System.currentTimeMillis();
        con.setRequestProperty("Content-Type",
                "multipart/form-data; boundary="
                        + BOUNDARY);

        // 请求正文信息
        // 第一部分：
        StringBuilder sb = new StringBuilder();

        if(MessageUtil.MESSAGE_VIDEO.equals(type)){
            //这块是用来处理如果上传的类型是video的类型的
            JSONObject j=new JSONObject();
            j.put("title", title);
            j.put("introduction", introduction);
            //这块是上传video是必须的参数，你们可以在这里根据文件类型做if/else 判断
            sb.append("--"); // 必须多两道线
            sb.append(BOUNDARY);
            sb.append("\r\n");
            sb.append("Content-Disposition: form-data;name=\"description\" \r\n\r\n");
            sb.append(j.toString()+"\r\n");
        }
        sb.append("--"); // 必须多两道线
        sb.append(BOUNDARY);
        sb.append("\r\n");
        sb.append("Content-Disposition: form-data;name=\"media\";filelength=\"" + file.length() + "\";filename=\""

                + file.getName() + "\"\r\n");
        sb.append("Content-Type:application/octet-stream\r\n\r\n");
        byte[] head = sb.toString().getBytes("utf-8");
        // 获得输出流
        OutputStream out = new DataOutputStream(con.getOutputStream());
        // 输出表头
        out.write(head);

        // 文件正文部分
        // 把文件已流文件的方式 推入到url中
        DataInputStream in = new DataInputStream(new FileInputStream(file));
        int bytes = 0;
        byte[] bufferOut = new byte[1024];
        while ((bytes = in.read(bufferOut)) != -1) {
            out.write(bufferOut, 0, bytes);
        }
        in.close();
        // 结尾部分
        byte[] foot = ("\r\n--" + BOUNDARY + "--\r\n").getBytes("utf-8");// 定义最后数据分隔线
        out.write(foot);
        out.flush();
        out.close();
        StringBuffer buffer = new StringBuffer();
        BufferedReader reader = null;
        try {
            // 定义BufferedReader输入流来读取URL的响应
            reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String line = null;
            while ((line = reader.readLine()) != null) {
                buffer.append(line);
            }
            if (result == null) {
                result = buffer.toString();
            }
        } catch (IOException e) {
            System.out.println("发送POST请求出现异常！" + e);
            e.printStackTrace();
        } finally {
            if (reader != null) {
                reader.close();
            }
        }
      return result;
    }

    /*
    * 上传图文永久素材时的post
    * 删除素材时的post
    * */
public static String httpRequest(String url,String data) {
    String result = null;
    try {
        URL urlObj=new URL(url);
        HttpURLConnection conn = (HttpURLConnection) urlObj.openConnection();
        conn.setRequestMethod("POST");// 提交模式
        //是否允许输入输出
        conn.setDoInput(true);
        conn.setDoOutput(true);
        //设置请求头里面的数据，以下设置用于解决http请求code415的问题
        conn.setRequestProperty("Content-Type", "application/json");
        //链接地址
        conn.connect();
        OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream());
        //发送参数
        writer.write(data);
        //清理当前编辑器的左右缓冲区，并使缓冲区数据写入基础流
        writer.flush();
        BufferedReader reader = new BufferedReader(new InputStreamReader(
                conn.getInputStream()));
        String lines = reader.readLine();//读取请求结果
        JSONObject js = JSONObject.fromObject(lines);
        result=js.toString();
        reader.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    return result;
}


//    public static  String SendPost(String url, Map<String,Object> params){
//        DefaultHttpClient client = new DefaultHttpClient();
//
//        JSONObject jsonObject=new JSONObject();
//        jsonObject.putAll(params);
//        StringEntity entity = new StringEntity(jsonObject.toString(),"utf-8");//解决中文乱码问题
//        /**设置编码 **/
//        entity.setContentEncoding("UTF-8");
//        entity.setContentType("application/json");
//        /**新建一个post请求**/
//        HttpPost post = new HttpPost(url);
//        post.setEntity(entity);
//        HttpResponse response=null;
//        try {
//            /**客服端向服务器发送请求**/
//            response = client.execute(post);
//        } catch (ClientProtocolException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
////        return GetResponseData(response);
//        return  JSONArray.toJSONString(response);
//    }



//    /*
//     * 上传图文永久素材时的post（没成功）
//     * 删除素材时的post
//     * */
//    public static String httpRequestgetImage(String url,String data) {
//        String lines= null;
//        try {
//            URL urlObj=new URL(url);
//            HttpURLConnection conn = (HttpURLConnection) urlObj.openConnection();
//            conn.setRequestMethod("POST");// 提交模式
//            //是否允许输入输出
//            conn.setDoInput(true);
//            conn.setDoOutput(true);
//            //设置请求头里面的数据，以下设置用于解决http请求code415的问题
//            conn.setRequestProperty("Content-Type", "application/json");
//            //链接地址
//            conn.connect();
//            OutputStreamWriter writer = new OutputStreamWriter(conn.getOutputStream());
//            //发送参数
//            writer.write(data);
//            //清理当前编辑器的左右缓冲区，并使缓冲区数据写入基础流
//            writer.flush();
//            BufferedReader reader = new BufferedReader(new InputStreamReader(
//                    conn.getInputStream()));
//            lines = reader.readLine();//读取请求结果
//
//            reader.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return lines;
//    }

    /**
     * 向指定URL发送POST方法的请求
     * @param url 发送请求的URL
     * @param content 内容
     * @return URL所代表远程资源的响应
     * @throws Exception
     */
    public static String post(String url, String content) throws Exception{
        String result = "";
        URL postUrl = new URL(url);
        HttpURLConnection connection = (HttpURLConnection) postUrl
                .openConnection();
        connection.setDoOutput(true);
        connection.setDoInput(true);
        connection.setRequestMethod("POST");
        connection.setUseCaches(false);
        connection.setInstanceFollowRedirects(true);
        connection.setRequestProperty("Content-Type",
                "application/x-www-form-urlencoded");
        connection.connect();
        DataOutputStream out = new DataOutputStream(connection
                .getOutputStream());
//        out.writeBytes(content);
        out.write(content.getBytes("UTF-8"));
        out.flush();
        out.close(); // flush and close
        BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(),"utf-8"));//设置编码,否则中文乱码
        String line="";
        while ((line = reader.readLine()) != null){
            result += line;
        }
        reader.close();
        connection.disconnect();
        return result;
    }



    /*
     * 获取永久素材时的post
     * */
    public static String getMediahttpRequest(String url,String data,String outputStr) {
        String result = null;
        return result;
    }

//获取永久素材
public static String gethttpRequest(String url,String type,String mediaId,String fileName) {
    String result = null;
    try {
        //获取access_token

        //定义请求地址url
        URL urlObj=new URL(url);
        //发送请求
        if (type=="news"||type=="video"){

        }else{
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    return result;

}



}


