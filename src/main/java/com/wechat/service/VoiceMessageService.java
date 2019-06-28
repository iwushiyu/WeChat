package com.wechat.service;

import com.wechat.entity.BaseMessage;
import com.wechat.entity.ImagesMessage;
import com.wechat.entity.Voice;
import com.wechat.entity.VoiceMessage;
import org.springframework.stereotype.Service;

import java.util.List;


public interface VoiceMessageService {

    public boolean editVoiceMessage(VoiceMessage voiceMessage);
    public int addVoiceMessage(VoiceMessage voiceMessage);
    public VoiceMessage selectVoiceMessageByBaseId(int baseId);
    public boolean deleteVoiceMessage(BaseMessage baseMessage);
}
