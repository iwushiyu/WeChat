package com.wechat.service.Impl;

import com.wechat.dao.VideoDAO;
import com.wechat.dao.VideoMessageDAO;
import com.wechat.entity.BaseMessage;
import com.wechat.entity.Video;
import com.wechat.service.VideoMessageService;
import com.wechat.service.VideoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("videoService")
public class VideoServiceImpl implements VideoService {
    @Resource(name = "videoDAO")
    private VideoDAO videoDAO;

    @Override
    public List<Video> selectAllVideos(String accountName) {
        List<Video> videoList=new ArrayList<>();
        videoList=videoDAO.selectAllVideos(accountName);
        System.out.println(videoList);
        return videoList;
    }

    @Override
    public Video selectVideoByVideoID(Video video) {

        return videoDAO.selectVideoByVideoID(video);
    }

    @Override
    public int addVideo(Video video) {
        video.setCreateTime(new Date().getTime());
        int code=0;
        try {
            videoDAO.addVideo(video);
            code=video.getId();
        }catch (Exception e){
            code=-1;
        }finally {
        }
        return  code;
    }

    @Override
    public boolean editVideo(Video video) {
        video.setCreateTime(new Date().getTime());
        int code=videoDAO.editVideo(video);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }

    @Override
    public boolean deleteVideo(Video video) {
        int code=videoDAO.deleteVideo(video);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }
}
