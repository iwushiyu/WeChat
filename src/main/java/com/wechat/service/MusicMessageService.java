package com.wechat.service;

import com.wechat.entity.BaseMessage;
import com.wechat.entity.Music;
import com.wechat.entity.MusicMessage;
import com.wechat.entity.TextMessage;
import org.springframework.stereotype.Service;


public interface MusicMessageService {
    public Music selectMusicMessage(BaseMessage baseMessage);
}
