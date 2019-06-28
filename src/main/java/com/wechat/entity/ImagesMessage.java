package com.wechat.entity;

import java.awt.*;

public class ImagesMessage extends BaseMessage{
    /*
    * 图片实体类
    * */
    private  int id;
  private Image image;
 private int imageId;
 private int baseId;

    @Override
    public int getId() {
        return id;
    }

    @Override
    public void setId(int id) {
        this.id = id;
    }

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }

    public int getImageId() {
        return imageId;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public int getBaseId() {
        return baseId;
    }

    public void setBaseId(int baseId) {
        this.baseId = baseId;
    }

    @Override
    public String toString() {
        return "ImagesMessage{" +
                "id=" + id +
                ", image=" + image +
                ", imageId=" + imageId +
                ", baseId=" + baseId +
                '}';
    }
}
