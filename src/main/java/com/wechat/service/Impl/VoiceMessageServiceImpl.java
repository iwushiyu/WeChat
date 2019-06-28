package com.wechat.service.Impl;

import com.wechat.dao.VoiceMessageDAO;
import com.wechat.entity.BaseMessage;
import com.wechat.entity.Voice;
import com.wechat.entity.VoiceMessage;
import com.wechat.service.VoiceMessageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("voiceMessageService")
public class VoiceMessageServiceImpl implements VoiceMessageService {
    @Resource(name = "voiceMessageDAO")
    private VoiceMessageDAO voiceMessageDAO;

    @Override
    public boolean editVoiceMessage(VoiceMessage voiceMessage) {
        int code=voiceMessageDAO.editVoiceMessage(voiceMessage);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }

    @Override
    public int addVoiceMessage(VoiceMessage voiceMessage) {
        int code=0;
        try {
            voiceMessageDAO.addVoiceMessage(voiceMessage);
            code=voiceMessage.getId();
        }catch (Exception e){
            code=-1;
        }finally {
        }
        return  code;

    }

    @Override
    public VoiceMessage selectVoiceMessageByBaseId(int baseId) {
        return voiceMessageDAO.selectVoiceMessageByBaseId(baseId);
    }


    @Override
    public boolean deleteVoiceMessage(BaseMessage baseMessage) {

        int code=voiceMessageDAO.deleteVoiceMessage(baseMessage);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }
}
