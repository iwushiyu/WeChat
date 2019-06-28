package com.wechat.dao;

import com.wechat.entity.BaseMessage;
import com.wechat.entity.News;
import com.wechat.entity.NewsMessage;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("newsMessageDAO")
public interface NewsMessageDAO {
    public NewsMessage selectNewsMessage(int baseMessageID);
    public int deleteNewsMessage(BaseMessage baseMessage);
    public int addNewsMessage(NewsMessage newsMessage);
    public int editNewsMessage(NewsMessage newsMessage);
}
