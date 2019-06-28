package com.wechat.dao;

import com.wechat.entity.BaseMessage;
import com.wechat.entity.Video;
import com.wechat.entity.VideoMessage;
import org.springframework.stereotype.Repository;

@Repository("videoMessageDAO")
public interface VideoMessageDAO {
    public VideoMessage selectVideoMessage(int baseMessageID);
    public int deleteVideoMessage(BaseMessage baseMessage);
    public int editVideoMessage(VideoMessage videoMessage);
    public int addVideoMessage(VideoMessage videoMessage);
}
