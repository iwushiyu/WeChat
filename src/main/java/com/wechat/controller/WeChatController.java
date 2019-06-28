package com.wechat.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.wechat.entity.*;
import com.wechat.service.Impl.*;
import com.wechat.util.CheckUtil;
import com.wechat.util.MessageUtil;
import com.wechat.util.WeixinUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@Controller
@SessionAttributes(value = {"systemUserSession","accountSession"})
@RequestMapping("/WeChat")
public class WeChatController {
    @Resource(name = "accountService")
    private AccountServiceImpl accountService;
    @Resource(name="baseMessageService")
    private BaseMessageServiceImpl baseMessageService;
    @Resource(name="textMessageService")
    private TextMessageServiceImpl textMessageService;
    @Resource(name="imagesMessageService")
    private ImagesMessageServiceImpl imagesMessageService;
    @Resource(name="musicMessageService")
    private MusicMessageServiceImpl musicMessageService;
    @Resource(name="newsMessageService")
    private NewsMessageServiceImpl newsMessageService;

    @Resource(name="videoMessageService")
    private  VideoMessageServiceImpl videoMessageService;
    @Resource(name="voiceMessageService")
    private  VoiceMessageServiceImpl voiceMessageService;
    @Resource(name = "fansService")
    private  FansServiceImpl fansService;
    @Resource(name = "newsService")
    private NewsServiceImpl newsService;

    /*
    * 添加公众号时产生对应的URL
    * */
    @RequestMapping(value = "/getURL",method = RequestMethod.POST)
    @ResponseBody
    public Object index(@RequestParam(value = "name") String name, @RequestParam(value = "account")String account,
                        @RequestParam(value = "appid")String appid, @RequestParam(value = "appsecret")String appsecret,
                        Model model){
        String token=CheckUtil.getRandomString(15);
        String url=MessageUtil.HttpURL+"/WeChat/validate";
        Account acc=new Account();
        appid=appid.replace(" ", "");
        appsecret=appsecret.replace(" ", "");
        acc.setName(name);
        acc.setAccount(account);
        acc.setUrl(url);
        acc.setToken(token);
        acc.setAppid(appid);
        acc.setAppsecret(appsecret);
        acc.setCreateTime(new Date().getTime());
        model.addAttribute("account",account);
        accountService.addAccount(acc);
        return JSONObject.parse(JSONArray.toJSONString(acc));
    }

    @RequestMapping(value ="/validate",method = RequestMethod.GET)
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String signature = request.getParameter("signature");
        String timestamp = request.getParameter("timestamp");
        String nonce = request.getParameter("nonce");
        String echostr = request.getParameter("echostr");
        PrintWriter out = response.getWriter();
        List<Account> accountList=accountService.all();
        boolean flag=false;
        for (Account acc:accountList){
            String token=acc.getToken();
            if(CheckUtil.checkSignature(signature, timestamp, nonce,token)){
//如果校验成功，将得到的随机字符串原路返回
                out.print(echostr);
                flag=true;
                break;
            }
        }
        if(flag){
            System.out.println("验证成功");
        }else{
            System.out.println("验证失败");
        }
    }

    @RequestMapping(value = "/validate",method = RequestMethod.POST,produces = {"application/xml; charset=UTF-8"})
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Map<String, String> map = MessageUtil.xmlToMap(request);
            String toUserName = map.get("ToUserName");//toUserName就是微信号
            String fromUserName = map.get("FromUserName");
            String msgType = map.get("MsgType");
            String content = map.get("Content");
            String message = null;
            Account account=accountService.selectAccountByAccount(toUserName);
            String accountName=account.getName();
            BaseMessage baseMessage=new BaseMessage();
            if (MessageUtil.MESSAGE_TEXT.equals(msgType)) {
                //接受文本信息
                baseMessage.setAccountName(accountName);
                baseMessage.setInputCode(content);

                System.out.println(baseMessage.getInputCode());
                baseMessage=baseMessageService.getByInputCode(baseMessage);
                if(baseMessage!=null){
                    if (MessageUtil.MESSAGE_TEXT.equals(baseMessage.getMsgType())){
                        //如果是需要回复文本类型的消息
                        System.out.println("文本消息");
                        TextMessage textMessage=textMessageService.selectTextMessage(baseMessage);
//                        message= "<xml><ToUserName><![CDATA["+fromUserName+"]]></ToUserName>" +"<FromUserName><![CDATA["+toUserName+"]]></FromUserName><CreateTime>"+new Date().getTime()+"</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA["+textMessage.getContent()+"]]></Content></xml>";

                        message=MessageUtil.textMessageToXmlString(toUserName,fromUserName,textMessage.getContent());
                    }else if(MessageUtil.MESSAGE_image.equals(baseMessage.getMsgType())){
                        //如果是需要回复图片类型的消息
                        System.out.println("图片消息");
                        ImagesMessage imagesMessage=imagesMessageService.selectImageMessage(baseMessage.getId());
//                        message=MessageUtil.initimagesMessage(toUserName,fromUserName,imagesMessage.getImage().getMediaId());
                        message=MessageUtil.imageMessageToXmlString(toUserName,fromUserName,imagesMessage.getImage().getMediaId());
                    }else if(MessageUtil.MESSAGE_MUSIC.equals(baseMessage.getMsgType())){
                        //如果是需要回复音乐消息
                        /*
                        * 此功能基本没用
                        * 因为数据库库中没保存*/
                        System.out.println("音乐消息");

                        message=MessageUtil.musicMessageToXmlString(toUserName,fromUserName);
//                        message=MessageUtil.initMusicMessage(toUserName,fromUserName,music);
                    }else if (MessageUtil.MESSAGE_VOICE.equals(baseMessage.getMsgType())){
                        //如果是需要回复语音消息
                        System.out.println("语音消息");
                        VoiceMessage voiceMessage=voiceMessageService.selectVoiceMessageByBaseId(baseMessage.getId());
                        message=MessageUtil.voiceMessageToXmlString(toUserName,fromUserName,voiceMessage.getVoice().getMediaId());
//                        message=MessageUtil.initVoiceMessage(toUserName,fromUserName,voiceMessage.getVoice().getMediaId());
                    }else if (MessageUtil.MESSAGE_VIDEO.equals(baseMessage.getMsgType())){
                        //如果是需要回复视频消息
                        System.out.println("视频消息");
                        VideoMessage videoMessage=videoMessageService.selectVideoMessage(baseMessage.getId());
                        message=MessageUtil.videoMessageToXmlString(toUserName,fromUserName,videoMessage);
//                        message=MessageUtil.initVideoMessage(toUserName,fromUserName,videoMessage);
                    }else if (MessageUtil.MESSAGE_NEWS.equals(baseMessage.getMsgType())){
                        //如果是需要回复图文消息
                        System.out.println("图文消息");
                        List<NewsMessage> newsMessageList=null;
                        NewsMessage newsMessage=newsMessageService.selectNewsMessage(baseMessage.getId());
                        News news=newsService.selectNewsByNewsID(newsMessage.getNewsId());
                        message=MessageUtil.newsMessageToXmlString(toUserName,fromUserName,news);
                        List<News> newsList = null;

//                        for (NewsMessage s:newsMessageList) {
////                            newsList = s.getArticles();
//                        }
//                        message=MessageUtil.initNewsMessage(toUserName,fromUserName,newsList);
                    }
                }
                else{//回复菜单
//                     message= "<xml><ToUserName><![CDATA["+fromUserName+"]]></ToUserName>" +"<FromUserName><![CDATA["+toUserName+"]]></FromUserName><CreateTime>"+new Date().getTime()+"</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA[大家好！]]></Content></xml>";
                    if ("music".equals(content)){
                        /*
                        * 为了提供一个音乐消息*/
                        message=MessageUtil.musicMessageToXmlString(toUserName,fromUserName);
                    }else{
                        message=MessageUtil.textMessageToXmlString(toUserName,fromUserName,"对不起，不是彩蛋，请继续寻找！");
                    }

                 }
            } else if (MessageUtil.MESSAGE_image.equals(msgType)){
                //接收图片信息
//                TextMessage text = new TextMessage();
//                text.setFromUserName(toUserName);
//                text.setToUserName(fromUserName);
//                text.setMsgType(MessageUtil.MESSAGE_TEXT);
//                text.setCreateTime(new Date().getTime());
//                text.setContent("您发送的消息是：图片消息" );
//                message = MessageUtil.textMessageToXml(text);
                message=MessageUtil.textMessageToXmlString(toUserName,fromUserName,"您发送的消息是：图片消息");
            }else if (MessageUtil.MESSAGE_VOICE.equals(msgType)){
                //接收语音信息
//                TextMessage text = new TextMessage();
//                text.setFromUserName(toUserName);
//                text.setToUserName(fromUserName);
//                text.setMsgType(MessageUtil.MESSAGE_TEXT);
//                text.setCreateTime(new Date().getTime());
//                text.setContent("您发送的消息是：语音消息" );
//                message = MessageUtil.textMessageToXml(text);
                message=MessageUtil.textMessageToXmlString(toUserName,fromUserName,"您发送的消息是：语音消息");
            }else if (MessageUtil.MESSAGE_VIDEO.equals(msgType)){
                //接收视频信息
//                TextMessage text = new TextMessage();
//                text.setFromUserName(toUserName);
//                text.setToUserName(fromUserName);
//                text.setMsgType(MessageUtil.MESSAGE_TEXT);
//                text.setCreateTime(new Date().getTime());
//                text.setContent("您发送的消息是：视频消息" );
//                message = MessageUtil.textMessageToXml(text);
                message=MessageUtil.textMessageToXmlString(toUserName,fromUserName,"您发送的消息是：语音消息");
            }else if (MessageUtil.MESSAGE_SHORTVIDEO.equals(msgType)){
                //接收小视频信息
//                TextMessage text = new TextMessage();
//                text.setFromUserName(toUserName);
//                text.setToUserName(fromUserName);
//                text.setMsgType(MessageUtil.MESSAGE_TEXT);
//                text.setCreateTime(new Date().getTime());
//                text.setContent("您发送的消息是：小视频消息" );
//                message = MessageUtil.textMessageToXml(text);
                message=MessageUtil.textMessageToXmlString(toUserName,fromUserName,"您发送的消息是：小视频消息");
            }else if (MessageUtil.MESSAGE_LINK.equals(msgType)){
                //接收链接信息
//                TextMessage text = new TextMessage();
//                text.setFromUserName(toUserName);
//                text.setToUserName(fromUserName);
//                text.setMsgType(MessageUtil.MESSAGE_TEXT);
//                text.setCreateTime(new Date().getTime());
//                text.setContent("您发送的消息是：链接消息" );
//                message = MessageUtil.textMessageToXml(text);
                message=MessageUtil.textMessageToXmlString(toUserName,fromUserName,"您发送的消息是：链接消息");
            }else if (MessageUtil.MESSAGE_EVENT.equals(msgType)) {
                String eventType = map.get("Event");
                if (MessageUtil.MESSAGE_SUBSCRIBE.equals(eventType)) {
                    /*
                    * 订阅
                    * */
                    AccessToken token=WeixinUtil.getAccessToken(account.getAppid(),account.getAppsecret());
                    net.sf.json.JSONObject jsonObject=WeixinUtil.getUsersInfo(token.getAccess_token(),fromUserName);
                    System.out.println(jsonObject);
                    Fans fans=new Fans();
                    fans.setSubscribeStatus(jsonObject.getInt("subscribe"));
                    fans.setOpenId(jsonObject.getString("openid"));
                    fans.setAccount(accountName);//设置公众号为当前公众号
                    fans.setCountry(jsonObject.getString("country"));
                    fans.setSex(jsonObject.getInt("sex"));
                    fans.setCity(jsonObject.getString("city"));
                    fans.setProvince(jsonObject.getString("province"));
                    fans.setLanguage(jsonObject.getString("language"));
                    fans.setHeadImgUrl(jsonObject.getString("headimgurl"));
                    fans.setSubscribeTime(new Date().getTime());
                    fans.setNickName(jsonObject.getString("nickname"));
                    if (fansService.selectFans(fans)==null){
                        fansService.addFans(fans);//将获取到的粉丝信息插入到数库
                    }else{
                        fansService.updateFnas(fans);
                    }
                    message = MessageUtil.textMessageToXmlString(toUserName, fromUserName, MessageUtil.menuText());
                }else if(MessageUtil.MESSAGE_UNSUBSCRIBE.equals(eventType)){
                    /*
                     * 取消订阅事件
                     * */
                    Fans fans=new Fans();
                    fans.setOpenId(fromUserName);
                    fans.setAccount(accountName);
                    fansService.deleteFans(fans);//将获取到的粉丝信息从数据库中删除
                }else if(MessageUtil.MESSAGE_CLICK.equals(eventType)){
                    /*
                    * 点击事件
                    * */
                    message = MessageUtil.textMessageToXmlString(toUserName, fromUserName, MessageUtil.menuText());
                }else if(MessageUtil.MESSAGE_VIEW.equals(eventType)){
                    String url=map.get("EventKey");
                    message = MessageUtil.textMessageToXmlString(toUserName, fromUserName,url);
                }else if(MessageUtil.MESSAGE_SCANCODE_PUSH.equals(eventType)){
                    String key=map.get("EventKey");
                    message = MessageUtil.textMessageToXmlString(toUserName, fromUserName,key);
                }
            }else if (MessageUtil.MESSAGE_LOCATION.equals(msgType)){
                String Label=map.get("Label");
                message = MessageUtil.textMessageToXmlString(toUserName, fromUserName,Label);
            }
            System.out.println(message);
            out.println(message);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            out.close();
        }
    }
}
