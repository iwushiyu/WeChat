package com.wechat.service;

import com.wechat.entity.BaseMessage;
import org.springframework.stereotype.Service;

import java.util.List;

public interface BaseMessageService {
// 获取所有消息
    public List<BaseMessage> selectAllBaseMessage(String accountName);
//    通过关键字查询
    public BaseMessage getByInputCode(BaseMessage baseMessage);
//通过ID查询
    public BaseMessage getByBaseID(int baseID);
//    通过需要返回的消息的类型查询
    public List<BaseMessage> getByMsgType(BaseMessage baseMessage);

//    添加
    public int addBaseMessage(BaseMessage baseMessage);
    //    获取所有文本消息
    public List<BaseMessage> getAllTextMessage(BaseMessage baseMessage);

//    通过对象查询
    public BaseMessage selectBaseMessage(BaseMessage baseMessage);

//    实现模糊查找
    public List<BaseMessage> search(BaseMessage baseMessage);

    public boolean deleteBaseMessage(BaseMessage baseMessage);
    public boolean updateBaseMessage(BaseMessage baseMessage);
}
