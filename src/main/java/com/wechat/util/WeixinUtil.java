package com.wechat.util;



import com.wechat.entity.*;
import net.sf.json.JSONObject;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class WeixinUtil {
    private  static final String ACCESS_TOKEN_URL="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
    private  static final String UPLOAD_URL="https://api.weixin.qq.com/cgi-bin/media/upload?access_token=ACCESS_TOKEN&type=TYPE";
    private static final String CREATE_MENU_URL="https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";
    private static final String QUERY_MENU_URL="https://api.weixin.qq.com/cgi-bin/menu/get?access_token=ACCESS_TOKEN";
    private static final String DELETE_MENU_URL="https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=ACCESS_TOKEN";
    private static final String USER_INFO_URL="https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
    private static final String UPLOAD_NEWS_URL="https://api.weixin.qq.com/cgi-bin/material/add_news?access_token=ACCESS_TOKEN";
    private static final String UPLOAD_OTHERS_URL="https://api.weixin.qq.com/cgi-bin/material/add_material?access_token=ACCESS_TOKEN&type=TYPE";
    private static final String UPLOAD_NEWS_IMG_URL="https://api.weixin.qq.com/cgi-bin/media/uploadimg?access_token=ACCESS_TOKEN";
    private static final String SEND_URL="https://api.weixin.qq.com/cgi-bin/message/mass/send?access_token=ACCESS_TOKEN";
    private static final String DELETE_MATERIAL="https://api.weixin.qq.com/cgi-bin/material/del_material?access_token=ACCESS_TOKEN";
    private static final String GET_MATERIAL="https://api.weixin.qq.com/cgi-bin/material/get_material?access_token=ACCESS_TOKEN";
    private static final String GET_MATERIAL_LIST="https://api.weixin.qq.com/cgi-bin/material/batchget_material?access_token=ACCESS_TOKEN";
    private static final String GET_MATERIAL_COUNT="https://api.weixin.qq.com/cgi-bin/material/get_materialcount?access_token=ACCESS_TOKEN";
    private static final String UPDATE_NEWS="https://api.weixin.qq.com/cgi-bin/material/update_news?access_token=ACCESS_TOKEN";

    /*
     * get请求
     */
    public static JSONObject doGetStr(String url){
        HttpClient httpClient=HttpClientBuilder.create().build();
        HttpGet httpGet=new HttpGet(url);
        JSONObject jsonObject=null;
        try {
            HttpResponse response=httpClient.execute(httpGet);
            HttpEntity entity=response.getEntity();
            if(entity!=null){
                String result=EntityUtils.toString(entity,"UTF-8");
                jsonObject=JSONObject.fromObject(result);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return jsonObject;
    }
    /*
     * post请求
     */
    public static JSONObject doPostStr(String url,String outStr){
        HttpClient httpClient=HttpClientBuilder.create().build();
        HttpPost httpPost=new HttpPost(url);
        JSONObject jsonObject=null;
        try {
            httpPost.setEntity(new StringEntity(outStr,"UTF-8"));
            HttpResponse response=httpClient.execute(httpPost);
            String result=EntityUtils.toString(response.getEntity(),"UTF-8");
            jsonObject=JSONObject.fromObject(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject;
    }

    /*
    * 获取access_token
    * */
    public static AccessToken getAccessToken(String appid,String appsecret){
        AccessToken token=new AccessToken();
        String url=ACCESS_TOKEN_URL.replace("APPID",appid).replace("APPSECRET",appsecret);
        JSONObject jsonObject=doGetStr(url);
        if(jsonObject!=null){
            token.setAccess_token(jsonObject.getString("access_token"));
            token.setExpires_in(jsonObject.getInt("expires_in"));
        }
        return token;
    }

    /*
    * 文件上传(临时素材)
    * */
    public static String upload(String filePath,String accessToken,String type)throws IOException,NoSuchAlgorithmException,NoSuchProviderException,KeyManagementException {
            String result=null;
        String url=UPLOAD_URL.replace("ACCESS_TOKEN",accessToken).replace("TYPE",type);
        HttpsUtil httpsUtil=new HttpsUtil();
        result= httpsUtil.connectHttpBy(filePath,url);
        JSONObject jsonObject=JSONObject.fromObject(result);
        System.out.println(jsonObject);
        String typeName="media_id";
        if (!"image".equals(type)&&!"voice".equals(type)){
            typeName=type+"_media_id";
        }
        String mediaId=jsonObject.getString(typeName);
        return  mediaId;
    }



    /*
     * 图文素材中的图片上传(永久素材)
     * */
    public static String uploadNewsImg(String filePath,String accessToken)throws IOException,NoSuchAlgorithmException,NoSuchProviderException,KeyManagementException {
        String result=null;
        String url=UPLOAD_NEWS_IMG_URL.replace("ACCESS_TOKEN",accessToken);
        HttpsUtil httpsUtil=new HttpsUtil();
        result= httpsUtil.connectHttpByPost(filePath,url,MessageUtil.MESSAGE_image,null,null);
        JSONObject jsonObject=JSONObject.fromObject(result);
//        System.out.println("图文素材中的图片上传(永久素材)"+jsonObject);
//        /*
//         * 上传图文素材中的图片时，会返回url*/
        String imgurl=jsonObject.getString("url");
        return  imgurl;
    }


    /*
     * 其他素材上传(图片，语音，视频，缩略图)
     * */
    public static JSONObject uploadOthersMaterial(String filePath,String accessToken,String type,String title,String introduction)throws IOException,NoSuchAlgorithmException,NoSuchProviderException,KeyManagementException {
        String result=null;
        String url=UPLOAD_OTHERS_URL.replace("ACCESS_TOKEN",accessToken).replace("TYPE",type);
        HttpsUtil httpsUtil=new HttpsUtil();
        result= httpsUtil.connectHttpByPost(filePath,url,type,title,introduction);
        JSONObject jsonObject=JSONObject.fromObject(result);
        System.out.println("其他素材上传(永久素材)"+jsonObject);
//        String typeName="media_id";
//        String mediaId=jsonObject.getString(typeName);
        return  jsonObject;
    }

    //    上传永久图文消息素材
    public static JSONObject uploadNews(String token,String data) throws Exception {
        String url=UPLOAD_NEWS_URL.replace("ACCESS_TOKEN",token);
//        String result=HttpsUtil.httpRequest(url,data);
        String result=HttpsUtil.post(url,data);
        String typeName="media_id";
        JSONObject jsonObject=JSONObject.fromObject(result);
        String mediaId=jsonObject.getString(typeName);
        return  jsonObject;
    }
    //    修改永久图文消息素材
    public static String updateNews(String token,String data) throws Exception {
        String url=UPDATE_NEWS.replace("ACCESS_TOKEN",token);
//        String result=HttpsUtil.httpRequest(url,data);
        String result=HttpsUtil.post(url,data);
        String typeName="errcode";
        JSONObject jsonObject=JSONObject.fromObject(result);
        String errcode=jsonObject.getString(typeName);
        return  errcode;
    }

    //    获取某个永久素材
    public static JSONObject getMaterial(String token,String data) throws Exception {
        String url=GET_MATERIAL.replace("ACCESS_TOKEN",token);
//        String result=HttpsUtil.httpRequest(url,data);
        String result=HttpsUtil.post(url,data);
        System.out.println("result:"+result);
        JSONObject jsonObject=JSONObject.fromObject(result);
        return  jsonObject;
    }

    //    获取素材列表
    public static JSONObject getMaterialList(String token,String data) throws Exception {
        String url=GET_MATERIAL_LIST.replace("ACCESS_TOKEN",token);
//        String result=HttpsUtil.httpRequest(url,data);
        String result=HttpsUtil.post(url,data);
        JSONObject jsonObject=JSONObject.fromObject(result);
        return  jsonObject;
    }

    //    获取永久素材总数
    public static JSONObject getMaterialCount(String token){
        String url=GET_MATERIAL_COUNT.replace("ACCESS_TOKEN",token);
        JSONObject jsonObject=doGetStr(url);
        System.out.println("获取永久素材总数："+jsonObject);
        return  jsonObject;
    }


    //    删除永久素材
    public static String deleteMaterial(String token,String data){
        String url=DELETE_MATERIAL.replace("ACCESS_TOKEN",token);
        String result=HttpsUtil.httpRequest(url,data);
        String typeName="errcode";
        JSONObject jsonObject=JSONObject.fromObject(result);
        String errcode=jsonObject.getString(typeName);
        return  errcode;
    }

    public static String sendByOpenID(String token,String data) throws Exception {
        String url=SEND_URL.replace("ACCESS_TOKEN",token);
        Map dataMap=new HashMap();
        dataMap.put("data",data);
//        String result=HttpsUtil.SendPost(url,dataMap);
//        String result=HttpsUtil.httpRequest(url,data);
        String result=HttpsUtil.post(url,data);
//        post
        System.out.println(result);
        System.out.println("data222:"+data);
        JSONObject jsonObject=JSONObject.fromObject(result);
        String errcode=jsonObject.getString("errcode");
        System.out.println(errcode);
        return  errcode;
    }

    /*
     * 群发文本消息方法*/
    public static String sendTextMessageByOpenID(String token, String[] openids, String content) throws Exception {
        JSONObject json1= new JSONObject();
        JSONObject json2=new JSONObject();
        List<String> openID=new ArrayList<>();
        StringBuffer dbc = new StringBuffer();

        System.out.print("到此一游");
        for(int i=0;i<openids.length;i++){
            openID.add(openids[i]);
            dbc.append('"');
            dbc.append(openids[i]);
            dbc.append('"');
            if (i!=openids.length-1){
                dbc.append(',');
            }
        }
        json2.put("touser",openID);
        json2.put("msgtype","text");
        json1.put("content",content);
//        TextMessage textMessage=new TextMessage();
//        textMessage.setTitle(title);
//        textMessage.setContent("天天天天t测试tian天");  失败了，这样还是乱码
//        json1.put("content","测试乱码是否是因为变量，或者从数据库读取有问题"); 失败了，这样还是乱码
//        json1.put("content",textMessage.getContent());
        json2.put("text",json1);
        String data=json2.toString();
        System.out.println(data);
        String errorcode=WeixinUtil.sendByOpenID(token,data);

//        String abd="{\n" +
//                "   \"touser\":[\n" +dbc+
//                "   ],\n" +
//                "    \"msgtype\": \"text\",\n" +
//                "    \"text\": { \"content\": \""+content+"\"}\n" +
//                "}";
//        System.out.println("abd:"+abd);
//        String errorcode=WeixinUtil.sendByOpenID(token,abd);

        return  errorcode;
    }

    /*
    * 群发图文消息方法*/
    public static String sendNewsMessageByOpenID(String token, String[] openids, News news) throws Exception {
        JSONObject json1= new JSONObject();
        JSONObject json2=new JSONObject();
        List<String> openID=new ArrayList<>();
        for(int i=0;i<openids.length;i++){
            openID.add(openids[i]);
        }
        json2.put("touser",openID);
        json2.put("msgtype","mpnews");
        json1.put("media_id",news.getMediaId());
        json2.put("mpnews",json1);
        json2.put("send_ignore_reprint",0);
        String data=json2.toString();
        String errorcode=WeixinUtil.sendByOpenID(token,data);
        return  errorcode;
    }
    /*
     * 群发语音消息方法*/
    public static String sendVoiceMessageByOpenID(String token, String[] openids, String mediaId) throws Exception {
        JSONObject json1= new JSONObject();
        JSONObject json2=new JSONObject();
        List<String> openID=new ArrayList<>();
        for(int i=0;i<openids.length;i++){
            openID.add(openids[i]);
        }
        json2.put("touser",openID);
        json2.put("msgtype","voice");
        json1.put("media_id",mediaId);
        json2.put("voice",json1);
        String data=json2.toString();
        String errorcode=WeixinUtil.sendByOpenID(token,data);
        return  errorcode;
    }

    /*
     * 群发图片消息方法*/
    public static String sendImageMessageByOpenID(String token, String[] openids, String mediaId) throws Exception {
        JSONObject json1= new JSONObject();
        JSONObject json2=new JSONObject();
        List<String> openID=new ArrayList<>();
        for(int i=0;i<openids.length;i++){
            openID.add(openids[i]);
        }
        json2.put("touser",openID);
        json2.put("msgtype","image");
        json1.put("media_id",mediaId);
        json2.put("image",json1);
        String data=json2.toString();
        System.out.println(data);
        String errorcode=WeixinUtil.sendByOpenID(token,data);
        return  errorcode;
    }

    /*
     * 群发图片消息方法*/
    public static String sendVideoMessageByOpenID(String token, String[] openids, Video video) throws Exception {
        JSONObject json1= new JSONObject();
        JSONObject json2=new JSONObject();
        List<String> openID=new ArrayList<>();
        for(int i=0;i<openids.length;i++){
            openID.add(openids[i]);
        }
        json2.put("touser",openID);
        json2.put("msgtype","mpvideo");
        json1.put("media_id",video.getMediaId());
        json1.put("title",video.getTitle());
        json1.put("description",video.getDescription());
        json2.put("mpvideo",json1);
        String data=json2.toString();
        String errorcode=WeixinUtil.sendByOpenID(token,data);
        return  errorcode;
    }

//    /*
//     * 其他素材上传(永久素材)
//     * */
//    public static String uploadAll(String filePath,String accessToken,String type,String title,String introduction)throws IOException,NoSuchAlgorithmException,NoSuchProviderException,KeyManagementException {
//        File file=new File(filePath);
//        if(!file.exists()){
//            throw new IOException("文件不存在");
//        }
//        String url=UPLOAD_OTHERS_URL.replace("ACCESS_TOKEN",accessToken).replace("TYPE",type);
//        URL urlObj=new URL(url);
//        //连接
//        HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();
//        String result = null;
//
//        con.setDoOutput(true);
//        // post方式不能使用缓存
//        con.setUseCaches(false);
//
//        // 设置请求头信息
//        con.setRequestProperty("Connection", "Keep-Alive");
//        con.setRequestProperty("Charset", "UTF-8");
//        // 设置边界
//        String BOUNDARY = "----------" + System.currentTimeMillis();
//        con.setRequestProperty("Content-Type",
//                "multipart/form-data; boundary="
//                        + BOUNDARY);
//
//        // 请求正文信息
//        // 第一部分：
//        StringBuilder sb = new StringBuilder();
//
//        if(MessageUtil.MESSAGE_VIDEO.equals(type)){
//            //这块是用来处理如果上传的类型是video的类型的
//            JSONObject j=new JSONObject();
//            j.put("title", title);
//            j.put("introduction", introduction);
//            //这块是上传video是必须的参数，你们可以在这里根据文件类型做if/else 判断
//            sb.append("--"); // 必须多两道线
//            sb.append(BOUNDARY);
//            sb.append("\r\n");
//            sb.append("Content-Disposition: form-data;name=\"description\" \r\n\r\n");
//            sb.append(j.toString()+"\r\n");
//        }
//        sb.append("--"); // 必须多两道线
//        sb.append(BOUNDARY);
//        sb.append("\r\n");
//        sb.append("Content-Disposition: form-data;name=\"media\";filelength=\"" + file.length() + "\";filename=\""
//
//                + file.getName() + "\"\r\n");
//        sb.append("Content-Type:application/octet-stream\r\n\r\n");
//        byte[] head = sb.toString().getBytes("utf-8");
//        // 获得输出流
//        OutputStream out = new DataOutputStream(con.getOutputStream());
//        // 输出表头
//        out.write(head);
//
//        // 文件正文部分
//        // 把文件已流文件的方式 推入到url中
//        DataInputStream in = new DataInputStream(new FileInputStream(file));
//        int bytes = 0;
//        byte[] bufferOut = new byte[1024];
//        while ((bytes = in.read(bufferOut)) != -1) {
//            out.write(bufferOut, 0, bytes);
//        }
//        in.close();
//        // 结尾部分
//        byte[] foot = ("\r\n--" + BOUNDARY + "--\r\n").getBytes("utf-8");// 定义最后数据分隔线
//        out.write(foot);
//        out.flush();
//        out.close();
//        StringBuffer buffer = new StringBuffer();
//        BufferedReader reader = null;
//        try {
//            // 定义BufferedReader输入流来读取URL的响应
//            reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
//            String line = null;
//            while ((line = reader.readLine()) != null) {
//                buffer.append(line);
//            }
//            if (result == null) {
//                result = buffer.toString();
//            }
//        } catch (IOException e) {
//            System.out.println("发送POST请求出现异常！" + e);
//            e.printStackTrace();
//        } finally {
//            if (reader != null) {
//                reader.close();
//            }
//        }
//        JSONObject jsonObject=JSONObject.fromObject(result);
//        System.out.println(jsonObject);
//        String typeName="media_id";
////        if (!"image".equals(type)&&!"voice".equals(type)){
////            typeName=type+"_media_id";
////        }
//        String mediaId=jsonObject.getString(typeName);
//        return  mediaId;
//    }


//    /*
//     * 视频素材上传(永久素材)
//     * */
//    public static String uploadVideo(String filePath,String accessToken,String type,String title,String introduction)throws IOException,NoSuchAlgorithmException,NoSuchProviderException,KeyManagementException {
//        String result=null;
//        String url=UPLOAD_OTHERS_URL.replace("ACCESS_TOKEN",accessToken).replace("TYPE",type);
//        HttpsUtil httpsUtil=new HttpsUtil();
//        result= httpsUtil.uploadVideo(filePath,url,title,introduction);
//        JSONObject jsonObject=JSONObject.fromObject(result);
//        System.out.println(jsonObject);
//        String typeName="media_id";
//        if (!"image".equals(type)&&!"voice".equals(type)){
//            typeName=type+"_media_id";
//        }
//        String mediaId=jsonObject.getString(typeName);
//        return  mediaId;
//    }









/*
* 组装菜单
* */
    public static Menu ininMenu(){
        Menu menu=new Menu();
//        String menuURL;
        ClickButton button11=new ClickButton();
        button11.setName("Click菜单");
        button11.setType("click");
        button11.setKey("11");

        ViewButton button21=new ViewButton();
        button21.setName("微官网");
        button21.setType("view");
//        menuURL="<%=basePath%>/jsp/menu.jsp";
        button21.setUrl("http://23c32214i1.imwork.net:80//statics/website/websiteIndex.jsp");

        ClickButton button31=new ClickButton();
        button31.setName("扫码事件");
        button31.setType("scancode_push");
        button31.setKey("31");
        ClickButton button32=new ClickButton();
        button32.setName("地理位置");
        button32.setType("location_select");
        button32.setKey("32");

        Button button=new Button();
        button.setName("菜单");
        button.setSubButton(new Button[]{button31,button32});

        menu.setButton(new Button[]{button11,button21,button});
        return menu;
    }

    public static int crateMenu(String token,String menu){
        int result=0;
        String url=CREATE_MENU_URL.replace("ACCESS_TOKEN",token);
        JSONObject jsonObject=doPostStr(url,menu);
        if (jsonObject!=null){
            result=jsonObject.getInt("errcode");
        }
        return  result;
    }

    public static JSONObject queryMenu(String token){
        String url=QUERY_MENU_URL.replace("ACCESS_TOKEN",token);
        JSONObject jsonObject=doGetStr(url);
        return  jsonObject;
    }
    public static int deleteMenu(String token){
        String url=DELETE_MENU_URL.replace("ACCESS_TOKEN",token);
        JSONObject jsonObject=doGetStr(url);
        int result=0;
        if (jsonObject!=null){
            result=jsonObject.getInt("errcode");
        }
        return  result;
    }

////关注用户
//    public static JSONObject getUsers(String token){
//        int result=0;
//        String url=USER_URL.replace("ACCESS_TOKEN",token);
//        JSONObject jsonObject=doGetStr(url);
//        if (jsonObject!=null){
//            result=jsonObject.getInt("errcode");
//        }
//        return  jsonObject;
//    }

    //获取当前交互的用户的用户信息
    public static JSONObject getUsersInfo(String token,String fromUserName){
        int  result=0;
        String url=USER_INFO_URL.replace("ACCESS_TOKEN",token).replace("OPENID",fromUserName);
        JSONObject jsonObject=doGetStr(url);
        return  jsonObject;
    }

    public static Fans syncAccountFans(String openId, Account account) {

        AccessToken accessToken = getAccessToken(account.getAppid(), account.getAppsecret());
        String url = USER_INFO_URL.replace("ACCESS_TOKEN", accessToken.getAccess_token()).replace("OPENID", openId);
        JSONObject jsonObj = doGetStr(url);
        if (null != jsonObj) {

            Fans fans = new Fans();
            fans.setOpenId(jsonObj.getString("openid"));// 用户的标识
            if (jsonObj.containsKey("nickname")) {// 昵称
                String nickname = jsonObj.getString("nickname");
                fans.setNickName(nickname);
            }
            if (jsonObj.containsKey("sex")) {// 用户的性别（1是男性，2是女性，0是未知）
                fans.setSex(jsonObj.getInt("sex"));
            }
            if (jsonObj.containsKey("language")) {// 用户的语言，简体中文为zh_CN
                fans.setLanguage(jsonObj.getString("language"));
            }
            if (jsonObj.containsKey("country")) {// 用户所在国家
                fans.setCountry(jsonObj.getString("country"));
            }
            if (jsonObj.containsKey("province")) {// 用户所在省份
                fans.setProvince(jsonObj.getString("province"));
            }
            if (jsonObj.containsKey("city")) {// 用户所在城市
                fans.setCity(jsonObj.getString("city"));
            }
            if (jsonObj.containsKey("headimgurl")) {// 用户头像
                fans.setHeadImgUrl(jsonObj.getString("headimgurl"));
            }
            return fans;
        }

        return null;

    }
}