package com.wechat.service.Impl;

import com.wechat.dao.TextMessageDAO;
import com.wechat.entity.BaseMessage;
import com.wechat.entity.TextMessage;
import com.wechat.service.TextMessageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("textMessageService")
public class TextMessageServiceImpl implements TextMessageService {
    @Resource(name = "textMessageDAO")
    private TextMessageDAO textMessageDAO;
    @Resource(name = "baseMessageService")
    private BaseMessageServiceImpl baseMessageService;

    /*
    * 添加text消息*/
    @Override
    public int addTextMessage(TextMessage textMessage) {
        int code=0;
        try {
            textMessageDAO.addTextMessage(textMessage);
            code=textMessage.getId();
        }catch (Exception e){
            code=-1;
        }finally {
        }
        return  code;
    }
/*
* 查询某个特定的消息*/
    @Override
    public TextMessage selectTextMessage(BaseMessage baseMessage) {
        TextMessage textMessage=new TextMessage();
        textMessage=textMessageDAO.selectTextMessage(baseMessage);
        textMessage.setInputCode(baseMessage.getInputCode());
        return textMessage;
    }
    /*
     * 通过baseMessageID获取文本消息*/
    @Override
    public TextMessage selectTextMessageByBaseMessageID(int baseMessageID) {
        TextMessage textMessage=new TextMessage();
        textMessage=textMessageDAO.selectTextMessageByBaseMessageID(baseMessageID);
        return textMessage;
    }
  /*
  * 查询所有*/
    @Override
    public List<TextMessage> allTextMessage(String accountName) {
        List<BaseMessage> baseMessageList=new ArrayList<>();
        List<TextMessage> textMessageList=new ArrayList<>();
        TextMessage textMessage;
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setAccountName(accountName);
        baseMessage.setMsgType("text");
        baseMessageList=baseMessageService.getByMsgType(baseMessage);
        for(BaseMessage b:baseMessageList){
            textMessage= textMessageDAO.selectTextMessage(b);
            textMessage.setInputCode(b.getInputCode());
            textMessage.setCreateTime(b.getCreateTime());
            textMessageList.add(textMessage);
        }
        return textMessageList;
    }
/*
* 模糊查找
* */
    @Override
    public List<TextMessage> search(BaseMessage baseMessage) {
        List<BaseMessage> baseMessageList=new ArrayList<>();
        List<TextMessage> textMessageList=new ArrayList<>();
        TextMessage textMessage;
        baseMessageList=baseMessageService.search(baseMessage);
        for(BaseMessage b:baseMessageList){
            textMessage= textMessageDAO.selectTextMessage(b);
            textMessage.setInputCode(b.getInputCode());
            textMessage.setCreateTime(b.getCreateTime());
            textMessageList.add(textMessage);
        }
        return textMessageList;
    }

    @Override
    public boolean deleteTextMessage(BaseMessage baseMessage) {

       int code=textMessageDAO.deleteTextMessage(baseMessage);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }

    @Override
    public boolean updateTextMessage(TextMessage textMessage) {
        int code=textMessageDAO.updateTextMessage(textMessage);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }
}
