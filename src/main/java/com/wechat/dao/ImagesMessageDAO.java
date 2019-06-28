package com.wechat.dao;

import com.wechat.entity.BaseMessage;
import com.wechat.entity.Image;
import com.wechat.entity.ImagesMessage;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("imagesMessageDAO")
public interface ImagesMessageDAO {
    public ImagesMessage selectImageMessage(int baseMessageID);
    public int deleteImageMessage(BaseMessage baseMessage);
    public int addImageMessage(ImagesMessage imagesMessage);
    public int editImageMessage(ImagesMessage imagesMessage);

}
