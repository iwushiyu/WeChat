package com.wechat.service.Impl;

import com.wechat.dao.ImagesDAO;
import com.wechat.dao.NewsDAO;
import com.wechat.entity.BaseMessage;
import com.wechat.entity.Image;
import com.wechat.entity.News;
import com.wechat.entity.Thumb;
import com.wechat.service.ImagesService;
import com.wechat.service.NewsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("newsService")
public class NewsServiceImpl implements NewsService {
    @Resource(name = "newsDAO")
    private NewsDAO newsDAO;
/*
* 获取图文素材*/
    @Override
    public List<News> selectAllNews(String accountName) {
        List<News> newsList=new ArrayList<>();
        newsList=newsDAO.selectAllNews(accountName);
        for (News news:newsList
             ) {
            if (news.getThumb().getMediaId()==null){
                Thumb thumb=new Thumb();
                thumb.setId(news.getThumbId());
                thumb.setThumbURL("error");
                news.setThumb(thumb);
            }
        }
        System.out.println(newsList);
        return newsList;
    }

    @Override
    public News selectNewsByNewsID(int newsId) {
        News news=new News();
        news=newsDAO.selectNewsByNewsID(newsId);
        if (news!=null){
            if (news.getThumb()!=null){
                if (news.getThumb().getMediaId()==null){
                    Thumb thumb=new Thumb();
                    thumb.setId(news.getThumbId());
                    thumb.setThumbURL("error");
                    news.setThumb(thumb);
                }
            }else {
                Thumb thumb=new Thumb();
                thumb.setThumbURL("error");
                news.setThumb(thumb);
            }
        }
        return news;
    }

    @Override
    public int addNews(News news) {
        news.setCreateTime(new Date().getTime());
        newsDAO.addNews(news);
        int code=news.getId();
        if (code <= 0) {
            code=0;
        }
        return  code;
    }
    @Override
    public boolean editNews(News news) {
        int code=newsDAO.editNews(news);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }

    @Override
    public boolean editNewsContentSourceUrl(News news) {
        int code=newsDAO.editNewsContentSourceUrl(news);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }

    @Override
    public boolean deleteNews(News news) {
        int code=newsDAO.deleteNews(news);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }

}
