package com.wechat.util;

import com.thoughtworks.xstream.XStream;
import com.wechat.entity.*;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;
import java.util.*;

//消息的格式转换
public class MessageUtil {
    public static final String HttpURL="http://wushiyu.51vip.biz";
    public static final String MESSAGE_TEXT="text";
    public static final String MESSAGE_image="image";
    public static final String MESSAGE_VOICE="voice";
    public static final String MESSAGE_VIDEO="video";
    public static final String MESSAGE_SHORTVIDEO="shortvideo";
    public static final String MESSAGE_LINK="link";
    public static final String MESSAGE_LOCATION="location";
    public static final String MESSAGE_EVENT="event";
    public static final String MESSAGE_SUBSCRIBE="subscribe";
    public static final String MESSAGE_UNSUBSCRIBE="unsubscribe";
    public static final String MESSAGE_CLICK="CLICK";
    public static final String MESSAGE_VIEW="VIEW";
    public static final String MESSAGE_NEWS="news";
    public static final String MESSAGE_MUSIC="music";
    public static final String MESSAGE_SCANCODE_PUSH="scancode_push";
    public static final String MESSAGE_LOCATION_SELECT="location_select";

    /*
    * 将XML格式数据转换为MAP集合
    * */
    public static Map<String,String> xmlToMap(HttpServletRequest request){
        Map<String, String> map=new HashMap<String,String>();
        try {
            InputStream is = request.getInputStream();
            SAXReader sax=new SAXReader(); //创建解析器
            Document doc=sax.read(is); //创建对应的Document对象
            Element root=doc.getRootElement(); //获取XML文档的根节点对象
            List<Element> list = root.elements();  //获取根节点下的所有的子节点
            for (Element ele : list) { //遍历根节点下的所有子节点并将其放入MAP对象中
                map.put(ele.getName(), ele.getText());
            }
            is.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }
//    /*
//     * 将一个文本消息对象转换为对应的XML文档：
//     * */
//    public static String textMessageToXml(TextMessage textMessage){
//        //创建XStream对象
//        XStream xstream=new XStream();
//        //设置根节点为“xml” ，也可以设置为"root"，这个根据需要
//        xstream.alias("xml", textMessage.getClass());
//        //将对象转换为xml格式的字符串
//        String xml = xstream.toXML(textMessage);
//        return xml;
//    }
//    /*
//    * 回复文本消息
//    * */
//    public static  String initText(String toUserName,String fromUserName,String content ){
//        TextMessage text = new TextMessage();
//        text.setFromUserName(toUserName);
//        text.setToUserName(fromUserName);
//        text.setMsgType(MESSAGE_TEXT);
//        text.setCreateTime(new Date().getTime());
//        text.setContent(content);
//        return textMessageToXml(text);
//    }

    /*
     * 将一个文本消息对象转换为对应的XML文档：
     * */
//    public static String initTextMessageToXml(TextMessageBack textMessage){
//        //创建XStream对象
//        XStream xstream=new XStream();
//        //设置根节点为“xml” ，也可以设置为"root"，这个根据需要
//        xstream.alias("xml", textMessage.getClass());
//        //将对象转换为xml格式的字符串
//        String xml = xstream.toXML(textMessage);
//        return xml;
//    }
//    /*
//     * 回复文本消息
//     * */
//    public static  String initTextMessage(String toUserName,String fromUserName,String content ){
//        TextMessageBack text = new TextMessageBack();
//        text.setFromUserName(toUserName);
//        text.setToUserName(fromUserName);
//        text.setMsgType(MESSAGE_TEXT);
//        text.setCreateTime(new Date().getTime());
//        text.setContent(content);
//        return initTextMessageToXml(text);
//    }
    /*
     * 将文本消息转换为xml（最新有用的）
     * */
    public static  String textMessageToXmlString(String toUserName,String fromUserName,String content ){
        String xmlText= "<xml>" +
                "<ToUserName><![CDATA["+fromUserName+"]]></ToUserName>"
                +"<FromUserName><![CDATA["+toUserName+"]]></FromUserName>" +
                "<CreateTime>"+new Date().getTime()+"</CreateTime>" +
                "<MsgType><![CDATA[text]]></MsgType>" +
                "<Content><![CDATA["+content+"]]></Content>" +
                "</xml>";
        return xmlText;
    }
    /*
     * 将图片消息转换为xml（最新有用的）
     * */
    public static  String imageMessageToXmlString(String toUserName,String fromUserName,String imageMediaId ){

        String xmlImage= "<xml>" +
                "<ToUserName><![CDATA["+fromUserName+"]]></ToUserName>"
                +"<FromUserName><![CDATA["+toUserName+"]]></FromUserName>" +
                "<CreateTime>"+new Date().getTime()+"</CreateTime>" +
                "<MsgType><![CDATA[image]]></MsgType>" +
                "<Image>" +
                "<MediaId><![CDATA["+imageMediaId+"]]></MediaId>" +
                "</Image>" +
                "</xml>";
        return xmlImage;
    }
    /*
     * 将视频消息转换为xml（最新有用的）
     * */
    public static  String videoMessageToXmlString(String toUserName,String fromUserName,VideoMessage videoMessage ){

        String xmlVideo= "<xml>" +
                "<ToUserName><![CDATA["+fromUserName+"]]></ToUserName>"
                +"<FromUserName><![CDATA["+toUserName+"]]></FromUserName>" +
                "<CreateTime>"+new Date().getTime()+"</CreateTime>" +
                " <MsgType><![CDATA[video]]></MsgType>\n" +
                "  <Video>\n" +
                "    <MediaId><![CDATA["+videoMessage.getVideo().getMediaId()+"]]></MediaId>\n" +
                "    <Title><![CDATA["+videoMessage.getVideo().getTitle()+"]]></Title>\n" +
                "    <Description><![CDATA["+videoMessage.getVideo().getDescription()+"]]></Description>\n" +
                "  </Video>" +

                "</xml>";
        return xmlVideo;
    }
    /*
     * 将图文消息转换为xml（最新有用的）
     * */
    public static  String newsMessageToXmlString(String toUserName,String fromUserName,News news ){

        String xmlNews= "<xml>\n" +
                "  <ToUserName><![CDATA["+fromUserName+"]]></ToUserName>\n" +
                "  <FromUserName><![CDATA["+toUserName+"]]></FromUserName>\n" +
                "  <CreateTime>"+new Date().getTime()+"</CreateTime>\n" +
                "  <MsgType><![CDATA[news]]></MsgType>\n" +
                "  <ArticleCount>1</ArticleCount>\n" +
                "  <Articles>\n" +
                "    <item>\n" +
                "      <Title><![CDATA["+news.getTitle()+"]]></Title>\n" +
                "      <Description><![CDATA["+news.getContent()+"]]></Description>\n" +
                "      <PicUrl><![CDATA["+news.getThumb().getThumbURL()+"]]></PicUrl>\n" +
                "      <Url><![CDATA["+news.getContentSourceUrl()+"]]></Url>\n" +
                "    </item>\n" +
                "  </Articles>\n" +
                "</xml>";
        return xmlNews;
    }
    /*
     * 将音乐消息转换为xml（最新有用的）
     * */
    public static  String musicMessageToXmlString(String toUserName,String fromUserName ){

        String xmlMusic= "<xml>\n" +
                "  <ToUserName><![CDATA["+fromUserName+"]]></ToUserName>\n" +
                "  <FromUserName><![CDATA["+toUserName+"]]></FromUserName>\n" +
                "  <CreateTime>"+new Date().getTime()+"</CreateTime>\n" +
                "  <MsgType><![CDATA[music]]></MsgType>\n" +
                "  <Music>\n" +
                "    <Title><![CDATA[SeeYouAgain]]></Title>\n" +
                "    <Description><![CDATA[SeeYouAgain]]></Description>\n" +
                "    <MusicUrl><![CDATA[http://23c32214i1.imwork.net:80//statics/music/SeeYouAgain.mp3]]></MusicUrl>\n" +
                "    <HQMusicUrl><![CDATA[http://23c32214i1.imwork.net:80//statics/music/SeeYouAgain.mp3]]></HQMusicUrl>\n" +
                "    <ThumbMediaId><![CDATA[2JcTg6XtUAzRK-yMX2IhdiEGje9xl5fGaOZ8UUS0mfb5sEESsgWVDBLCcjHDMxvO]]></ThumbMediaId>\n" +
                "  </Music>\n" +
                "</xml>";
        return xmlMusic;
    }
    /*
     * 将语音消息转换为xml（最新有用的）
     * */
    public static  String voiceMessageToXmlString(String toUserName,String fromUserName,String voiceMediaId ){

        String xmlVoice= "<xml>\n" +
                "  <ToUserName><![CDATA["+fromUserName+"]]></ToUserName>\n" +
                "  <FromUserName><![CDATA["+toUserName+"]]></FromUserName>\n" +
                "  <CreateTime>"+new Date().getTime()+"</CreateTime>\n" +
                "  <MsgType><![CDATA[voice]]></MsgType>\n" +
                "  <Voice>\n" +
                "    <MediaId><![CDATA["+voiceMediaId+"]]></MediaId>\n" +
                "  </Voice>\n" +
                "</xml>";
        return xmlVoice;
    }

    /*
    *  主菜单即提示信息
    * */
    public static String menuText(){
        StringBuffer sb=new StringBuffer();
        sb.append("欢迎您的关注，请按照菜单提示进行操作：\n\n");
        sb.append("回复“1”，公众号介绍；\n");
        sb.append("回复“2”，公众号功能；\n");
        sb.append("回复任意字符，寻找彩蛋；\n");
        sb.append("回复“？”，调出此菜单!");
        return sb.toString();
    }
    public static String firstMenu(){
        StringBuffer sb=new StringBuffer();
        sb.append("本公众号就是为了测试微信公众号管理平台的功能等");
        return sb.toString();
    }
    public static String secondMenu(){
        StringBuffer sb=new StringBuffer();
        sb.append("本平台包括了公众号的各种基本设置，同时含有微应用、小程序等");
        return sb.toString();
    }

    /*
    * 将一个图文消息对象转换为对应的XML文档：
    * */
    public static String newsMessageToXml(NewsMessage newsMessage){
        //创建XStream对象
        XStream xstream=new XStream();
        //设置根节点为“xml”，将News的根节点设置为“item”
        xstream.alias("xml", newsMessage.getClass());
        xstream.alias("item",new News().getClass());
        //将对象转换为xml格式的字符串
        String xml = xstream.toXML(newsMessage);
        return xml;
    }
    /*
    * 设置图文消息
    * */
//    public static  String initNewsMessage(String toUserName,String fromUserName,List<News> list){
//        String message=null;
//        List<News> newsList=new ArrayList<News>();
//        NewsMessage newsMessage=new NewsMessage();
//        for (News n:list){
//            News news=new News();
//            news.setTitle(n.getTitle());
//            news.setDescription(n.getDescription());
//            news.setPicUrl(n.getpicUrl());
//            news.setUrl(n.getUrl());
//            newsList.add(news);
//        }
////        News news=new News();
////        news.setTitle("伪微信管理平台");
////        news.setDescription("介绍伪微信管理平台");
////        news.setPicUrl(HttpURL+"/images/big.jpg");
////        news.setUrl("www.baidu.com");
////        newsList.add(news);
////        news=new News();
////        news.setTitle("图文消息回复");
////        news.setDescription("测试多图文消息回复");
////        news.setPicUrl(HttpURL+"/images/1.jpg");
////        news.setUrl("https://mp.weixin.qq.com");
////        newsList.add(news);
//        newsMessage.setFromUserName(toUserName);
//        newsMessage.setToUserName(fromUserName);
//        newsMessage.setMsgType(MESSAGE_NEWS);
//        newsMessage.setCreateTime(new Date().getTime());
//        newsMessage.setArticles(newsList);
//        newsMessage.setArticleCount(newsList.size());
//        message=newsMessageToXml(newsMessage);
//        return message;
//    }

/*
*  将一个图片消息对象转换为对应的XML文档：
* */
    public static String imageMessageToXml(ImagesMessage imagesMessage){
        //创建XStream对象
        XStream xstream=new XStream();
        //设置根节点为“xml”，将News的根节点设置为“item”
        xstream.alias("xml", imagesMessage.getClass());
        //将对象转换为xml格式的字符串
        String xml = xstream.toXML(imagesMessage);
        return xml;
    }

    /*
     * 组装图片消息
     * */
    public static  String initimagesMessage(String toUserName,String fromUserName,String mediaId){
        String message=null;
        Image image =new Image();
        image.setMediaId(mediaId);//由图片上传得到
        ImagesMessage imagesMessage = new ImagesMessage();
        imagesMessage.setFromUserName(toUserName);
        imagesMessage.setToUserName(fromUserName);
        imagesMessage.setMsgType(MESSAGE_image);
        imagesMessage.setCreateTime(new Date().getTime());
        imagesMessage.setImage(image);
        message=imageMessageToXml(imagesMessage);
        return message;
    }
    /*
     *  将一个语音消息对象转换为对应的XML文档：
     * */
    public static String voiceMessageToXml(VoiceMessage voiceMessage){
        //创建XStream对象
        XStream xstream=new XStream();
        //设置根节点为“xml”，将News的根节点设置为“item”
        xstream.alias("xml", voiceMessage.getClass());
        //将对象转换为xml格式的字符串
        String xml = xstream.toXML(voiceMessage);
        return xml;
    }
    /*
     * 组装语音消息
     * */
    public static  String initVoiceMessage(String toUserName,String fromUserName,String mediaId){
        String message=null;
        Voice voice =new Voice();
        voice.setMediaId(mediaId);//由语音上传得到
        VoiceMessage voiceMessage = new VoiceMessage();
        voiceMessage.setFromUserName(toUserName);
        voiceMessage.setToUserName(fromUserName);
        voiceMessage.setMsgType(MESSAGE_VOICE);
        voiceMessage.setCreateTime(new Date().getTime());
        voiceMessage.setVoice(voice);
        message=voiceMessageToXml(voiceMessage);
        return message;
    }
    /*
     *  将一个视频消息对象转换为对应的XML文档：
     * */
    public static String videoMessageToXml(VideoMessage videoMessage){
        //创建XStream对象
        XStream xstream=new XStream();
        //设置根节点为“xml”，将News的根节点设置为“item”
        xstream.alias("xml", videoMessage.getClass());
        //将对象转换为xml格式的字符串
        String xml = xstream.toXML(videoMessage);
        return xml;
    }
    /*
     * 组装视频消息
     * */
    public static  String initVideoMessage(String toUserName,String fromUserName,Video vid){
        String message=null;
        Video video =new Video();
        video.setMediaId(vid.getMediaId());//由视频上传得到
        video.setTitle(vid.getTitle());
        video.setDescription(vid.getDescription());
        VideoMessage videoMessage = new VideoMessage();
        videoMessage.setFromUserName(toUserName);
        videoMessage.setToUserName(fromUserName);
        videoMessage.setMsgType(MESSAGE_VIDEO);
        videoMessage.setCreateTime(new Date().getTime());
        videoMessage.setVideo(video);
        message=videoMessageToXml(videoMessage);
        return message;
    }

    /*
     *  将一个音乐消息对象转换为对应的XML文档：
     * */
    public static String musicMessageToXml(MusicMessage musicMessage){
        //创建XStream对象
        XStream xstream=new XStream();
        //设置根节点为“xml”，将News的根节点设置为“item”
        xstream.alias("xml", musicMessage.getClass());
        //将对象转换为xml格式的字符串
        String xml = xstream.toXML(musicMessage);
        return xml;
    }
    /*
     * 组装音乐消息
     * */
    public static  String initMusicMessage(String toUserName,String fromUserName,Music mus){
        String message=null;
        Music music =new Music();
        music.setThumbmediaId(mus.getThumbmediaId());//由图片上传得到
//        System.out.println(mus.getThumbmediaId());
        music.setTitle(mus.getTitle());
        music.setDescription(mus.getDescription());
        music.setMusicUrl(mus.getMusicUrl());
        music.setHqMusicUrl(mus.getHqMusicUrl());
        MusicMessage musicMessage=new MusicMessage();
        musicMessage.setFromUserName(toUserName);
        musicMessage.setToUserName(fromUserName);
        musicMessage.setMsgType(MESSAGE_MUSIC);
        musicMessage.setCreateTime(new Date().getTime());
        musicMessage.setMusic(music);
        message=musicMessageToXml(musicMessage);
        return message;
    }
//    /*
//     * 关注后消息
//     * */
//    public static  String initSubscribe(String toUserName,String fromUserName,String content ){
//        TextMessage text = new TextMessage();
//        text.setFromUserName(toUserName);
//        text.setToUserName(fromUserName);
//        text.setMsgType(MESSAGE_TEXT);
//        text.setCreateTime(new Date().getTime());
//        text.setContent(content);
//        return textMessageToXml(text);
//    }

}
