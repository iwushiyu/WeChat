package com.wechat.dao;

import com.wechat.entity.BaseMessage;
import com.wechat.entity.Video;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("videoDAO")
public interface VideoDAO {
    public List<Video> selectAllVideos(String accountName);
    public Video selectVideoByVideoID(Video video);
    public int addVideo(Video video);
    public int editVideo(Video video);
    public int deleteVideo(Video video);

}
