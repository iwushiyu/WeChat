package com.wechat.service;

import com.wechat.entity.*;
import org.springframework.stereotype.Service;

import java.util.List;


public interface VideoMessageService {
    public VideoMessage selectVideoMessage(int baseMessageID);
    public List<Video> selectAllVideos(String accountName);
    public Video selectVideoByVideoID(Video video);
    public int addVideoMessage(VideoMessage videoMessage);
    public boolean editVideoMessage(VideoMessage videoMessage);
    public boolean deleteVideo(Video video);
    public boolean deleteVideoMessage(BaseMessage baseMessage);
}
