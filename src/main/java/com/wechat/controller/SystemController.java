package com.wechat.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.wechat.entity.Account;
import com.wechat.entity.Role;
import com.wechat.entity.SystemMenu;
import com.wechat.entity.SystemUser;
import com.wechat.service.Impl.*;
import org.apache.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@SessionAttributes(value = {"systemUserSession","systemUserRole","accountSession","accountNum","accountName","systemMenuList"})
@RequestMapping("/System")
public class SystemController {
    @Resource(name = "systemUserService")
    private SystemUserServiceImpl systemUserService;
    @Resource(name = "accountService")
    private AccountServiceImpl accountService;
    @Resource(name = "roleService")
    private RoleServiceImpl roleService;
    @Resource(name = "systemMenuService")
    private SystemMenuServiceImpl systemMenuService;
    /*
    * 登录
    * 已使用
    * */
    @RequestMapping(value = "/login" ,method = RequestMethod.POST)
    public String getSystemUser(@RequestParam(value = "username") String username,
                                @RequestParam(value = "password") String password,
                                Model model, HttpServletRequest request){
        SystemUser systUser=systemUserService.doLogin(username,password);
        if (systUser!=null){
            Role role=new Role();
            List<SystemMenu> systemMenuList= new ArrayList<>();
            role=roleService.selectRole(systUser);
            systemMenuList=systemMenuService.selectSystemMenu(role);
            model.addAttribute("systemMenuList",JSONArray.toJSONString(systemMenuList));

            List<Account> accountList=new ArrayList<Account>();
            accountList=accountService.allAccount(username);
            if (accountList.size()==0){
//                model.addAttribute("accountName","m没有可管理的公众号");
            }else {
                String accountName=null;
                accountName=accountList.get(0).getName();
                model.addAttribute("accountName",accountName);
            }
            model.addAttribute("systemUserSession",systUser);
            model.addAttribute("systemUserRole",JSONArray.toJSONString(role));
            model.addAttribute("accountSession",JSONArray.toJSONString(accountList));
            model.addAttribute("accountNum",accountList.size());
            return "index";
        }else{
            return "login";
        }
    }
    /*
    * 注销
    * */
    @RequestMapping("/logout")
    public String outSystemUser(SessionStatus status){
       status.setComplete();
       return "login";
    }
    /*
    * 跳转至菜单管理界面*/
    @RequestMapping("/showMenu")
    public String showMenu( ){
        return "menu";
    }
/*
* 注册系统用户
* 已使用
* */
    @RequestMapping(value = "/regist")
    @ResponseBody
    public int addSystemUser(@RequestBody SystemUser systemUser, Model model){
        int code=0;
        systemUser.setRoleID(1);
        systemUser.setCreateTime(new Date().getTime());
       code=systemUserService.addSystemUser(systemUser);
        return code;
    }
    /*
     * 验证注册系统用户时用户名是否已经存在
     * 已使用
     * */
    @RequestMapping(value = "/checkUser")
    @ResponseBody
    public String checkUser(@RequestParam(value = "username") String username,
                                Model model){
        SystemUser systemUser=new SystemUser();
        systemUser.setUsername(username);
        systemUser=systemUserService.selectSystemUserByUsername(systemUser);
        if (systemUser!=null){
            return "fail";
        }else{
            return "success";
        }
    }
    /*
    * 获取公众号名字*/
    @RequestMapping(value = "/getaccountName")
    @ResponseBody
    public String addSystemUser(String accountName,Model model){
        model.addAttribute("accountName",accountName);
        return "index";
    }
    /*
     * 显示所有公众号
     * */
    @RequestMapping(value = "/showAccount",method = RequestMethod.POST)
    @ResponseBody
    public Object showAccount(HttpSession session){
        String accountName= (String) session.getAttribute("accountName");
        Account accountShow=new Account();
        accountShow.setName(accountName);
        accountShow=accountService.selectAccount(accountName);
        System.out.println(accountShow.toString());
        return JSONObject.parse(JSONArray.toJSONString(accountShow));
    }
    /*
     * 修改公众号信息
     * */
    @RequestMapping(value = "/editAccount",method = RequestMethod.POST)
    @ResponseBody
    public Object editAccount(@RequestParam(value = "name") String name,
                        @RequestParam(value = "account")String account,
                        @RequestParam(value = "appid")String appid,
                        @RequestParam(value = "appsecret")String appsecret,
                        @RequestParam(value = "url")String url,
                        @RequestParam(value = "token")String token,
                        Model model){
        Account acc=new Account();
        acc.setName(name);
        acc.setAccount(account);
        acc.setUrl(url);
        acc.setToken(token);
//        appid=appid.replace(" ", "");
//        appsecret=appsecret.replace(" ", "");
        acc.setAppid(appid);
        acc.setAppsecret(appsecret);
        accountService.editAccount(acc);
        return JSONObject.parse(JSONArray.toJSONString(acc));
    }
    /*
     * 删除公众号信息
     * */
    @RequestMapping(value = "/deleteAccount",method = RequestMethod.POST)
    @ResponseBody
    public Object deleteAccount(@RequestParam(value = "name") String name,
                        @RequestParam(value = "account")String account,
                        @RequestParam(value = "appid")String appid,
                        @RequestParam(value = "appsecret")String appsecret,
                        @RequestParam(value = "url")String url,
                        @RequestParam(value = "token")String token,
                        HttpSession session,
                        Model model){
        Account acc=new Account();
        acc.setName(name);
        acc.setAccount(account);
        acc.setUrl(url);
        acc.setToken(token);
        acc.setAppid(appid);
        acc.setAppsecret(appsecret);
        String accountName= (String) session.getAttribute("accountName");
        String result=null;
        boolean flag=accountService.deleteAccount(acc);
        if (flag){
            result="success";
        }else{
            result="fail";
        }
        return result;
    }

/*
* 平台内容主页面
* */
    @RequestMapping(value = "/main")
    public String main() {
        return "main";
    }
    @RequestMapping(value = "/accountInformation")
    public String accountInformation() {
        return "accountNow";
    }
}
