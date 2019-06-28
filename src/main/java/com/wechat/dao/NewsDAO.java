package com.wechat.dao;

import com.wechat.entity.BaseMessage;
import com.wechat.entity.News;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("newsDAO")
public interface NewsDAO {
    public List<News> selectAllNews(String accountName);
    public News selectNewsByNewsID(int newsId);
    public int addNews(News news);
    public int editNews(News news);
    public int deleteNews(News news);
    public int editNewsContentSourceUrl(News news);
}
