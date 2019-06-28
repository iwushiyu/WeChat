package com.wechat.service;

import com.wechat.entity.BaseMessage;
import com.wechat.entity.TextMessage;
import org.springframework.stereotype.Service;

import java.util.List;

public interface TextMessageService {
    public int addTextMessage(TextMessage textMessage);
    public TextMessage selectTextMessage(BaseMessage baseMessage);
    public List<TextMessage> allTextMessage(String accountName);
    public TextMessage selectTextMessageByBaseMessageID(int baseMessageID);
    public List<TextMessage> search(BaseMessage baseMessage);
    public boolean deleteTextMessage(BaseMessage baseMessage);
    public boolean updateTextMessage(TextMessage textMessage);
}
