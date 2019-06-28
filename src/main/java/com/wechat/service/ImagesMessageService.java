package com.wechat.service;

import com.wechat.entity.BaseMessage;
import com.wechat.entity.Image;
import com.wechat.entity.ImagesMessage;
import org.springframework.stereotype.Service;

import java.util.List;

public interface ImagesMessageService {
    public ImagesMessage selectImageMessage(int baseMessageID);
    public boolean deleteImageMessage(BaseMessage baseMessage);
    public int addImageMessage(ImagesMessage imagesMessage);
    public boolean editImageMessage(ImagesMessage imagesMessage);
}
