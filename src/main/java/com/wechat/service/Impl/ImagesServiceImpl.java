package com.wechat.service.Impl;

import com.wechat.dao.ImagesDAO;
import com.wechat.entity.BaseMessage;
import com.wechat.entity.Image;
import com.wechat.service.ImagesService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("imagesService")
public class ImagesServiceImpl implements ImagesService {
    @Resource(name = "imagesDAO")
    private ImagesDAO imagesDAO;
    @Override
    public List<Image> selectAllImages(String accountName) {
        List<Image> imageList=new ArrayList<>();
        imageList=imagesDAO.selectAllImages(accountName);
        System.out.println(imageList);
        return imageList;
    }

    @Override
    public Image selectImagesByImageID(Image image) {
        image=imagesDAO.selectImagesByImageID(image);
        return image;
    }

    @Override
    public int addImage(Image image) {
        System.out.println("进入了imagesServiceImpl");
        System.out.println(image);
        image.setCreateTime(new Date().getTime());
        int code=0;
        try {
            imagesDAO.addImage(image);
            code=image.getId();
        }catch (Exception e){
            code=-1;
        }finally {

        }
        return  code;
    }

    @Override
    public boolean editImage(Image image) {
        image.setCreateTime(new Date().getTime());
        int code=imagesDAO.editImage(image);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;

    }

    @Override
    public boolean deleteImage(Image image) {
        int code=imagesDAO.deleteImage(image);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;

    }

}
