package com.wechat.service;

import com.wechat.entity.Image;

import java.util.List;

public interface ImagesService {
    public List<Image> selectAllImages(String accountName);
    public Image selectImagesByImageID(Image image);
    public int addImage(Image image);
    public boolean editImage(Image image);
    public boolean deleteImage(Image image);
}
