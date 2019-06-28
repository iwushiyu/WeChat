package com.wechat.service.Impl;

import com.wechat.dao.BaseMessageDAO;
import com.wechat.entity.BaseMessage;
import com.wechat.service.BaseMessageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("baseMessageService")
public class BaseMessageServiceImpl implements BaseMessageService {
    @Resource(name = "baseMessageDAO")
    private BaseMessageDAO baseMessageDAO;

    @Override
    public List<BaseMessage> selectAllBaseMessage(String accountName) {
        return baseMessageDAO.selectAllBaseMessage(accountName);
    }

    @Override
    public BaseMessage getByInputCode(BaseMessage baseMessage) {
        return baseMessageDAO.getByInputCode(baseMessage);
    }

    @Override
    public BaseMessage getByBaseID(int baseID) {
        return baseMessageDAO.getByBaseID(baseID);
    }

    @Override
    public List<BaseMessage> getByMsgType(BaseMessage baseMessage) {
        return baseMessageDAO.getByMsgType(baseMessage);
    }

    @Override
    public int addBaseMessage(BaseMessage baseMessage) {


        int code=0;
        try {
            baseMessageDAO.addBaseMessage(baseMessage);
            code=baseMessage.getId();
        }catch (Exception e){
            code=-1;
        }finally {

        }
        return  code;
    }

    @Override
    public BaseMessage selectBaseMessage(BaseMessage baseMessage) {
        return baseMessageDAO.selectBaseMessage(baseMessage);
    }
    @Override
    public List<BaseMessage> getAllTextMessage(BaseMessage baseMessage) {
        return baseMessageDAO.getByMsgType(baseMessage);
    }
    @Override
    public List<BaseMessage> search(BaseMessage baseMessage) {
        return baseMessageDAO.search(baseMessage);
    }

    @Override
    public boolean deleteBaseMessage(BaseMessage baseMessage) {
       int code= baseMessageDAO.deleteBaseMessage(baseMessage);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }

    @Override
    public boolean updateBaseMessage(BaseMessage baseMessage) {
        int code=baseMessageDAO.updateBaseMessage(baseMessage);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }
}
