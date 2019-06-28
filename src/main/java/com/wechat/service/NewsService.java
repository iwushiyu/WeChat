package com.wechat.service;

import com.wechat.entity.BaseMessage;
import com.wechat.entity.News;

import java.util.List;

public interface NewsService {
    public List<News> selectAllNews(String accountName);
    public News selectNewsByNewsID(int newsId);
    public int addNews(News news);
    public boolean deleteNews(News news);
    public boolean editNews(News news);
    public boolean editNewsContentSourceUrl(News news);
}
