package com.wechat.service.Impl;

import com.wechat.dao.NewsMessageDAO;
import com.wechat.entity.BaseMessage;
import com.wechat.entity.NewsMessage;
import com.wechat.service.NewsMessageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("newsMessageService")
public class NewsMessageServiceImpl implements NewsMessageService {
    @Resource(name = "newsMessageDAO")
    private NewsMessageDAO newsMessageDAO;

    @Override
    public NewsMessage selectNewsMessage(int baseMessageID) {
        return newsMessageDAO.selectNewsMessage(baseMessageID);
    }

    @Override
    public boolean deleteNewsMessage(BaseMessage baseMessage) {
        int code=newsMessageDAO.deleteNewsMessage(baseMessage);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }

    @Override
    public int addNewsMessage(NewsMessage newsMessage) {
        int code=0;
        try {
            newsMessageDAO.addNewsMessage(newsMessage);
            code=newsMessage.getId();
        }catch (Exception e){
            code=-1;
        }finally {
        }
        return  code;
    }

    @Override
    public boolean editNewsMessage(NewsMessage newsMessage) {
        int code=newsMessageDAO.editNewsMessage(newsMessage);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }
}
