package com.wechat.entity;

import java.util.List;

public class NewsMessage extends BaseMessage{
    /*
    * 图文消息实体类
    * */
    private int id;
    private int newsId;
    private News news;
    private int baseId;

    @Override
    public int getId() {
        return id;
    }

    @Override
    public void setId(int id) {
        this.id = id;
    }


    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }

    public int getBaseId() {
        return baseId;
    }

    public void setBaseId(int baseId) {
        this.baseId = baseId;
    }
}
