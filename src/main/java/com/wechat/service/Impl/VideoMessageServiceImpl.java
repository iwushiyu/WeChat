package com.wechat.service.Impl;

import com.wechat.dao.VideoMessageDAO;
import com.wechat.entity.BaseMessage;
import com.wechat.entity.Video;
import com.wechat.entity.VideoMessage;
import com.wechat.service.VideoMessageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("videoMessageService")
public class VideoMessageServiceImpl implements VideoMessageService {
    @Resource(name = "videoMessageDAO")
    private VideoMessageDAO videoMessageDAO;
    @Override
    public VideoMessage selectVideoMessage(int baseMessageID) {
        return videoMessageDAO.selectVideoMessage(baseMessageID);
    }

    @Override
    public List<Video> selectAllVideos(String accountName) {
        return null;
    }

    @Override
    public Video selectVideoByVideoID(Video video) {
        return null;
    }

    @Override
    public int addVideoMessage(VideoMessage videoMessage) {
        int code=0;
        try {
            videoMessageDAO.addVideoMessage(videoMessage);
            code=videoMessage.getId();
        }catch (Exception e){
            code=-1;
        }finally {
        }
        return  code;
    }

    @Override
    public boolean editVideoMessage(VideoMessage videoMessage) {

        int code=videoMessageDAO.editVideoMessage(videoMessage);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }

    @Override
    public boolean deleteVideo(Video video) {
        return false;
    }
    @Override
    public boolean deleteVideoMessage(BaseMessage baseMessage) {

        int code=videoMessageDAO.deleteVideoMessage(baseMessage);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }
}
