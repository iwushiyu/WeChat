package com.wechat.controller;

import com.alibaba.fastjson.JSONArray;
import com.wechat.entity.*;
import com.wechat.service.Impl.*;
import com.wechat.util.FileOperate;
import net.sf.json.JSONObject;
import com.wechat.util.WeixinUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@SessionAttributes(value = {"newsList","newsID","newsType","voiceType","voiceID"})
@RequestMapping("/Material")
public class MaterialController {
    @Resource(name = "imagesService")
    private ImagesServiceImpl imagesService;
    @Resource(name = "newsService")
    private NewsServiceImpl newsService;
    @Resource(name = "videoService")
    private VideoServiceImpl videoService;
    @Resource(name = "voiceService")
    private VoiceServiceImpl voiceService;
    @Resource(name = "thumbService")
    private ThumbServiceImpl thumbService;
    @Resource(name = "accountService")
    private AccountServiceImpl accountService;

    public AccessToken getToken(String accountName){
        Account account=new Account();
        account.setName(accountName);
        account=accountService.selectAccount(accountName);
        String appid=account.getAppid();
        String appsecret=account.getAppsecret();
        AccessToken token=WeixinUtil.getAccessToken(appid,appsecret);
        return  token;
    }
    public String deleteMaterialInTencentService(String media,AccessToken token){
        JSONObject json1= new JSONObject();
        boolean flag1=false;
        String errcode=null;
        if (null!=media){
            json1.put("media_id",media);
            String data=json1.toString();
            errcode=WeixinUtil.deleteMaterial(token.getAccess_token(),data);
        }else {
            errcode="0";
        }
        return  errcode;
    }
    public String  delete(int id,HttpSession session,String type) {
        String accountName= (String) session.getAttribute("accountName");
        AccessToken token=getToken(accountName);
        String media=null;
        boolean flag=false;
        String errcode=null;
        if ("image".equals(type)){
            Image image=new Image();
            image.setAccountName(accountName);
            image.setId(id);
            image=imagesService.selectImagesByImageID(image);
            media=image.getMediaId();
            errcode=deleteMaterialInTencentService(media,token);
            if (errcode.equals("0")){
                flag=imagesService.deleteImage(image);
                if (flag){
                    flag= FileOperate.deleteFile(image.getPicUrl());
                }
                if (!flag){
                    errcode="删除失败，请刷新页面重试！";
                }
            }
        }else if ("thumb".equals(type)){
            Thumb thumb=new Thumb();
            thumb.setAccountName(accountName);
            thumb.setId(id);
            thumb=thumbService.selectThumbByThumbID(thumb);
            media=thumb.getMediaId();
            errcode=deleteMaterialInTencentService(media,token);
            if (errcode.equals("0")){
                flag=thumbService.deleteThumb(thumb);
                if (flag){
                    flag=FileOperate.deleteFile(thumb.getImgURL());
                }
                if (!flag){
                    errcode="删除失败，请刷新页面重试！";
                }
            }
//            flag2=thumbService.deleteThumb(thumb);
        }else if ("news".equals(type)){
            News news=new News();
            news.setAccountName(accountName);
            news.setId(id);
            news=newsService.selectNewsByNewsID(id);
            media=news.getMediaId();
            errcode=deleteMaterialInTencentService(media,token);
            if (errcode.equals("0")){
                flag=newsService.deleteNews(news);
                if (!flag){
                        errcode="删除失败，请刷新页面重试！";
                }
            }
        }else if ("voice".equals(type)){
            Voice voice=new Voice();
            voice.setAccountName(accountName);
            voice.setId(id);
            voice=voiceService.selectVoiceByVoiceID(voice);
            media=voice.getMediaId();
            errcode=deleteMaterialInTencentService(media,token);
            if (errcode.equals("0")){
                flag=voiceService.deleteVoice(voice);
                if (flag){
                    flag=FileOperate.deleteFile(voice.getUrl());
                }
                if (!flag){
                    errcode="删除失败，请刷新页面重试！";
                }
            }
        }else if ("video".equals(type)){
            Video video=new Video();
            video.setAccountName(accountName);
            video.setId(id);
            video=videoService.selectVideoByVideoID(video);
            media=video.getMediaId();
            boolean deleteFlag=false;
            errcode=deleteMaterialInTencentService(media,token);
            if (errcode.equals("0")){
                flag=videoService.deleteVideo(video);
                if (flag){
                    flag=FileOperate.deleteFile(video.getUrl());
                }
                if (!flag){
                    errcode="删除失败，请刷新页面重试！";
                }
            }

        }
        return errcode;
    }

    @RequestMapping(value = "/newsManage")
    public String newsManage() {
        return "showNews";
    }

    @RequestMapping(value = "/imageManage")
    public String imagesManage() { return "showImage"; }

    @RequestMapping(value = "/videoManage")
    public String videoManage() {
        return "showVideo";
    }

    @RequestMapping(value = "/voiceManage")
    public String voiceManage() {
        return "showVoice";
    }

    @RequestMapping(value = "/thumbManage")
    public String thumbManage() {
        return "showThumb";
    }

    @RequestMapping(value = "/turnEditNews")
    public String turnEditNews(@RequestParam("newsID") int newsID,Model model) {
        model.addAttribute("newsType","edit");
        model.addAttribute("newsID",newsID);
        System.out.println("进入了turnEditNews");
        return "editNews";
    }
    @RequestMapping(value = "/turnAddNews")
    public String turnAddNews(Model model) {
        model.addAttribute("newsType","add");
        return "editNews";
    }
    @RequestMapping(value = "/turnPreviewNews")
    public String turnPreviewNews(@RequestParam("newsID") int newsID,Model model) {
        model.addAttribute("newsID",newsID);
        return "previewNews";
    }
    @RequestMapping(value = "/turnAddVideo")
    public String turnAddVideo() {
        return "addVideo";
    }


    @RequestMapping(value = "/turnAddVoice")
    public String turnAddVoice(Model model) {
        model.addAttribute("voiceType","add");
        return "editVoice";
    }
    @RequestMapping(value = "/turnEditVoice")
    public String turnEditVoice(@RequestParam("voiceID") int voiceID,Model model) {
        model.addAttribute("voiceType","edit");
        model.addAttribute("voiceID",voiceID);
        System.out.println("进入了turnEditVoice");
        return "editVoice";
    }

//    文件上传(图片、视频、语音、缩略图)
    @RequestMapping(value="/doUpload", method= RequestMethod.POST)
    @ResponseBody
    public Object doUploadFile(@RequestParam("file") MultipartFile file,
								@RequestParam("title") String title,
								@RequestParam("introduction") String introduction,
								@RequestParam("fileType") String fileType,
								HttpSession session){
        int count=0;
        long fileNum=0;
        int code=0;
        String mediaId=null;
        String errcode=null;
        String pictureURL=null;
        String accountName= (String) session.getAttribute("accountName");
        AccessToken token=getToken(accountName);
        System.out.println(fileType);
        JSONObject jsonObject=new JSONObject();
        String url = this.getClass().getClassLoader().getResource("").getPath();
        System.out.println(url);
        if(!file.isEmpty()){
            try {
                fileNum++;
                //这里将上传得到的文件保存至 d:\\temp\\file 目录
                String fileName=file.getOriginalFilename();
                if (fileName.length()>=16){
                    fileName=fileName.substring(0,12)+fileName.substring(fileName.length()-4);
                }
                System.out.println(fileName);
               String path="D:\\Graduation_Project\\WeChat\\src\\main\\webapp\\statics\\materialResource\\"+accountName+"\\"+fileType;
                File newFile = new File(path, System.currentTimeMillis()+file.getOriginalFilename());
                String filepath=path+"\\"+newFile.getName();
                System.out.println(System.currentTimeMillis());
                    System.out.println(filepath);
                    System.out.println(newFile.getName());
                    FileUtils.copyInputStreamToFile(file.getInputStream(), newFile);
                    JSONObject jsonObject1=null;
                    if("video".equals(fileType)){
                        jsonObject1=WeixinUtil.uploadOthersMaterial(filepath,token.getAccess_token(),fileType,title,introduction);
                    }else {
                        jsonObject1=WeixinUtil.uploadOthersMaterial(filepath,token.getAccess_token(),fileType,null,null);
                    }
                    if ("image".equals(fileType)){
                        if (jsonObject1.has("media_id")){
                            mediaId=jsonObject1.getString("media_id");
//                    图文素材中的图片上传
//                    pictureURL=WeixinUtil.uploadNewsImg(filepath,token.getAccess_token());
                            pictureURL=jsonObject1.getString("url");
                            Image image=new Image();
                            image.setAccountName(accountName);
                            image.setPicUrl(pictureURL);
                            image.setImgUrl(filepath);
                            image.setImageName(fileName);
                            image.setMediaId(mediaId);
                            System.out.println(image);
                            code=imagesService.addImage(image);
                        }else{
                            errcode=jsonObject1.getString("errcode");
                        }
                    }else if ("thumb".equals(fileType)){
                        if (jsonObject1.has("media_id")){
                            mediaId=jsonObject1.getString("media_id");
                            pictureURL=jsonObject1.getString("url");
                            Thumb thumb=new Thumb();
                            thumb.setAccountName(accountName);
                            thumb.setMediaId(mediaId);
                            thumb.setThumbName(fileName);
                            thumb.setThumbURL(pictureURL);
                            thumb.setImgURL(filepath);
                            code=thumbService.addThumb(thumb);
                        }else{
                            errcode=jsonObject1.getString("errcode");
                        }
                    } else if ("voice".equals(fileType)){
//                    jsonObject1=WeixinUtil.uploadOthersMaterial(filepath,token.getAccess_token(),fileType,null,null);
//                    mediaId=jsonObject1.getString("media_id");
//                    if (mediaId==null){
//                        errcode=jsonObject1.getString("errcode");
//                    }else{
                        if (jsonObject1.has("media_id")){
                            mediaId=jsonObject1.getString("media_id");
                            Voice voice=new Voice();
                            voice.setAccountName(accountName);
                            voice.setMediaId(mediaId);
                            voice.setVoiceName(fileName);
                            voice.setTitle(title);
                            voice.setUrl(filepath);
                            voice.setDescription(introduction);
                            code=voiceService.addVoice(voice);
                        }else{
                            errcode=jsonObject1.getString("errcode");
                        }
                    }else if ("video".equals(fileType)){
//                    jsonObject1=WeixinUtil.uploadOthersMaterial(filepath,token.getAccess_token(),fileType,"视频title","视频introduction");
//                    mediaId=jsonObject1.getString("media_id");
//                    if (mediaId==null){
//                        errcode=jsonObject1.getString("errcode");
//                    }else{
                        if (jsonObject1.has("media_id")){
                            mediaId=jsonObject1.getString("media_id");
                            Video video=new Video();
                            video.setAccountName(accountName);
                            video.setMediaId(mediaId);
                            video.setVideoName(fileName);
                            video.setTitle(title);
                            video.setDescription(introduction);
                            video.setUrl(filepath);
                            code=videoService.addVideo(video);
                        }else{
                            errcode=jsonObject1.getString("errcode");
                        }
                    }

                boolean flag=false;
                if (code>0){
                    flag=true;
                    count++;
                }
                System.out.println("插入数据的个数"+count);
                System.out.println("插入数据的个数fileNum:"+fileNum);
                System.out.println("永久素材（图片）上传返回URL::::::"+pictureURL);


            } catch (IOException e) {
                e.printStackTrace();
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            } catch (KeyManagementException e) {
                e.printStackTrace();
            } catch (NoSuchProviderException e) {
                e.printStackTrace();
            }finally {
                if (count==fileNum){
                    if (count==1){
                        jsonObject.put("fileID", code);
                    }
                    jsonObject.put("code", 0);
                }else{
                    jsonObject.put("code", 1);
                }
                jsonObject.put("errcode", errcode);
            }

        }

//        String res=jsonObject.toString();
//        jsonArray.set(0,jsonObject);
        return jsonObject;
    }

//    图片显示
@RequestMapping(value="/showImages", method= RequestMethod.POST)
@ResponseBody
    /*
    * 在打开图片管理的时候就自动执行
    * */
public List<Image>  showPictures( Model model,HttpSession session) {

    String account= (String) session.getAttribute("accountName");
    List<Image> imageList=new ArrayList<>();
    imageList=imagesService.selectAllImages(account);
    for (Image image:imageList){
        System.out.println(image.getPicUrl()+image.getImageName());
    }
//    model.addAttribute("imagesList",JSONArray.toJSONString(imageList));
    return imageList;
}
    //    获取一张图片
    @RequestMapping(value="/getImage", method= RequestMethod.POST)
    @ResponseBody
    /*
     * 在打开图片管理的时候就自动执行
     * */
    public Image getImagesByImageID(@RequestParam("id") int id,HttpSession session) {
        String account= (String) session.getAttribute("accountName");
        Image image=new Image();
        image.setId(id);
        image=imagesService.selectImagesByImageID(image);
        return image;
    }


    //    图片修改名字
    @RequestMapping(value="/reImageName", method= RequestMethod.POST)
    @ResponseBody
    /*
     * 在打开图片管理的时候就自动执行
     * */
    public boolean  renamePictures( @RequestParam("id") int id,@RequestParam("newName") String newName,HttpSession session) {
            String accountName= (String) session.getAttribute("accountName");
        Image image=new Image();

            image.setId(id);
            image=imagesService.selectImagesByImageID(image);
            boolean flag=false;
            flag=FileOperate.renameFile(image.getImgUrl(),newName);
            if (flag){
                image.setAccountName(accountName);
                image.setImageName(newName);
                flag=imagesService.editImage(image);
            }

//        String p = f.getParent();   // 文件所在路径(一定要写,否则改名操作将把原文件删除)
//        File nf = new File(p + File.separatorChar+"new.txt");
        return flag;
    }
    //    图片删除
    @RequestMapping(value="/deleteImage", method= RequestMethod.POST)
    @ResponseBody
    public String  deletePictures( @RequestParam("id") int id,HttpSession session) {
        String errcode="0";
        errcode= delete(id,session,"image");
        return errcode;
    }


    //   缩略图显示
    @RequestMapping(value="/showThumbs", method= RequestMethod.POST)
    @ResponseBody
    /*
     * 在打开缩略图管理的时候就自动执行
     * */
    public List<Thumb>  showMaterials( @RequestParam("fileType") String fileType,HttpSession session) {

        String account= (String) session.getAttribute("accountName");
        List<Thumb> thumbList=new ArrayList<>();
        thumbList=thumbService.selectAllThumbs(account);
        for (Thumb thumb:thumbList){
            System.out.println(thumb.getThumbName()+thumb.getMediaId());
        }
//    model.addAttribute("imagesList",JSONArray.toJSONString(imageList));
        return thumbList;
    }
    //    获取一张缩略图
    @RequestMapping(value="/getThumb", method= RequestMethod.POST)
    @ResponseBody
    /*
     * 在打开缩略图管理的时候就自动执行
     * */
    public Thumb getMaterialByMaterialID(@RequestParam("id") int id,HttpSession session) {
        String account= (String) session.getAttribute("accountName");
        Thumb thumb=new Thumb();
        thumb.setId(id);
        thumb.setAccountName(account);
        thumb=thumbService.selectThumbByThumbID(thumb);
        return thumb;
    }


    //    缩略图修改名字
    @RequestMapping(value="/reThumbName", method= RequestMethod.POST)
    @ResponseBody
    /*
     * 在打开缩略图管理的时候就自动执行
     * */
    public boolean  renameMaterial( @RequestParam("id") int id,@RequestParam("newName") String newName,HttpSession session) {
        String accountName= (String) session.getAttribute("accountName");
        Thumb thumb=new Thumb();
        thumb.setId(id);
        boolean flag=false;
            thumb.setAccountName(accountName);
            thumb.setThumbName(newName);
            flag=thumbService.editThumb(thumb);
        return flag;
    }
    //    缩略图删除
    @RequestMapping(value="/deleteThumb", method= RequestMethod.POST)
    @ResponseBody
    public String  deleteMaterial( @RequestParam("id") int id,HttpSession session) {
        String errcode="0";
        errcode= delete(id,session,"thumb");
        return errcode;
    }


    //    图文显示
    @RequestMapping(value="/showNews", method= RequestMethod.POST)
    @ResponseBody
    /*
     * 在打开图文管理的时候就自动执行
     * */
    public List<News>  showNews(Model model, HttpSession session) {
        String account= (String) session.getAttribute("accountName");
        List<News> newsList=new ArrayList<>();
        newsList=newsService.selectAllNews(account);
        for (News news:newsList){
            System.out.println(news.getTitle()+"：缩略图："+news.getAuthor()+"：meid："+news.getMediaId());
        }
        model.addAttribute("newsList",JSONArray.toJSONString(newsList));
        return newsList;
    }

    //    添加图文
    @RequestMapping(value="/addNews", method= RequestMethod.POST)
    @ResponseBody
    public Object  addNews( @RequestParam("title") String title,@RequestParam("author") String author,@RequestParam("content") String content,@RequestParam("thumbId") int thumbId,@RequestParam("digest") String digest,HttpSession session) throws Exception {
        boolean flag=false;
        int code=0;
        String errcode=null;
        String accountName= (String) session.getAttribute("accountName");
        String contentSourceUrl=null;
        /*
         * 上传图文素材
         * */
        if (digest==""){
            if (content.length()>54){
                digest=content.substring(0,54);
            }else {
                digest=content;
            }
        }
        AccessToken token=getToken(accountName);
        JSONObject jsonObject=null;
        Thumb thumb=new Thumb();
        thumb.setId(thumbId);
        thumb.setAccountName(accountName);
        thumb=thumbService.selectThumbByThumbID(thumb);
        if (thumb.getMediaId()!=null){
            News news=new News();
            news.setTitle(title);
            news.setAccountName(accountName);
            news.setThumbId(thumbId);
//            news.setMediaId(mediaId);
            news.setAuthor(author);
            news.setDigest(digest);
            news.setShowCoverPic(1);
            news.setContent(content);
//                news.setContentSourceUrl("http://www.baidu.com");
            news.setCreateTime(new Date().getTime());
            code=newsService.addNews(news);
            contentSourceUrl="http://wushiyu.51vip.biz//jsp/previewNews.jsp?newsID="+code;
            news.setId(code);
            if (code==0){
                errcode="连接数据库错误！";
            }else{
                String thumbMediaId=thumb.getMediaId();
                JSONObject json1= new JSONObject();
                JSONObject json2=new JSONObject();
                json2.put("title",title);
                json2.put("thumb_media_id",thumbMediaId);
                json2.put("author",author);
                json2.put("digest",digest);
                json2.put("show_cover_pic","1");
                json2.put("content",content);
                json2.put("content_source_url",contentSourceUrl);
                JSONArray jsonArray=new JSONArray();
                jsonArray.add(json2);
                json1.put("articles",jsonArray);
                String data=json1.toString();
                jsonObject=WeixinUtil.uploadNews(token.getAccess_token(),data);
                if (jsonObject.has("media_id")){
                    String mediaId= jsonObject.getString("media_id");
                    news.setContentSourceUrl(contentSourceUrl);
                    news.setMediaId(mediaId);
                    newsService.editNews(news);
                }else{
                    errcode=jsonObject.getString("errcode");
                    newsService.deleteNews(news);
                }
            }

//
//            if (jsonObject.has("media_id")){
//                String mediaId= jsonObject.getString("media_id");
//                News news=new News();
//                news.setTitle(title);
//                news.setAccountName(accountName);
//                news.setThumbId(thumbId);
//                news.setMediaId(mediaId);
//                news.setAuthor(author);
//                news.setDigest(digest);
//                news.setShowCoverPic(1);
//                news.setContent(content);
////                news.setContentSourceUrl("http://www.baidu.com");
//                news.setCreateTime(new Date().getTime());
//                code=newsService.addNews(news);
//
////                http://23c32214i1.imwork.net//jsp/previewNews.jsp?newsID=32
//                if (code==0){
//                    errcode="连接数据库错误！";
//                }else{
//                    news.setContentSourceUrl("http://23c32214i1.imwork.net//jsp/previewNews.jsp?newsID="+code);
//                    newsService.editNewsContentSourceUrl(news);
//                }
//            }else{
//                errcode=jsonObject.getString("errcode");
//            }
        }else{
            errcode="连接数据库错误！";
        }
        jsonObject.put("code", code);
        jsonObject.put("errcode", errcode);
        return jsonObject;
    }
    //    修改图文
    @RequestMapping(value="/editNews", method= RequestMethod.POST)
    @ResponseBody
    /*
     * 在打开图片管理的时候就自动执行
     * */
    public Object  editNews( @RequestParam("title") String title,@RequestParam("author") String author,@RequestParam("content") String content,@RequestParam("thumbId") int thumbId,@RequestParam("digest") String digest,HttpSession session) throws Exception {
        boolean flag=false;
        String errcode=null;
        JSONObject jsonObject=new JSONObject();
        String accountName= (String) session.getAttribute("accountName");
        int newsID= (int) session.getAttribute("newsID");
        /*
         * 修改图文素材
         * */
        if (digest==""){
            if (content.length()>54){
                digest=content.substring(0,54);
            }else {
                digest=content;
            }
        }
        AccessToken token=getToken(accountName);
        Thumb thumb=new Thumb();
        thumb.setId(thumbId);
        thumb.setAccountName(accountName);
        thumb=thumbService.selectThumbByThumbID(thumb);
        if (thumb.getMediaId()!=null){
            String thumbMediaId=thumb.getMediaId();
            System.out.println("thumbID: "+thumbId);
            News news=new News();
            news.setId(newsID);
            news.setAccountName(accountName);
            news=newsService.selectNewsByNewsID(newsID);
            String mediaId=news.getMediaId();
            JSONObject json1= new JSONObject();
            JSONObject json2=new JSONObject();
            json2.put("title",title);
            json2.put("thumb_media_id",thumbMediaId);
            json2.put("author",author);
            json2.put("digest",digest);
            json2.put("show_cover_pic","1");
            json2.put("content",content);
            json2.put("content_source_url","http://wushiyu.51vip.biz//jsp/previewNews.jsp?newsID="+newsID);
//        net.sf.json.JSONArray jsonArray=new net.sf.json.JSONArray();
//        jsonArray.add(json2);
            json1.put("media_id",mediaId);
            json1.put("index",0);
            json1.put("articles",json2);
            String data=json1.toString();
            errcode=WeixinUtil.updateNews(token.getAccess_token(),data+"");
            System.out.println("修改的返回码："+errcode);
            if ("0".equals(errcode)){
                news=new News();
                news.setId(newsID);
                news.setTitle(title);
                news.setAccountName(accountName);
                news.setThumbId(thumbId);
                news.setMediaId(mediaId);
                news.setAuthor(author);
                news.setDigest(digest);
                news.setShowCoverPic(1);
                news.setContent(content);
                news.setContentSourceUrl("http://wushiyu.51vip.biz//jsp/previewNews.jsp?newsID="+newsID);
                news.setCreateTime(new Date().getTime());
                flag=newsService.editNews(news);
                if (flag){
                    jsonObject.put("code", newsID);
                }else {
                    jsonObject.put("code", 0);
                    errcode="数据库错误!";
                }
            }else{
                jsonObject.put("code", 0);
            }
        }else {
            errcode="数据库错误!";
        }
        jsonObject.put("errcode", errcode);

//        flag=newsService.addNews(news);
//        String res=jsonObject.toString();
//        jsonArray.set(0,jsonObject);
        return jsonObject;
    }
        /*
     * 选择图片页面
     * */
    @RequestMapping(value = "/selectThumb")
    public String selectThumb() {
        return "selectThumb";
    }
    //    图文删除
    @RequestMapping(value="/deleteNews", method= RequestMethod.POST)
    @ResponseBody
    public String  deleteNews( @RequestParam("id") int id,HttpSession session) {
        String errcode="0";
        errcode= delete(id,session,"news");
        return errcode;
    }
    //    获取一个图文
    @RequestMapping(value="/getNews", method= RequestMethod.POST)
    @ResponseBody
    /*
     * 打开编辑图文页面的时候
     * */
    public News getNewsByNewsID(@RequestParam("id") int id, HttpSession session) {
        String account= (String) session.getAttribute("accountName");
        News news=new News();
        news.setId(id);
        news.setAccountName(account);
        news=newsService.selectNewsByNewsID(id);
        return news;
    }


    //    语音显示
    @RequestMapping(value="/showVoices", method= RequestMethod.POST)
    @ResponseBody
    /*
     * 在打开语音管理的时候就自动执行
     * */
    public List<Voice>  showVoices( Model model,HttpSession session) {

        String account= (String) session.getAttribute("accountName");
        List<Voice> voiceList=new ArrayList<>();
        voiceList=voiceService.selectAllVoices(account);
        model.addAttribute("voiceList",JSONArray.toJSONString(voiceList));
        return voiceList;
    }
    //    获取一个语音
    @RequestMapping(value="/getVoice", method= RequestMethod.POST)
    @ResponseBody
    /*
     * 在打开语音管理的时候就自动执行
     * */
    public Voice getVoiceByVoiceID(@RequestParam("id") int id,HttpSession session) {
        String account= (String) session.getAttribute("accountName");
        Voice voice=new Voice();
        voice.setId(id);
        voice.setAccountName(account);
        voice=voiceService.selectVoiceByVoiceID(voice);
        return voice;
    }


    //   语音修改名字
    @RequestMapping(value="/editVoice", method= RequestMethod.POST)
    @ResponseBody
    /*
     * 在打开语音管理的时候就自动执行
     * */
    public boolean  editVoice( @RequestParam("voiceId") int id,@RequestParam("title") String title,@RequestParam("introduction") String introduction,HttpSession session) {
        String accountName= (String) session.getAttribute("accountName");
        Voice voice=new Voice();
        voice.setAccountName(accountName);
        voice.setId(id);
        boolean flag=false;
        voice.setDescription(introduction);

            voice.setTitle(title);
            voice.setCreateTime(new Date().getTime());
            flag=voiceService.editVoice(voice);

        return flag;
    }
    //    语音删除
    @RequestMapping(value="/deleteVoice", method= RequestMethod.POST)
    @ResponseBody
    public String  deleteVoice( @RequestParam("id") int id,HttpSession session) {
        String errcode="0";
        errcode= delete(id,session,"voice");
        return errcode;
    }



    //    视频显示
    @RequestMapping(value="/showVideo", method= RequestMethod.POST)
    @ResponseBody
    /*
     * 在打开视频管理的时候就自动执行
     * */
    public List<Video>  showVideo( Model model,HttpSession session) {

        String account= (String) session.getAttribute("accountName");
        List<Video> videoList=new ArrayList<>();
        videoList=videoService.selectAllVideos(account);
        model.addAttribute("videoList",JSONArray.toJSONString(videoList));
        return videoList;
    }
    //    获取一个视频
    @RequestMapping(value="/getVideo", method= RequestMethod.POST)
    @ResponseBody
    /*
     * 在打开视频管理的时候就自动执行
     * */
    public Video getVideoByVideoID(@RequestParam("id") int id,HttpSession session) {
        String account= (String) session.getAttribute("accountName");
        Video video=new Video();
        video.setId(id);
        video.setAccountName(account);
        video=videoService.selectVideoByVideoID(video);
        return video;
    }


    //   视频修改
//    @RequestMapping(value="/editVideo", method= RequestMethod.POST)
//    @ResponseBody
//    /*
//     * 在打开视频管理的时候就自动执行
//     * */
//    public boolean  editVideo( @RequestParam("videoID") int id,@RequestParam("reTitle") String reTitle,@RequestParam("reIntroduction") String reIntroduction,HttpSession session) {
//        String accountName= (String) session.getAttribute("accountName");
//        Video video=new Video();
//        video.setAccountName(accountName);
//        video.setId(id);
//        video.setVideoName(reTitle);
//
//        video.setDescription(reIntroduction);
//
//        boolean flag=false;
//        flag=videoService.editVideo(video);
//        return flag;
//    }
    //   视频删除
    @RequestMapping(value="/deleteVideo", method= RequestMethod.POST)
    @ResponseBody
    public String  deleteVideo( @RequestParam("id") int id,HttpSession session) {
        String errcode="0";
        errcode= delete(id,session,"video");
        return errcode;
    }



    /*
     * 群发素材*/

    @RequestMapping(value = "/sendMaterial")
    @ResponseBody
    public LayuiResult sendMessage(@RequestBody String[] openids, @RequestParam("messageId") int messageId,@RequestParam("messageType") String messageType, HttpSession session) throws Exception {
        String accountName= (String) session.getAttribute("accountName");
        Account account=new Account();
        account.setName(accountName);
        account=accountService.selectAccount(accountName);
        String errorcode="error";
        AccessToken accessToken=WeixinUtil.getAccessToken(account.getAppid(),account.getAppsecret());
        String token=accessToken.getAccess_token();
        switch (messageType){
            case "image":{
                ImagesMessage imagesMessage=new ImagesMessage();
                Image image=new Image();
                image.setId(messageId);
                image.setAccountName(accountName);
                image=imagesService.selectImagesByImageID(image);
                errorcode=WeixinUtil.sendImageMessageByOpenID(token,openids,imagesMessage.getImage().getMediaId());
                break;
            }
            case "news":{
                News news=newsService.selectNewsByNewsID(messageId);
                errorcode=WeixinUtil.sendNewsMessageByOpenID(token,openids,news);
                break;
            }
            case "voice":{
//                VoiceMessage voiceMessage=voiceMessageService.selectVoiceMessageByBaseId(messageId);
                Voice voice=new Voice();
                voice.setId(messageId);
                voice.setAccountName(accountName);
                       voice= voiceService.selectVoiceByVoiceID(voice);
                errorcode=WeixinUtil.sendVoiceMessageByOpenID(token,openids,voice.getMediaId());
                break;
            }
            case "video":{
                Video video=new Video();
                video.setId(messageId);
                video.setAccountName(accountName);
                video=videoService.selectVideoByVideoID(video);
                errorcode=WeixinUtil.sendVideoMessageByOpenID(token,openids,video);
                break;
            }
            default:{
                errorcode="群发失败，请刷新页面重试！";
            }
        }

        LayuiResult result = new LayuiResult();
        if ("0".equals(errorcode)) {
            result.setMsg("群发成功，微信端接收还需一点时间！");
        } else {
            result.setMsg("错误码："+errorcode);
        }
        return result;
    }



}
