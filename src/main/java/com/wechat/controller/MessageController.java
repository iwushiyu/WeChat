package com.wechat.controller;

import com.wechat.entity.*;
import com.wechat.service.Impl.*;
import com.wechat.util.WeixinUtil;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/Message")
@SessionAttributes(value = {"textMsg"})
public class MessageController {
    @Resource(name = "accountService")
    private AccountServiceImpl accountService;
    @Resource(name="baseMessageService")
    private BaseMessageServiceImpl baseMessageService;
    @Resource(name="textMessageService")
    private TextMessageServiceImpl textMessageService;
    @Resource(name="newsMessageService")
    private NewsMessageServiceImpl newsMessageService;
    @Resource(name = "newsService")
    private NewsServiceImpl newsService;
    @Resource(name="imagesMessageService")
    private ImagesMessageServiceImpl imagesMessageService;
    @Resource(name="videoMessageService")
    private VideoMessageServiceImpl videoMessageService;
    @Resource(name="voiceMessageService")
    private VoiceMessageServiceImpl voiceMessageService;
    @Resource(name = "fansService")
    private FansServiceImpl fansService;

    /*
     * 获取基础消息
     * */
    public BaseMessage getBaseMessage(BaseMessage baseMessage) {
        boolean flag=false;
        baseMessage=baseMessageService.selectBaseMessage(baseMessage);
        return baseMessage;
    }
    /*
     * 通过关键词获取基础消息
     * */
    public BaseMessage getBaseMessageByInputCode(BaseMessage baseMessage) {
        boolean flag=false;
        baseMessage=baseMessageService.getByInputCode(baseMessage);
        return baseMessage;
    }
    /*
     * 添加基础消息
     * */
    public int addBaseMessage(BaseMessage baseMessage) {
        int baseMessageID=0;
        baseMessageID=baseMessageService.addBaseMessage(baseMessage);
        return  baseMessageID;
    }

    /*
     * 删除基础消息
     * */
    public boolean deleteBaseMessage(BaseMessage baseMessage) {
        boolean flag=false;
        flag=baseMessageService.deleteBaseMessage(baseMessage);
        return flag;
    }

    /*
     * 修改基础消息
     * */
    public boolean editBaseMessage(BaseMessage baseMessage) {
        boolean flag=false;
        flag=baseMessageService.updateBaseMessage(baseMessage);
        return flag;
    }



    /*显示所有消息
    * */
    @RequestMapping(value = "/showMessage")
    @ResponseBody
    public MessageData showMessage(String keyword, Integer page, Integer limit,HttpSession session) {
        List<BaseMessage> baseMessageList=new ArrayList<>();
        String accountName= (String) session.getAttribute("accountName");
        MessageData messageData=new MessageData();
        List<BaseMessage>list =new ArrayList<>();
        BaseMessage baseMessage=new BaseMessage();
        if (keyword==null||keyword.length()==0){
            list =baseMessageService.selectAllBaseMessage(accountName);
        }else{
            baseMessage.setInputCode(keyword);
            baseMessage.setAccountName(accountName);
            list =baseMessageService.search(baseMessage);
        }
        List<BaseMessage> list1 = new ArrayList<>();
        if (list.size() <= limit) {
            for (int i = 0; i < list.size(); i++) {
                list1.add(list.get(i));
            }
        } else if (list.size() > limit) {
            if (page <= (list.size() / limit)) {
                for (int i = (page - 1) * limit; i < page * limit; i++) {
                    list1.add(list.get(i));
                }
            } else if (page > (list.size() / limit)) {
                for (int i = (page - 1) * limit; i < (((page - 1) * limit) + list.size() % limit); i++) {
                    list1.add(list.get(i));
                }
            }
        }
        messageData.setData(list1);
        messageData.setCount(list.size());
        return messageData;
    }
    /*显示所有文本消息
     * */
    @RequestMapping(value = "/getAllTextMessage")
    @ResponseBody
    public MessageData getAllTextMessage(String keyword, Integer page, Integer limit,HttpSession session) {
        List<BaseMessage> baseMessageList=new ArrayList<>();
        String accountName= (String) session.getAttribute("accountName");
        MessageData messageData=new MessageData();
        List<BaseMessage>list =new ArrayList<>();
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setMsgType("text");
        baseMessage.setAccountName(accountName);
        if (keyword==null||keyword.length()==0){
            list =baseMessageService.getAllTextMessage(baseMessage);
        }else{
            baseMessage.setInputCode(keyword);
            baseMessage.setAccountName(accountName);
            list =baseMessageService.search(baseMessage);
        }
        List<TextMessage> textMessageList = new ArrayList<>();
        TextMessage textMessage=new TextMessage();
        for (int i = 0; i < list.size(); i++){
            textMessage=textMessageService.selectTextMessageByBaseMessageID(list.get(i).getId());
            textMessage.setInputCode(list.get(i).getInputCode());
            textMessage.setCreateTime(list.get(i).getCreateTime());
            textMessage.setAccountName(list.get(i).getAccountName());
            textMessage.setMsgType(list.get(i).getMsgType());
            textMessageList.add(textMessage);
        }
        List<TextMessage> list1 = new ArrayList<>();
        if (list.size() <= limit) {
            for (int i = 0; i < list.size(); i++) {
                list1.add(textMessageList.get(i));
            }
        } else if (list.size() > limit) {
            if (page <= (list.size() / limit)) {
                for (int i = (page - 1) * limit; i < page * limit; i++) {
                    list1.add(textMessageList.get(i));
                }
            } else if (page > (list.size() / limit)) {
                for (int i = (page - 1) * limit; i < (((page - 1) * limit) + list.size() % limit); i++) {
                    list1.add(textMessageList.get(i));
                }
            }
        }
        messageData.setData(list1);
        messageData.setCount(list.size());
        return messageData;
    }

    /*
     * 根据baseMessageID删除消息
     * */

    @RequestMapping(value = "/deleteMessage", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteMessage(@RequestParam("baseMessageID") int baseMessageID,@RequestParam("msgType") String msgType) {
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setId(baseMessageID);
        boolean flag=false;
        flag=deleteBaseMessage(baseMessage);
        if (flag){
            if ("text".equals(msgType)){
                flag=textMessageService.deleteTextMessage(baseMessage);
            }else if ("news".equals(msgType)){
                flag=newsMessageService.deleteNewsMessage(baseMessage);
            }else  if ("image".equals(msgType)){
                flag=imagesMessageService.deleteImageMessage(baseMessage);
            }else  if ("voice".equals(msgType)){
                flag=voiceMessageService.deleteVoiceMessage(baseMessage);
            }else  if ("video".equals(msgType)){
                flag=videoMessageService.deleteVideoMessage(baseMessage);
            }else{
                flag=false;
            }

        }
        return  flag;
    }



    /*
     * 添加文本消息
     * */

    @RequestMapping(value = "/addTextMessage", method = RequestMethod.POST)
    @ResponseBody
    public String addTextMessage(@RequestBody TextMessage text, HttpSession session) {
        String accountName= (String) session.getAttribute("accountName");
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setInputCode(text.getInputCode());
        baseMessage.setAccountName(accountName);
        BaseMessage baseMessage1=new BaseMessage();
        baseMessage1=baseMessageService.getByInputCode(baseMessage);
        JSONObject jsonObject=new JSONObject();
        int  code =0;
        String errcode=null;
        if (baseMessage1==null){

            baseMessage.setMsgType("text");
            baseMessage.setTitle(text.getTitle());
            baseMessage.setCreateTime(new Date().getTime());
            int baseMessageID=addBaseMessage(baseMessage);
            if (baseMessageID>0){
                text.setBaseID(baseMessageID);
                code =textMessageService.addTextMessage(text);
                if (code>0){
                    errcode="0";
                }else{
                    baseMessage.setId(baseMessageID);
                    deleteBaseMessage(baseMessage);
                    errcode="添加失败，请刷新页面重试！";
                }
            }else{
                errcode="添加失败，请刷新页面重试！";
            }

        }else{
            errcode="关键词已经存在，请重新输入！";
        }
        return errcode;
    }
    /*
     * 获取文本消息
     * */

    @RequestMapping(value = "/getTextMessage", method = RequestMethod.POST)
    @ResponseBody
    public Object getTextMessage(@RequestParam("baseMessageID") int baseMessageID) {

        BaseMessage baseMessage=baseMessageService.getByBaseID(baseMessageID);
        TextMessage textMessage =textMessageService.selectTextMessageByBaseMessageID(baseMessageID);
        textMessage.setInputCode(baseMessage.getInputCode());
        return textMessage;

    }

    /*
     * 修改文本消息
     * */
    @RequestMapping(value = "/editTextMessage", method = RequestMethod.POST)
    @ResponseBody
    public String editTextMessage(@RequestBody TextMessage text,@RequestParam("baseID") int baseID, HttpSession session) {

        boolean flag=false;
        String accountName= (String) session.getAttribute("accountName");
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setInputCode(text.getInputCode());
        baseMessage.setAccountName(accountName);
        BaseMessage baseMessage1=new BaseMessage();
        baseMessage1=baseMessageService.getByInputCode(baseMessage);
        JSONObject jsonObject=new JSONObject();
        String errcode=null;
        if (baseMessage1==null||baseMessage1.getId()==baseID){
        baseMessage.setId(baseID);
        baseMessage.setTitle(text.getTitle());
        baseMessage.setCreateTime(new Date().getTime());
        flag=editBaseMessage(baseMessage);
            if (flag){
                text.setBaseID(baseID);
                textMessageService.updateTextMessage(text);
                errcode="0";
            }else{
                errcode="修改失败，请刷新页面重试！";
            }
        }else{
            errcode="关键词已经存在，请重新输入！";
        }
        return errcode;
    }

    /*
     * 添加图片消息
     * */

    @RequestMapping(value = "/addImageMessage", method = RequestMethod.POST)
    @ResponseBody
    public String addImageMessage(@RequestParam("title") String title,@RequestParam("imageID") int imageID,@RequestParam("inputCode") String inputCode, HttpSession session) {
        String accountName= (String) session.getAttribute("accountName");
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setAccountName(accountName);
        baseMessage.setInputCode(inputCode);
        BaseMessage baseMessage1=new BaseMessage();
        baseMessage1=baseMessageService.getByInputCode(baseMessage);
        JSONObject jsonObject=new JSONObject();
        String errcode=null;
        if (baseMessage1==null){
            baseMessage.setMsgType("image");
            baseMessage.setTitle(title);
            baseMessage.setCreateTime(new Date().getTime());
            int baseID=addBaseMessage(baseMessage);
            if(baseID>0){
                int  code =0;
                ImagesMessage imagesMessage=new ImagesMessage();
                imagesMessage.setBaseId(baseID);
                imagesMessage.setImageId(imageID);
                code=imagesMessageService.addImageMessage(imagesMessage);
                if (code>0){
                    errcode="0";
                }else{
                    baseMessage.setId(baseID);
                    deleteBaseMessage(baseMessage);
                    errcode="添加失败，请刷新页面重试！";
                }
            }else{
                errcode="添加失败，请刷新页面重试！";
            }
        }else{
            errcode="关键词已经存在，请重新输入！";
        }
        return errcode;
    }
    /*
     * 获取图片消息
     * */

    @RequestMapping(value = "/getImageMessage", method = RequestMethod.POST)
    @ResponseBody
    public Object getImageMessage(@RequestParam("baseMessageID") int baseMessageID) {

        BaseMessage baseMessage=baseMessageService.getByBaseID(baseMessageID);
        ImagesMessage imagesMessage =imagesMessageService.selectImageMessage(baseMessageID);
        imagesMessage.setTitle(baseMessage.getTitle());
        imagesMessage.setInputCode(baseMessage.getInputCode());
        return imagesMessage;
    }

    /*
     * 修改图片消息
     * */
    @RequestMapping(value = "/editImageMessage", method = RequestMethod.POST)
    @ResponseBody
    public String editImageMessage(@RequestParam("title") String title,@RequestParam("imageID") int imageID,@RequestParam("inputCode") String inputCode,@RequestParam("baseID") int baseID, HttpSession session) {

        String accountName= (String) session.getAttribute("accountName");
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setAccountName(accountName);
        baseMessage.setInputCode(inputCode);
        BaseMessage baseMessage1=new BaseMessage();
        baseMessage1=baseMessageService.getByInputCode(baseMessage);
        JSONObject jsonObject=new JSONObject();
        String errcode="error";
        boolean flag=false;
        if (baseMessage1==null||baseMessage1.getId()==baseID){
            baseMessage.setTitle(title);
            baseMessage.setMsgType("image");
            baseMessage.setCreateTime(new Date().getTime());
            baseMessage.setId(baseID);
            flag=editBaseMessage(baseMessage);
            ImagesMessage imagesMessage=new ImagesMessage();
            imagesMessage.setBaseId(baseID);
            imagesMessage.setImageId(imageID);
            flag=imagesMessageService.editImageMessage(imagesMessage);
            if (flag){
                errcode="0";
            }else{
                errcode="修改失败，请刷新页面重试！";
            }
        }else{
            errcode="关键词已经存在，请重新修改！";
        }
        return errcode;

    }

    /*
     * 添加图文消息
     * */

    @RequestMapping(value = "/addNewsMessage", method = RequestMethod.POST)
    @ResponseBody
    public String addNewsMessage(@RequestParam("title") String title,@RequestParam("newsID") int newsID,@RequestParam("inputCode") String inputCode, HttpSession session) {
        String accountName= (String) session.getAttribute("accountName");
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setAccountName(accountName);
        baseMessage.setInputCode(inputCode);
        BaseMessage baseMessage1=new BaseMessage();
        baseMessage1=baseMessageService.getByInputCode(baseMessage);
        JSONObject jsonObject=new JSONObject();
        String errcode=null;
        if (baseMessage1==null){
            baseMessage.setMsgType("news");
            baseMessage.setTitle(title);
            baseMessage.setCreateTime(new Date().getTime());
            int baseID=addBaseMessage(baseMessage);
            if(baseID>0){
                int  code =0;
                NewsMessage newsMessage=new NewsMessage();
                newsMessage.setBaseId(baseID);
                newsMessage.setNewsId(newsID);
                code=newsMessageService.addNewsMessage(newsMessage);
                if (code>0){
                    errcode="0";
                }else{
                    baseMessage.setId(baseID);
                    deleteBaseMessage(baseMessage);
                    errcode="添加失败，请刷新页面重试！";
                }
            }else{
                errcode="添加失败，请刷新页面重试！";
            }
        }else{
            errcode="关键词已经存在，请重新输入！";
        }
        return errcode;
    }
    /*
     * 获取图文消息
     * */

    @RequestMapping(value = "/getNewsMessage", method = RequestMethod.POST)
    @ResponseBody
    public Object getNewsMessage(@RequestParam("baseMessageID") int baseMessageID) {

        BaseMessage baseMessage=baseMessageService.getByBaseID(baseMessageID);
        NewsMessage newsMessage =newsMessageService.selectNewsMessage(baseMessageID);
        newsMessage.setTitle(baseMessage.getTitle());
        newsMessage.setInputCode(baseMessage.getInputCode());
        News news=newsService.selectNewsByNewsID(newsMessage.getNewsId());
        newsMessage.setNews(news);
        return newsMessage;
    }

    /*
     * 修改图文消息
     * */
    @RequestMapping(value = "/editNewsMessage", method = RequestMethod.POST)
    @ResponseBody
    public String editNewsMessage(@RequestParam("title") String title,@RequestParam("newsID") int newsID,@RequestParam("inputCode") String inputCode,@RequestParam("baseID") int baseID, HttpSession session) {

        String accountName= (String) session.getAttribute("accountName");
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setAccountName(accountName);
        baseMessage.setInputCode(inputCode);
        BaseMessage baseMessage1=new BaseMessage();
        baseMessage1=baseMessageService.getByInputCode(baseMessage);
        JSONObject jsonObject=new JSONObject();
        String errcode="error";
        boolean flag=false;
        if (baseMessage1==null||baseMessage1.getId()==baseID){
            baseMessage.setTitle(title);
            baseMessage.setMsgType("news");
            baseMessage.setCreateTime(new Date().getTime());
            baseMessage.setId(baseID);
            flag=editBaseMessage(baseMessage);
            NewsMessage newsMessage=new NewsMessage();
            newsMessage.setBaseId(baseID);
            newsMessage.setNewsId(newsID);
            flag=newsMessageService.editNewsMessage(newsMessage);
            if (flag){
                errcode="0";
            }else{
                errcode="修改失败，请刷新页面重试！";
            }
        }else{
            errcode="关键词已经存在，请重新修改！";
        }
        return errcode;

    }

    /*
     * 添加视频消息
     * */

    @RequestMapping(value = "/addVideoMessage", method = RequestMethod.POST)
    @ResponseBody
    public String addVideoMessage(@RequestParam("title") String title,@RequestParam("videoID") int videoID,@RequestParam("inputCode") String inputCode, HttpSession session) {
        String accountName= (String) session.getAttribute("accountName");
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setAccountName(accountName);
        baseMessage.setInputCode(inputCode);
        BaseMessage baseMessage1=new BaseMessage();
        baseMessage1=baseMessageService.getByInputCode(baseMessage);
        JSONObject jsonObject=new JSONObject();
        String errcode=null;
        if (baseMessage1==null){
            baseMessage.setMsgType("video");
            baseMessage.setTitle(title);
            baseMessage.setCreateTime(new Date().getTime());
            int baseID=addBaseMessage(baseMessage);
            if(baseID>0){
                int  code =0;
                VideoMessage videoMessage=new VideoMessage();
                videoMessage.setBaseID(baseID);
                videoMessage.setVideoID(videoID);
                code=videoMessageService.addVideoMessage(videoMessage);
                if (code>0){
                    errcode="0";
                }else{
                    baseMessage.setId(baseID);
                    deleteBaseMessage(baseMessage);
                    errcode="添加失败，请刷新页面重试！";
                }
            }else{
                errcode="添加失败，请刷新页面重试！";
            }
        }else{
            errcode="关键词已经存在，请重新输入！";
        }
        return errcode;
    }
    /*
     * 获取视频消息
     * */

    @RequestMapping(value = "/getVideoMessage", method = RequestMethod.POST)
    @ResponseBody
    public Object getVideoMessage(@RequestParam("baseMessageID") int baseMessageID) {

        BaseMessage baseMessage=baseMessageService.getByBaseID(baseMessageID);
        VideoMessage videoMessage =videoMessageService.selectVideoMessage(baseMessageID);
        videoMessage.setTitle(baseMessage.getTitle());
        videoMessage.setInputCode(baseMessage.getInputCode());
//        Video video=videoService.selectVideoByVideoID(videoMessage.getVideoId());
//        videoMessage.setVideo(video);
        return videoMessage;
    }

    /*
     * 修改视频消息
     * */
    @RequestMapping(value = "/editVideoMessage", method = RequestMethod.POST)
    @ResponseBody
    public String editVideoMessage(@RequestParam("title") String title,@RequestParam("videoID") int videoID,@RequestParam("inputCode") String inputCode,@RequestParam("baseID") int baseID, HttpSession session) {

        String accountName= (String) session.getAttribute("accountName");
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setAccountName(accountName);
        baseMessage.setInputCode(inputCode);
        BaseMessage baseMessage1=new BaseMessage();
        baseMessage1=baseMessageService.getByInputCode(baseMessage);
        JSONObject jsonObject=new JSONObject();
        String errcode="error";
        boolean flag=false;
        if (baseMessage1==null||baseMessage1.getId()==baseID){
            baseMessage.setTitle(title);
            baseMessage.setMsgType("video");
            baseMessage.setCreateTime(new Date().getTime());
            baseMessage.setId(baseID);
            flag=editBaseMessage(baseMessage);
            VideoMessage videoMessage=new VideoMessage();
            videoMessage.setBaseID(baseID);
            videoMessage.setVideoID(videoID);
            flag=videoMessageService.editVideoMessage(videoMessage);
            if (flag){
                errcode="0";
            }else{
                errcode="修改失败，请刷新页面重试！";
            }
        }else{
            errcode="关键词已经存在，请重新修改！";
        }
        return errcode;

    }
    /*
     * 添加语音消息
     * */

    @RequestMapping(value = "/addVoiceMessage", method = RequestMethod.POST)
    @ResponseBody
    public String addVoiceMessage(@RequestParam("title") String title,@RequestParam("voiceID") int voiceID,@RequestParam("inputCode") String inputCode, HttpSession session) {
        String accountName= (String) session.getAttribute("accountName");
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setAccountName(accountName);
        baseMessage.setInputCode(inputCode);
        BaseMessage baseMessage1=new BaseMessage();
        baseMessage1=baseMessageService.getByInputCode(baseMessage);
        JSONObject jsonObject=new JSONObject();
        String errcode=null;
        if (baseMessage1==null){
            baseMessage.setMsgType("voice");
            baseMessage.setTitle(title);
            baseMessage.setCreateTime(new Date().getTime());
            int baseID=addBaseMessage(baseMessage);
            if(baseID>0){
                int  code =0;
                VoiceMessage voiceMessage=new VoiceMessage();
                voiceMessage.setBaseID(baseID);
                voiceMessage.setVoiceID(voiceID);
                code=voiceMessageService.addVoiceMessage(voiceMessage);
                if (code>0){
                    errcode="0";
                }else{
                    baseMessage.setId(baseID);
                    deleteBaseMessage(baseMessage);
                    errcode="添加失败，请刷新页面重试！";
                }
            }else{
                errcode="添加失败，请刷新页面重试！";
            }
        }else{
            errcode="关键词已经存在，请重新输入！";
        }
        return errcode;
    }
    /*
     * 获取语音消息
     * */

    @RequestMapping(value = "/getVoiceMessage", method = RequestMethod.POST)
    @ResponseBody
    public Object getVoiceMessage(@RequestParam("baseMessageID") int baseMessageID) {

        BaseMessage baseMessage=baseMessageService.getByBaseID(baseMessageID);
        VoiceMessage voiceMessage =voiceMessageService.selectVoiceMessageByBaseId(baseMessageID);
        voiceMessage.setTitle(baseMessage.getTitle());
        voiceMessage.setInputCode(baseMessage.getInputCode());
//        Voice voice=voiceService.selectVoiceByVoiceID(voiceMessage.getVoiceId());
//        voiceMessage.setVoice(voice);
        return voiceMessage;
    }

    /*
     * 修改语音消息
     * */
    @RequestMapping(value = "/editVoiceMessage", method = RequestMethod.POST)
    @ResponseBody
    public String editVoiceMessage(@RequestParam("title") String title,@RequestParam("voiceID") int voiceID,@RequestParam("inputCode") String inputCode,@RequestParam("baseID") int baseID, HttpSession session) {

        String accountName= (String) session.getAttribute("accountName");
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setAccountName(accountName);
        baseMessage.setInputCode(inputCode);
        BaseMessage baseMessage1=new BaseMessage();
        baseMessage1=baseMessageService.getByInputCode(baseMessage);
        JSONObject jsonObject=new JSONObject();
        String errcode="error";
        boolean flag=false;
        if (baseMessage1==null||baseMessage1.getId()==baseID){
            baseMessage.setTitle(title);
            baseMessage.setMsgType("voice");
            baseMessage.setCreateTime(new Date().getTime());
            baseMessage.setId(baseID);
            flag=editBaseMessage(baseMessage);
            VoiceMessage voiceMessage=new VoiceMessage();
            voiceMessage.setBaseID(baseID);
            voiceMessage.setVoiceID(voiceID);
            flag=voiceMessageService.editVoiceMessage(voiceMessage);
            if (flag){
                errcode="0";
            }else{
                errcode="修改失败，请刷新页面重试！";
            }
        }else{
            errcode="关键词已经存在，请重新修改！";
        }
        System.out.print(errcode);
        return errcode;

    }
/*
* 群发消息*/

    @RequestMapping(value = "/sendMessage")
    @ResponseBody
    public LayuiResult sendMessage(@RequestBody String[] openids, @RequestParam("messageId") int messageId,@RequestParam("messageType") String messageType, HttpSession session) throws Exception {
        String accountName= (String) session.getAttribute("accountName");
        Account account=new Account();
        account.setName(accountName);
        account=accountService.selectAccount(accountName);
        String errorcode="error";
        AccessToken accessToken=WeixinUtil.getAccessToken(account.getAppid(),account.getAppsecret());
        String token=accessToken.getAccess_token();
        List<Fans> fansList=new ArrayList<>();
//        fansList=fansService.allFnas(accountName);
        fansList=fansService.allFnas(accountName);
        String[] openIds=new String[fansList.size()];
        if (openids.length<=1){

            for (int i=0;i<fansList.size();i++){
                openIds[i]=fansList.get(i).getOpenId();
            }
        }
        switch (messageType){
            case "text":{

                TextMessage textMessage=new TextMessage();
                textMessage=textMessageService.selectTextMessageByBaseMessageID(messageId);
                if (openids.length<=1){
                    System.out.print("到此一游");
                    errorcode=WeixinUtil.sendTextMessageByOpenID(token,openIds,textMessage.getContent());
                }else {
                    errorcode=WeixinUtil.sendTextMessageByOpenID(token,openids,textMessage.getContent());
                }
                break;
            }
            case "image":{
                ImagesMessage imagesMessage=new ImagesMessage();
                imagesMessage=imagesMessageService.selectImageMessage(messageId);
                errorcode=WeixinUtil.sendImageMessageByOpenID(token,openids,imagesMessage.getImage().getMediaId());
                break;
            }
            case "news":{
                NewsMessage newsMessage=newsMessageService.selectNewsMessage(messageId);
                News news=newsService.selectNewsByNewsID(newsMessage.getNewsId());

                errorcode=WeixinUtil.sendNewsMessageByOpenID(token,openids,news);
                break;
            }
            case "voice":{
                VoiceMessage voiceMessage=voiceMessageService.selectVoiceMessageByBaseId(messageId);

                errorcode=WeixinUtil.sendVoiceMessageByOpenID(token,openids,voiceMessage.getVoice().getMediaId());
                break;
            }
            case "video":{
                VideoMessage videoMessage=videoMessageService.selectVideoMessage(messageId);

                errorcode=WeixinUtil.sendVideoMessageByOpenID(token,openids,videoMessage.getVideo());
                break;
            }
            default:{
                errorcode="群发失败，请刷新页面重试！";
            }
        }

        LayuiResult result = new LayuiResult();
        if ("0".equals(errorcode)) {
            result.setMsg("群发成功，微信端接收还需一点时间！");
        } else {
            result.setMsg("错误码："+errorcode);
        }
        return result;
    }





    /*
    * 显示文本消息
    * */
    @RequestMapping(value = "/list")
    public String list() {
        return "showMessage";
    }

    @RequestMapping(value = "/textData")
    @ResponseBody
    public LayuiResult<TextMessage> listData(String keyword, Integer page, Integer limit,HttpSession session) {
        LayuiResult<TextMessage> result = new LayuiResult<TextMessage>();
        TextMessage text = new TextMessage();
        List<TextMessage> list =new ArrayList<>();
        BaseMessage baseMessage=new BaseMessage();
        String accountName= (String) session.getAttribute("accountName");
        if (keyword==null||keyword.length()==0){
            list = textMessageService.allTextMessage(accountName);
        }else{
            baseMessage.setInputCode(keyword);
            baseMessage.setAccountName(accountName);
            list =textMessageService.search(baseMessage);
        }
        List<TextMessage> list1 = new ArrayList<TextMessage>();
        if (list.size() <= limit) {
            for (int i = 0; i < list.size(); i++) {
                list1.add(list.get(i));
            }
        } else if (list.size() > limit) {
            if (page <= (list.size() / limit)) {
                for (int i = (page - 1) * limit; i < page * limit; i++) {
                    list1.add(list.get(i));
                }
            } else if (page > (list.size() / limit)) {
                for (int i = (page - 1) * limit; i < (((page - 1) * limit) + list.size() % limit); i++) {
                    list1.add(list.get(i));
                }
            }
        }
        result.setData(list1);
        result.setCount(list.size());//显示共有多少条数据
        return result;
    }

    /*
     * 添加文本消息
     * */
    @RequestMapping(value = "/addtext")
    public String add() {
        return "addtext";
    }

    @RequestMapping(value = "/addtextlist", method = RequestMethod.POST)
    @ResponseBody
    public LayuiResult addpost(@RequestBody TextMessage text, HttpSession session) {
        LayuiResult result = new LayuiResult();
        String accountName= (String) session.getAttribute("accountName");
        text.setAccountName(accountName);
        boolean flag=false;
//        flag=textMessageService.addTextMessage(text);
        if (flag) {
            result.setMsg("添加成功");
        } else {
            result.setMsg("添加失败");
        }
        return result;
    }

    /*
    * 删除文本消息
    * */
    @RequestMapping(value = "/deleteTextMessage", method = RequestMethod.POST)
    @ResponseBody
    public boolean delete(@RequestBody TextMessage text) {
        int code =0;
        boolean flag=false;
        flag=textMessageService.deleteTextMessage(text);
        return flag;
    }

    /*
     * 修改文本消息
     * */
    @RequestMapping(value = "/editteMessage", method = RequestMethod.POST)
    @ResponseBody
    public boolean eidt(TextMessage text) {
        System.out.println(text.getBaseID());
        boolean flag=false;
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setId(text.getBaseID());
        baseMessage.setInputCode(text.getInputCode());
        baseMessage.setTitle(text.getTitle());
        flag=editBaseMessage(baseMessage);
        if (flag){
            flag=textMessageService.updateTextMessage(text);
        }
        return flag;
    }
    /*
    * 群发
    * */
    @RequestMapping(value = "/sendTextMsg")
    public String send() {
        return "selectFans";
    }
    /*
    * 发送的文本消息的内容
    * */
    @RequestMapping(value = "/TextMsg")
    @ResponseBody
    public String send(@RequestBody TextMessage text,Model model) {
        model.addAttribute("textMsg",text);
        return "success";
    }
    @RequestMapping(value = "/sendALL")
    @ResponseBody
    public LayuiResult sendall(@RequestBody String[] openids,HttpSession session) throws Exception {
        String accountName= (String) session.getAttribute("accountName");
        Account account=new Account();
        account.setName(accountName);
        account=accountService.selectAccount(accountName);
        TextMessage textMsg= (TextMessage) session.getAttribute("textMsg");
        System.out.println(textMsg.toString());
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setId(textMsg.getBaseID());
        System.out.println(baseMessage.toString());
        textMsg=textMessageService.selectTextMessage(baseMessage);
//        textMsg.setContent("天天天天天天天天天天天天天天天");
        System.out.println(textMsg.toString());
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
        System.out.println("群发的文本消息"+data);
        String errorcode=WeixinUtil.sendByOpenID(token,data);

        LayuiResult result = new LayuiResult();
        if ("0".equals(errorcode)) {
            result.setMsg("群发成功，微信端接收还需一点时间！");
        } else {
            result.setMsg("错误码："+errorcode);
        }
        return result;
    }
}
