package com.wechat.dao;

import com.wechat.entity.Image;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("imagesDAO")
public interface ImagesDAO {
    public List<Image> selectAllImages(String accountName);
    public Image selectImagesByImageID(Image image);
    public int addImage(Image image);
    public int editImage(Image image);
    public int deleteImage(Image image);

}
