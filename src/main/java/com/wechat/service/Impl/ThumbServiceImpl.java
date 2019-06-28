package com.wechat.service.Impl;

import com.wechat.dao.ThumbDAO;
import com.wechat.entity.Thumb;
import com.wechat.entity.Voice;
import com.wechat.service.ThumbService;
import com.wechat.service.VoiceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("thumbService")
public class ThumbServiceImpl implements ThumbService {
    @Resource(name = "thumbDAO")
    private ThumbDAO thumbDAO;
//    @Override
//    public Voice selectVoiceMessage(BaseMessage baseMessage) {
//        return voiceMessageDAO.selectVoiceMessage(baseMessage);
//    }

    @Override
    public List<Thumb> selectAllThumbs(String accountName) {

        List<Thumb> thumbList=new ArrayList<>();
        thumbList=thumbDAO.selectAllThumbs(accountName);
        System.out.println(thumbList);
        return thumbList;
    }

    @Override
    public Thumb selectThumbByThumbID(Thumb thumb) {
        return thumbDAO.selectThumbByThumbID(thumb);
    }

    @Override
    public int addThumb(Thumb thumb) {
        thumb.setCreateTime(new Date().getTime());
        int code=0;
        try {
            thumbDAO.addThumb(thumb);
            code=thumb.getId();
        }catch (Exception e){
            code=-1;
        }finally {

        }
        return  code;
    }

    @Override
    public boolean editThumb(Thumb thumb) {
        thumb.setCreateTime(new Date().getTime());
        int code=thumbDAO.editThumb(thumb);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }

    @Override
    public boolean deleteThumb(Thumb thumb) {
        int code=thumbDAO.deleteThumb(thumb);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }
}
