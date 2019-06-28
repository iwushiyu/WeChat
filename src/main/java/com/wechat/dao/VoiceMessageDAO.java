package com.wechat.dao;

import com.wechat.entity.BaseMessage;
import com.wechat.entity.Voice;
import com.wechat.entity.VoiceMessage;
import org.springframework.stereotype.Repository;

@Repository("voiceMessageDAO")
public interface VoiceMessageDAO {
    public int deleteVoiceMessage(BaseMessage baseMessage);
    public int editVoiceMessage(VoiceMessage voiceMessage);
    public int addVoiceMessage(VoiceMessage voiceMessage);
    public VoiceMessage selectVoiceMessageByBaseId(int baseId);

}
