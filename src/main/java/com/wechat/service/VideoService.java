package com.wechat.service;

import com.wechat.entity.BaseMessage;
import com.wechat.entity.Video;

import java.util.List;


public interface VideoService {
    public List<Video> selectAllVideos(String accountName);
    public Video selectVideoByVideoID(Video video);
    public int addVideo(Video video);
    public boolean editVideo(Video video);
    public boolean deleteVideo(Video video);
}
