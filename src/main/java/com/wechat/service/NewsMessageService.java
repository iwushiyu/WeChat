package com.wechat.service;

import com.wechat.entity.BaseMessage;
import com.wechat.entity.News;
import com.wechat.entity.NewsMessage;
import org.springframework.stereotype.Service;

import java.util.List;

public interface NewsMessageService {
    public NewsMessage selectNewsMessage(int baseMessageID);
    public boolean deleteNewsMessage(BaseMessage baseMessage);
    public int addNewsMessage(NewsMessage newsMessage);
    public boolean editNewsMessage(NewsMessage newsMessage);
}
