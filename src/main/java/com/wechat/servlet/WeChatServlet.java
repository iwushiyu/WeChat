package com.wechat.servlet;

import com.wechat.entity.ImagesMessage;
import com.wechat.entity.TextMessage;
import com.wechat.util.CheckUtil;
import com.wechat.util.MessageUtil;
import org.dom4j.Document;
import org.dom4j.DocumentException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


public class WeChatServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String signature = request.getParameter("signature");
        String timestamp = request.getParameter("timestamp");
        String nonce = request.getParameter("nonce");
        String echostr = request.getParameter("echostr");
        PrintWriter out = response.getWriter();
        String token="wechat";
        if(CheckUtil.checkSignature(signature, timestamp, nonce,token)){
//如果校验成功，将得到的随机字符串原路返回
            out.print(echostr);
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Map<String, String> map = MessageUtil.xmlToMap(request);
            String toUserName = map.get("ToUserName");
            String fromUserName = map.get("FromUserName");
            String msgType = map.get("MsgType");
            String content = map.get("Content");
            String message = null;
            if (MessageUtil.MESSAGE_TEXT.equals(msgType)) {
                //接受文本信息
                if ("1".equals(content)) {
                    message=MessageUtil.textMessageToXmlString(toUserName,fromUserName,MessageUtil.firstMenu());
                } else if ("2".equals(content)) {
//                    message=MessageUtil.initNewsMessage(toUserName,fromUserName);
//                } else if ("3".equals(content)) {
//                    message=MessageUtil.initimagesMessage(toUserName,fromUserName);
//                }else if ("4".equals(content)) {
//                    message=MessageUtil.initMusicMessage(toUserName,fromUserName);
//                }else if ("5".equals(content)) {
//                    message=MessageUtil.initVoiceMessage(toUserName,fromUserName);
                }else if("?".equals(content)||"？".equals(content)){
                    message=MessageUtil.textMessageToXmlString(toUserName,fromUserName,MessageUtil.menuText());
                }
//                TextMessage text = new TextMessage();
//                text.setFromUserName(toUserName);
//                text.setToUserName(fromUserName);0

//                text.setMsgType("text");
//                text.setCreateTime(new Date().getTime());
//                text.setContent("您发送的消息是：" + content);
//                message = MessageUtil.textMessageToXml(text);
            } else if (MessageUtil.MESSAGE_image.equals(msgType)){
                //接收图片信息
//                imagesMessage imagesMessage=new imagesMessage();
//                imagesMessage.setFromUserName(toUserName);
//                imagesMessage.setToUserName(fromUserName);
//                imagesMessage.setMsgType("images");
//                imagesMessage.setCreateTime(new Date().getTime());
//                imagesMessage.setMsgType(MessageUtil.MESSAGE_image);
//                imagesMessage.setCreateTime(new Date().getTime());
//                imagesMessage.setPicUrl("http://ac0248dc.ngrok.io/images/first.jpg");
//                imagesMessage.setMediaId(map.get("mediaId"));
//                message=MessageUtil.imageMessageToXml(imagesMessage);
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
                message=MessageUtil.textMessageToXmlString(toUserName,fromUserName,"您发送的消息是：视频消息");
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
                    message = MessageUtil.textMessageToXmlString(toUserName, fromUserName, MessageUtil.menuText());
                }else if(MessageUtil.MESSAGE_CLICK.equals(eventType)){
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
            out.print(message);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            out.close();
        }
    }
}

