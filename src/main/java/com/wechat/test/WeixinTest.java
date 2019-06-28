package com.wechat.test;

import com.wechat.entity.AccessToken;
import com.wechat.service.AccountService;
import com.wechat.service.TextMessageService;
import com.wechat.util.WeixinUtil;
import net.sf.json.JSONObject;

import javax.annotation.Resource;

public class WeixinTest {

    @Resource(name = "accountService")
    private AccountService accountService;
    @Resource(name="textMessageService")
    private TextMessageService textMessageService;
//    @Resource(name = "accountService")
//    private AccountServiceImpl accountService;
//    String appid="weq";
//    String appsecret="23da";
    public static void main(String[] args){
        try {

            String appid="wxb8bf4a40d1148cb0";
            String appsecret="a29fe5032a9bae3eadcdf44fb4cbe838";
            AccessToken token=WeixinUtil.getAccessToken(appid,appsecret);
            System.out.println("票据:"+token.getAccess_token());
            System.out.println("有效时间:"+token.getExpires_in());
            String title=null;
            String introduction=null;
            /*
            * 上传文件测试
            * */

            /*
             * 上传语音1
             * */
//            String path="F:\\material\\welcomeVoice.mp3";
//            String mediaId=WeixinUtil.upload(path,token.getAccess_token(),"voice");
//            System.out.println(mediaId);
            /*
             * 上传语音2
             * */
//            String path="F:\\material\\welcomeVoice.mp3";
//            String mediaId=WeixinUtil.uploadAll(path,token.getAccess_token(),"voice",null,null);
//            System.out.println(mediaId);
            /*
             * 上传语音（永久）1
             * */
//            String path="D:\\KuGou\\SeeYouAgain.mp3";
//            Object mediaId=WeixinUtil.uploadOthersMaterial(path,token.getAccess_token(),"voice",null,null);
//            System.out.println(mediaId);
            /*
             * 上传语音（永久）2
             * */
//            String path="F:\\material\\welcomeVoice.mp3";
//            String mediaId=WeixinUtil.uploadAll(path,token.getAccess_token(),"voice",null,null);
//            System.out.println(mediaId);
            /*
             * 上传视频（永久）
             * */
//            String path="D:\\temp\\file\\video\\1554907360485SeeYouAgain 1.mp4";
//            title="上传视频";
//            introduction="上传的测试视频";
//            Object mediaId=WeixinUtil.uploadOthersMaterial(path,token.getAccess_token(),"video",title,introduction);
//            System.out.println(((JSONObject) mediaId).toString());

            /*
             * 上传音乐1的缩略图
             * */
//            String path="C:\\Users\\Shio\\Desktop\\素材\\thumb\\封面222.jpg";
//            String mediaId=WeixinUtil.upload(path,token.getAccess_token(),"thumb");
//            System.out.println(mediaId);
            /*
             * 上传音乐2的缩略图
             * */
//            String path="F:\\material\\2.jpg";
//            String mediaId=WeixinUtil.uploadOthers(path,token.getAccess_token(),"thumb",null,null);
//            System.out.println(mediaId);

            /*
             * 上传图片1
             * */
//            String path="F:\\material\\1.jpg";
//            String mediaId=WeixinUtil.upload(path,token.getAccess_token(),"image");
//            System.out.println(mediaId);
            /*
             * 上传图片2
             * */
//            String path="F:\\material\\1.jpg";
//            String mediaId=WeixinUtil.uploadAll(path,token.getAccess_token(),"image",null,null);
//            System.out.println(mediaId);

            /*
            * 上传图片（永久素材）
            * 微信端返回了media_id和url*/
//            String path="F:\\myjob\\1.jpg";
//            JSONObject jsonObjectt=WeixinUtil.uploadOthersMaterial(path,token.getAccess_token(),"thumb",null,null);
//           String mediaId=jsonObjectt.getString("media_id");
////                    图文素材中的图片上传
////                    pictureURL=WeixinUtil.uploadNewsImg(filepath,token.getAccess_token());
//            String pictureURL=jsonObjectt.getString("url");
//            System.out.println("mediaId:  "+mediaId+"   ....pictureURL:  "+pictureURL);



            /*
             * 上传图文素材中的图片(永久)
             *返回的是一个url
             * */
//            String path="D:\\\\动漫\\\\pictures\\\\0b22b79ae20411a5a333e4e459b261ef.jpg";
//            JSONObject jsonObject=WeixinUtil.uploadNewsImg(path,token.getAccess_token());
//              String imgurl=jsonObject.getString("url");
//            System.out.println(imgurl);
            /*
            * 获取上传图文素材中的media_id（永久）
            * */
//            String thumbpath="F:\\material\\2.jpg";
//            String thumbmediaId=WeixinUtil.uploadOthers(thumbpath,token.getAccess_token(),"thumb",null,null);
//            System.out.println("图文素材中的thumbmediaId:"+thumbmediaId);
            /*
            * 上传图文素材
            * */
//            JSONObject json1= new JSONObject();
//            JSONObject json2=new JSONObject();
//            json2.put("title","图文素材的标题");
//            json2.put("thumb_media_id",thumbmediaId);
//            json2.put("author","author");
//            json2.put("digest","摘要");
//            json2.put("show_cover_pic","1");
//            json2.put("content","图文素材的内容");
//            json2.put("content_source_url","https://www.baidu.com/");
//            JSONArray jsonArray=new JSONArray();
//            jsonArray.add(json2);
//            json1.put("articles",jsonArray);
//            String data=json1.toString();
//            String mediaId=WeixinUtil.uploadNews(token.getAccess_token(),data);
//            System.out.println(mediaId);


            /*
             * 获取素材
             * */
//            JSONObject json1= new JSONObject();
//            json1.put("media_id","1x_-M07I7I2_sMYdW2m5weXXwC7_qkJbDgUOXO6Yg2s");
//            String data=json1.toString();
//            JSONObject jsonObject=WeixinUtil.getMaterial(token.getAccess_token(),data);
//            System.out.println(jsonObject.toString());



            /*
             * 获取素材总数(成功)
             * */
//            JSONObject json1= new JSONObject();
//            JSONObject jsonObject=WeixinUtil.getMaterialCount(token.getAccess_token());
//            System.out.println(jsonObject.toString());

            /*
             * 删除素材（成功）
             * */
//            JSONObject json1= new JSONObject();
//            json1.put("media_id","1x_-M07I7I2_sMYdW2m5wT2DoV_VjF8dGVGrDCITAQU");
//            String data=json1.toString();
//            String errcode=WeixinUtil.deleteMaterial(token.getAccess_token(),data);
//            System.out.println(errcode);

            /*
            * 群发文本消息
            * */
//            {
//                "touser":[
//                "OPENID1",
//                        "OPENID2"
//   ],
//                "msgtype": "text",
//                    "text": { "content": content}
//            }
//             title="天机123";
//            TextMessage textMessage=new TextMessage();
//            textMessage.setTitle(title);
//            textMessage.setContent("天天天天t测试tian天");
//            List<String> openID=new ArrayList<>();
//            JSONObject json1= new JSONObject();
//            JSONObject json2=new JSONObject();
//            openID.add("oV4wc1FPwme8gv1B3O6oxA01_UT4");
//            openID.add("oV4wc1EPErkHAn4zlqcqTX4wDYZc");
//            json2.put("touser",openID);
//            json2.put("msgtype","text");
//            json1.put("content",textMessage.getContent());
//            json2.put("text",json1);
////            JSONArray jsonArray=new JSONArray();
////            jsonArray.add(json2);
//            String data=json2.toString();
//            System.out.println(data);
//            String mediaId=WeixinUtil.sendByOpenID(token.getAccess_token(),data);
//            System.out.println(mediaId);
//            String data=json2.toString();

            /*
            * 创建菜单测试
            * */


            String mynu="\n" +
                    "{\n" +
                    "     \"button\":[\n" +
                    "     {\n" +
                    "           \"type\": \"media_id\", \n" +
                    "           \"name\": \"图片\", \n" +
                    "           \"media_id\": \"Pm2u1aPKKzq6OyVVJv4NTPFxV5HwDmM3i6KZcyzA1e0\"\n" +
                    "        }, \n" +
                    "        {\n" +
                    "           \"type\": \"media_id\", \n" +
                    "           \"name\": \"图文消息\", \n" +
                    "           \"media_id\": \"Pm2u1aPKKzq6OyVVJv4NTPFxV5HwDmM3i6KZcyzA1e0\"\n" +
                    "        },\n" +
                    "      {\n" +
                    "           \"name\":\"学校\",\n" +
                    "           \"sub_button\":[\n" +
                    "           {    \n" +
                    "               \"type\":\"view\",\n" +
                    "               \"name\":\"学校\",\n" +
                    "               \"url\":\"http://www.ecjtu.jx.cn/\"\n" +
                    "            },\n" +
                    "            {\n" +
                    "                 \"type\":\"view\",\n" +
                    "                 \"name\":\"微官网2\",\n" +
                    "                 \"url\":\"http://wushiyu.51vip.biz:80//jsp/showMiceoWebsite.jsp\"\n" +
                    "             }]\n" +
                    "       }]\n" +
                    " }";
            String menu= JSONObject.fromObject(WeixinUtil.ininMenu()).toString();
            System.out.println(mynu);
            int result=WeixinUtil.crateMenu(token.getAccess_token(),mynu);
            if(result==0){
                System.out.println("创建菜单成功");
            }else{
                System.out.println("错误码："+result);
            }
            /*
             * 查询菜单测试
             * */
//            JSONObject jsonObject=WeixinUtil.queryMenu(token.getAccess_token());
//            System.out.println(jsonObject);
            /*
             * 删除菜单测试
             * */
//            int result=WeixinUtil.deleteMenu(token.getAccess_token());
//            if(result==0){
//                System.out.println("菜单删除成功");
//            }else{
//                System.out.println("错误码："+result);
//            }
            /*
             * 查询关注用户
             * */
//            JSONObject jsonObject=WeixinUtil.getUsers(token.getAccess_token());
//            System.out.println(jsonObject);
        }catch (Exception ee){
            ee.printStackTrace();
        }
    }
}
