package com.wechat.test;

import com.wechat.dao.ImagesMessageDAO;
import com.wechat.dao.SystemUserDAO;
import com.wechat.entity.Image;
import com.wechat.entity.ImagesMessage;
import com.wechat.entity.SystemUser;
import com.wechat.service.ImagesMessageService;
import com.wechat.service.Impl.SystemUserServiceImpl;
import com.wechat.util.FileOperate;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
public class dataTest {
    @Resource(name="imagesMessageService")
    public  ImagesMessageService imagesMessageService;
    @Resource(name = "systemUserService")
    private SystemUserServiceImpl systemUserService;


    public List<Image> test() {
        String account="ceshi";
//        BaseMessage baseMessage=new BaseMessage();
//        baseMessage.setMsgType("image");
//        baseMessage.setAccount(account);
        List<Image> imageList=new ArrayList<>();
        ImagesMessage imagesMessage =imagesMessageService.selectImageMessage(1);
        for (Image image:imageList){
            System.out.println(image.getMediaId());
        }
        return imageList;
    }
    @Resource(name="imagesMessageDAO")
    private  static ImagesMessageDAO imagesMessageDAO;
    public static void main(String[] args) {
//        image image=new image();
//        image.setAccountName("cesi");
//        image.setPicUrl("http://mmbiz.qpic.cn/mmbiz_jbErRmPCew/0");
//        int a=imagesMessageDAO.addimage(image);
        try {
//            SystemUser systemUser=new SystemUser();
//            systemUser.setUsername("username");
//            systemUser.setPassword("username");
//            int sex1=2;
//            systemUser.setSex(sex1);
//            systemUser.setTrueName("username");
//            systemUser.setPhone("username");
//            systemUser.setEmail("username");
//            systemUser.setRoleID(1);
//            boolean flag=false;
//            System.out.println(systemUser.toString());
//            SystemUserServiceImpl systemUserService =new SystemUserServiceImpl();
//
//            int code=systemUserService.addSystemUser(systemUser);
//            System.out.println(flag);

            String file="H:/Graduation_Project/WeChat/src/main/webapp/statics/materialResource/ceshi/video/123.mp4";
            String newNmae="123.mp4";
//            FileOperate.renameFile(file,newNmae);
            FileOperate.deleteFile(file);




         }catch (Exception ee){
        ee.printStackTrace();
    }


    }
}
