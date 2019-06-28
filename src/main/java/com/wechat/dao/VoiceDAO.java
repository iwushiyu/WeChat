package com.wechat.dao;

import com.wechat.entity.BaseMessage;
import com.wechat.entity.Voice;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("voiceDAO")
public interface VoiceDAO {
    public List<Voice> selectAllVoice(String accountName);
    public Voice selectVoiceByVoiceID(Voice voice);
    public int addVoice(Voice voice);
    public int editVoice(Voice voice);
    public int deleteVoice(Voice voice);
}
