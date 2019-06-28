package com.wechat.service.Impl;

import com.wechat.dao.VoiceDAO;
import com.wechat.dao.VoiceMessageDAO;
import com.wechat.entity.BaseMessage;
import com.wechat.entity.Voice;
import com.wechat.service.VoiceMessageService;
import com.wechat.service.VoiceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("voiceService")
public class VoiceServiceImpl implements VoiceService {
    @Resource(name = "voiceDAO")
    private VoiceDAO voiceDAO;
//    @Override
//    public Voice selectVoiceMessage(BaseMessage baseMessage) {
//        return voiceMessageDAO.selectVoiceMessage(baseMessage);
//    }

    @Override
    public List<Voice> selectAllVoices(String accountName) {

        List<Voice> voiceList=new ArrayList<>();
        voiceList=voiceDAO.selectAllVoice(accountName);
        System.out.println(voiceList);
        return voiceList;
    }

    @Override
    public Voice selectVoiceByVoiceID(Voice voice) {
        return voiceDAO.selectVoiceByVoiceID(voice);
    }

    @Override
    public int addVoice(Voice voice) {
        voice.setCreateTime(new Date().getTime());
        int code=0;
        try {
            voiceDAO.addVoice(voice);
            code=voice.getId();
        }catch (Exception e){
            code=-1;
        }finally {

        }
        return  code;
    }

    @Override
    public boolean editVoice(Voice voice) {
        voice.setCreateTime(new Date().getTime());
        int code=voiceDAO.editVoice(voice);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }

    @Override
    public boolean deleteVoice(Voice voice) {
        int code=voiceDAO.deleteVoice(voice);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }
}
