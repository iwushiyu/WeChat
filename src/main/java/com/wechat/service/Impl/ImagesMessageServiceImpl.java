package com.wechat.service.Impl;

import com.wechat.dao.ImagesMessageDAO;
import com.wechat.entity.BaseMessage;
import com.wechat.entity.Image;
import com.wechat.entity.ImagesMessage;
import com.wechat.service.ImagesMessageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("imagesMessageService")
public class ImagesMessageServiceImpl implements ImagesMessageService {
    @Resource(name = "imagesMessageDAO")
    private ImagesMessageDAO imagesMessageDAO;
    @Resource(name = "baseMessageService")
    private BaseMessageServiceImpl baseMessageService;


    @Override
    public ImagesMessage selectImageMessage(int baseMessageID) {
        return imagesMessageDAO.selectImageMessage(baseMessageID);
    }


    @Override
    public boolean deleteImageMessage(BaseMessage baseMessage) {
        int code=imagesMessageDAO.deleteImageMessage(baseMessage);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }

    @Override
    public int addImageMessage(ImagesMessage imagesMessage) {
        int code=0;
        try {
            imagesMessageDAO.addImageMessage(imagesMessage);
            code=imagesMessage.getId();
        }catch (Exception e){
            code=-1;
        }finally {
        }
        return  code;
    }

    @Override
    public boolean editImageMessage(ImagesMessage imagesMessage) {
        int code=imagesMessageDAO.editImageMessage(imagesMessage);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }
}
