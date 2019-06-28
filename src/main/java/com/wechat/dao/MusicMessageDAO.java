package com.wechat.dao;

import com.wechat.entity.BaseMessage;
import com.wechat.entity.Music;
import com.wechat.entity.MusicMessage;
import org.springframework.stereotype.Repository;

@Repository("musicMessageDAO")
public interface MusicMessageDAO {
    public Music selectMusicMessage(BaseMessage baseMessage);
}
