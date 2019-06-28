package com.wechat.dao;

import com.wechat.entity.BaseMessage;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("baseMessageDAO")
public interface BaseMessageDAO {
    public BaseMessage selectBaseMessage(BaseMessage baseMessage);
    public BaseMessage getByInputCode(BaseMessage baseMessage);
    public BaseMessage getByBaseID(int baseID);
    public List<BaseMessage> getByMsgType(BaseMessage baseMessage);
    public List<BaseMessage> selectAllBaseMessage(String accountName);
    public int addBaseMessage(BaseMessage baseMessage);
    public List<BaseMessage> search(BaseMessage baseMessage);
    public int deleteBaseMessage(BaseMessage baseMessage);
    public int updateBaseMessage(BaseMessage baseMessage);
}
