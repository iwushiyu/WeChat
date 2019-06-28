package com.wechat.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.wechat.entity.*;
import com.wechat.service.Impl.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/User")
public class UserController {
    @Resource(name = "systemUserService")
    private SystemUserServiceImpl systemUserService;
    @Resource(name = "accountService")
    private AccountServiceImpl accountService;
    @Resource(name = "systemUserAccountService")
    private SystemUserAccountServiceImpl systemUserAccountService;
    /*
     * 显示用户信息
     * */
    @RequestMapping(value = "/list")
    public String list() {
        return "showUser";
    }

    @RequestMapping(value = "/showPerson")
    public String showPersonInformation() {
        return "basic";
    }

    @RequestMapping(value = "/userData")
    @ResponseBody
    public MessageData userList(String keyword, int page, int limit,HttpSession session) {
        LayuiResult<SystemUser> result = new LayuiResult<SystemUser>();
        MessageData messageData=new MessageData();
        String accountName= (String) session.getAttribute("accountName");
        Account account=accountService.selectAccount(accountName);
        int accountId=0;
        if (account!=null){
            accountId=account.getId();
        }
        List<SystemUser> list =new ArrayList<>();
        SystemUser systemUser=new SystemUser();
        if (keyword==null||keyword.length()==0){
            list=systemUserService.allSystemUser(accountId);
        }else{
            list=systemUserService.search(keyword,accountId);
        }
        List<SystemUser> list1 = new ArrayList<SystemUser>();
        if (list.size() <= limit) {
            for (int i = 0; i < list.size(); i++) {
                list1.add(list.get(i));
            }
        } else if (list.size() > limit) {
            if (page <= (list.size() / limit)) {
                for (int i = (page - 1) * limit; i < page * limit; i++) {
                    list1.add(list.get(i));
                }
            } else if (page > (list.size() / limit)) {
                for (int i = (page - 1) * limit; i < (((page - 1) * limit) + list.size() % limit); i++) {
                    list1.add(list.get(i));
                }
            }
        }
        messageData.setData(list1);
        messageData.setCount(list.size());//显示共有多少条数据
        System.out.println(messageData);
        return messageData;
    }


    @RequestMapping(value = "/selectUser")
    @ResponseBody
    public MessageData selectUser(String keyword,int page, int limit,HttpSession session) {
        LayuiResult<SystemUser> result = new LayuiResult<SystemUser>();
        MessageData messageData=new MessageData();
        SystemUser systemUser= (SystemUser) session.getAttribute("systemUserSession");
        String accountName= (String) session.getAttribute("accountName");
        Account account=accountService.selectAccount(accountName);
        List<SystemUser> list =new ArrayList<>();
            list=systemUserService.allSystemUserByUserId(systemUser.getId(),account.getId());
        List<SystemUser> list1 = new ArrayList<SystemUser>();
        if (list.size() <= limit) {
            for (int i = 0; i < list.size(); i++) {
                list1.add(list.get(i));
            }
        } else if (list.size() > limit) {
            if (page <= (list.size() / limit)) {
                for (int i = (page - 1) * limit; i < page * limit; i++) {
                    list1.add(list.get(i));
                }
            } else if (page > (list.size() / limit)) {
                for (int i = (page - 1) * limit; i < (((page - 1) * limit) + list.size() % limit); i++) {
                    list1.add(list.get(i));
                }
            }
        }
        messageData.setData(list1);
        messageData.setCount(list.size());//显示共有多少条数据
        System.out.println(messageData);
        return messageData;
    }
    /*
     * 添加已有的系统用户
     * */
    @RequestMapping(value = "/addOldUser")
    @ResponseBody
    public LayuiResult addOldUser(@RequestBody Integer[] userIds, HttpSession session) {
        String accountName= (String) session.getAttribute("accountName");
        Account account=new Account();
        account.setName(accountName);
        account=accountService.selectAccount(accountName);

        SystemUserAccount systemUserAccount=new SystemUserAccount();
        systemUserAccount.setAccountId(account.getId());
        for(int i=0;i<userIds.length;i++){
            systemUserAccount.setUserId(userIds[i]);
            systemUserAccountService.addSystemUserAccount(systemUserAccount);
        }

        LayuiResult result = new LayuiResult();
            result.setMsg("添加成功！");
        return result;
    }

    /*
     * 添加新的系统用户
     * */
    @RequestMapping(value = "/adduser")
    public String add() {
        return "adduser";
    }

    @RequestMapping(value = "/regist")
    @ResponseBody
    public boolean addUser(@RequestBody SystemUser systemUser,HttpSession session) {
//        LayuiResult result = new LayuiResult();
//        SystemUser systemUser=new SystemUser();
//        systemUser.setUsername(username);
//        systemUser.setPassword(password);
//        String sex1=sex+"";
//        systemUser.setSex(sex1);
//        systemUser.setTrueName(trueName);
//        systemUser.setPhone(phone);
//        systemUser.setEmail(email);
        systemUser.setRoleID(3);
        systemUser.setCreateTime(new Date().getTime());
        boolean flag=false;
        System.out.println(systemUser.toString());
        int code=systemUserService.addSystemUser(systemUser);
        if (code>0) {
                String accountName= (String) session.getAttribute("accountName");
                Account account=new Account();
                account=accountService.selectAccount(accountName);
                SystemUserAccount systemUserAccount=new SystemUserAccount();
                systemUserAccount.setUserId(code);
                systemUserAccount.setAccountId(account.getId());
                code= systemUserAccountService.addSystemUserAccount(systemUserAccount);
               if (code>0){
                   flag=true;
               }
//            result.setMsg("添加成功");
        }
        return flag;
    }
    /*
     * 获取单个用户信息
     * */
    @RequestMapping(value = "/showUser",method = RequestMethod.POST)
    @ResponseBody
    public Object showAccount(HttpSession session){
//        String accountName=jspAccountService.select();
        SystemUser systemUser= (SystemUser) session.getAttribute("systemUserSession");
//        SystemUser systemUser=new SystemUser();
//        systemUser.setUsername();
//        accountShow.setName(accountName);
//        accountShow=accountService.selectAccount(accountShow);
        return JSONObject.parse(JSONArray.toJSONString(systemUser));
    }


    /*
     * 获取单个用户信息
     * */
    @RequestMapping(value = "/getUser",method = RequestMethod.POST)
    @ResponseBody
    public Object getUser(@RequestParam("userId") int userId){
//        String accountName=jspAccountService.select();

        SystemUser systemUser=systemUserService.getSystemUserById(userId);
//        SystemUser systemUser=new SystemUser();
//        systemUser.setUsername();
//        accountShow.setName(accountName);
//        accountShow=accountService.selectAccount(accountShow);
        return JSONObject.parse(JSONArray.toJSONString(systemUser));
    }

    /*
     * 删除系统用户
     * */
    @RequestMapping(value = "/deleteSystemUser", method = RequestMethod.POST)
    @ResponseBody
    public boolean delete(@RequestBody SystemUser user,HttpSession session) {
        boolean flag=false;
        String accountName= (String) session.getAttribute("accountName");
        Account account=new Account();
        account=accountService.selectAccount(accountName);
        List<Integer> userList= systemUserAccountService.accountIdByUserId(user.getId());
        SystemUserAccount systemUserAccount=new SystemUserAccount();
        systemUserAccount.setUserId(user.getId());
        systemUserAccount.setAccountId(account.getId());
        flag= systemUserAccountService.deleteSystemUserAccount(systemUserAccount);
        if (userList.size()<=1){
            flag=systemUserService.deleteSystemUser(user);
        }
        return flag;
    }

    /*
     * 修改系统用户信息
     * */
    @RequestMapping(value = "/editSystemUser", method = RequestMethod.POST)
    @ResponseBody
    public Object eidt(SystemUser user) {
//        boolean flag=false;
//        System.out.println("用户ID："+user.getId());
        systemUserService.editSystemUser(user);
        return JSONObject.parse(JSONArray.toJSONString(user));
    }
    /*
     * 修改用户信息(最新修改)
     * */
    @RequestMapping(value = "/editUser", method = RequestMethod.POST)
    @ResponseBody
    public boolean eidtUser(@RequestBody SystemUser user,@RequestParam("userId") int userId) {
//        boolean flag=false;
//        System.out.println("用户ID："+user.getId());
        user.setId(userId);
        user.setCreateTime(new Date().getTime());
        boolean flag=systemUserService.editSystemUser(user);

        return flag;
    }

    /*
     * 修改系统用户密码
     * */
    @RequestMapping(value = "/editpassword", method = RequestMethod.POST)
    @ResponseBody
    public Object eidtpwd(@RequestParam(value = "userID") int userID,
                          @RequestParam(value = "rpwd")String rpwd) {
//        boolean flag=false;
        SystemUser systemUser=new SystemUser();
        systemUser.setPassword(rpwd);
        systemUser.setId(userID);
        System.out.println("用户ID："+systemUser.getId());
        System.out.println("用户ID："+systemUser.getPassword());
        boolean flag=systemUserService.editSystemUserpwd(systemUser);
        String result=null;
        if (flag){
            result= "success";
        }else{
            result= "fail";
        }
        return result;
    }
}
