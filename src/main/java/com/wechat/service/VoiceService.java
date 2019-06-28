package com.wechat.service;

import com.wechat.entity.BaseMessage;
import com.wechat.entity.Voice;

import java.util.List;


public interface VoiceService {
    public List<Voice> selectAllVoices(String accountName);
    public Voice selectVoiceByVoiceID(Voice voice);
    public int addVoice(Voice voice);
    public boolean editVoice(Voice voice);
    public boolean deleteVoice(Voice voice);
}
