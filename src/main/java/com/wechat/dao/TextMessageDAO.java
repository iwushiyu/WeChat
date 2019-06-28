package com.wechat.dao;

import com.wechat.entity.BaseMessage;
import com.wechat.entity.TextMessage;
import org.springframework.stereotype.Repository;

@Repository("textMessageDAO")
public interface TextMessageDAO {
    public int addTextMessage(TextMessage textMessage);
    public TextMessage selectTextMessage(BaseMessage baseMessage);
    public TextMessage selectTextMessageByBaseMessageID(int baseMessageID);
    public int deleteTextMessage(BaseMessage baseMessage);
    public int updateTextMessage(TextMessage textMessage);
}
