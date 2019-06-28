package com.wechat.controller;

import com.wechat.entity.AccessToken;
import com.wechat.entity.Account;
import com.wechat.entity.LayuiResult;
import com.wechat.entity.TextMessage;
import com.wechat.service.Impl.AccountServiceImpl;
import com.wechat.service.Impl.TextMessageServiceImpl;
import com.wechat.util.WeixinUtil;
//import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/Send")
@SessionAttributes(value = {"textMsg"})
public class Send {
    @Resource(name = "accountService")
    private AccountServiceImpl accountService;
    @Resource(name="textMessageService")
    private TextMessageServiceImpl textMessageService;

    @RequestMapping(value = "/sendALL")
    @ResponseBody
    public LayuiResult sendall(@RequestBody String[] openids, HttpSession session) throws Exception {
        String accountName= (String) session.getAttribute("accountName");
        Account account=new Account();
        account.setName(accountName);
        account=accountService.selectAccount(accountName);
        TextMessage textMsg= (TextMessage) session.getAttribute("textMsg");
        List<String> openID=new ArrayList<>();
//        net.sf.json.JSONObject json1= new net.sf.json.JSONObject();
//        net.sf.json.JSONObject json2=new net.sf.json.JSONObject();
        JSONObject json1= new JSONObject();
        JSONObject json2=new JSONObject();
        for(int i=0;i<openids.length;i++){
            openID.add(openids[i]);
        }
        json2.put("touser",openID);
        json2.put("msgtype","text");
        json1.put("content",textMsg.getContent());
        json2.put("text",json1);
//        JSONArray jsonArray=new JSONArray();
//        jsonArray.add(json2);
        String data=json2.toString();
        AccessToken accessToken=WeixinUtil.getAccessToken(account.getAppid(),account.getAppsecret());
        String token=accessToken.getAccess_token();
        String errorcode=WeixinUtil.sendByOpenID(token,data);

        LayuiResult result = new LayuiResult();
        if ("0".equals(errorcode)) {
            result.setMsg("群发成功，微信端接收还需一点时间！");
        } else {
            result.setMsg("错误码："+errorcode);
        }
        return result;
    }




    @RequestMapping(value = "/sendMessage")
    @ResponseBody
    public LayuiResult sendMessage(@RequestBody String[] openids, @RequestParam("messageId") int messageId,@RequestParam("messageType") String messageType, HttpSession session) throws Exception {
        String accountName= (String) session.getAttribute("accountName");
        Account account=new Account();
        account.setName(accountName);
        account=accountService.selectAccount(accountName);

//        TextMessage textMsg= (TextMessage) session.getAttribute("textMsg");
//        List<String> openID=new ArrayList<>();
////        net.sf.json.JSONObject json1= new net.sf.json.JSONObject();
////        net.sf.json.JSONObject json2=new net.sf.json.JSONObject();
//        JSONObject json1= new JSONObject();
//        JSONObject json2=new JSONObject();
//        for(int i=0;i<openids.length;i++){
//            openID.add(openids[i]);
//        }
//        json2.put("touser",openID);
//        json2.put("msgtype","text");
//        json1.put("content",textMsg.getContent());
//        json2.put("text",json1);
////        JSONArray jsonArray=new JSONArray();
////        jsonArray.add(json2);
//        String data=json2.toString();
        String errorcode="error";
        AccessToken accessToken=WeixinUtil.getAccessToken(account.getAppid(),account.getAppsecret());
        String token=accessToken.getAccess_token();
//        if (messageType.equals("text")){
//            TextMessage textMessage=new TextMessage();
//            textMessage=textMessageService.selectTextMessageByBaseMessageID(messageId);
//            errorcode=WeixinUtil.sendTextMessageByOpenID(token,openids,textMessage.getContent());
//        }
        switch (messageType){
            case "text":{
                TextMessage textMessage=new TextMessage();
                textMessage=textMessageService.selectTextMessageByBaseMessageID(messageId);
                errorcode=WeixinUtil.sendTextMessageByOpenID(token,openids,textMessage.getContent());
                break;
            }
            case "image":{
                TextMessage textMessage=new TextMessage();
                textMessage=textMessageService.selectTextMessageByBaseMessageID(messageId);
                errorcode=WeixinUtil.sendTextMessageByOpenID(token,openids,textMessage.getContent());
                break;
            }
            case "news":{
                TextMessage textMessage=new TextMessage();
                textMessage=textMessageService.selectTextMessageByBaseMessageID(messageId);
                errorcode=WeixinUtil.sendTextMessageByOpenID(token,openids,textMessage.getContent());
                break;
            }
            case "voice":{
                TextMessage textMessage=new TextMessage();
                textMessage=textMessageService.selectTextMessageByBaseMessageID(messageId);
                errorcode=WeixinUtil.sendTextMessageByOpenID(token,openids,textMessage.getContent());
                break;
            }
            case "video":{
                TextMessage textMessage=new TextMessage();
                textMessage=textMessageService.selectTextMessageByBaseMessageID(messageId);
                errorcode=WeixinUtil.sendTextMessageByOpenID(token,openids,textMessage.getContent());
                break;
            }
            default:{
                errorcode="群发失败，请刷新页面重试！";
            }
        }

//        String errorcode=WeixinUtil.sendByOpenID(token,data);
        String[]  abd=openids;
//        String errorcode="111";
        LayuiResult result = new LayuiResult();
        if ("0".equals(errorcode)) {
            result.setMsg("群发成功，微信端接收还需一点时间！");
        } else {
            result.setMsg("错误码："+errorcode);
        }
        return result;
    }

}
