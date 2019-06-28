package com.wechat.service.Impl;

import com.wechat.dao.MusicMessageDAO;
import com.wechat.entity.BaseMessage;
import com.wechat.entity.Music;
import com.wechat.service.MusicMessageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("musicMessageService")
public class MusicMessageServiceImpl implements MusicMessageService {
    @Resource(name = "musicMessageDAO")
    private MusicMessageDAO musicMessageDAO;
    @Override
    public Music selectMusicMessage(BaseMessage baseMessage) {
        return musicMessageDAO.selectMusicMessage(baseMessage);
    }
}
