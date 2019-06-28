package com.wechat.controller;

import com.alibaba.fastjson.JSONArray;
import net.sf.json.JSONObject;
import com.wechat.entity.*;
import com.wechat.service.Impl.*;
import com.wechat.util.CheckUtil;
import com.wechat.util.MessageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@SessionAttributes(value = {"systemUserSession","systemUserRole","accountSession","num","accountName","systemMenuList"})
@RequestMapping("/Account")
public class AccountController {
    @Resource(name = "accountService")
    private AccountServiceImpl accountService;
    @Resource(name = "systemUserAccountService")
    private SystemUserAccountServiceImpl systemUserAccountService;
    @Resource(name = "systemUserService")
    private SystemUserServiceImpl systemUserService;

    /*
     * 修改Session中的accountName*/
    @RequestMapping(value = "/changeAccountName")
    @ResponseBody
    public String changeAccountName(String accountName,Model model){
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
        return accountShow;
    }

    /*
     * 添加公众号信息
     * */
    @RequestMapping(value = "/addAccount",method = RequestMethod.POST)
    @ResponseBody
    public Object addAccount(@RequestParam(value = "name") String name,
                                @RequestParam(value = "account")String account,
                                @RequestParam(value = "appid")String appid,
                                @RequestParam(value = "appsecret")String appsecret,
                                HttpSession session,Model model){
        Account account1=new Account();
        account1= accountService.selectAccount(name);
        JSONObject jsonObject=new JSONObject();
        String errcode="0";
        if (account1==null){
            Account acc=new Account();
            String token=CheckUtil.getRandomString(15);
            String url=MessageUtil.HttpURL+"/WeChat/validate";
            appid=appid.replace(" ", "");
            appsecret=appsecret.replace(" ", "");
            acc.setName(name);
            acc.setAccount(account);
            acc.setUrl(url);
            acc.setToken(token);
            acc.setAppid(appid);
            acc.setAppsecret(appsecret);
            acc.setCreateTime(new Date().getTime());
            int code= accountService.addAccount(acc);
            if (code>0){
                SystemUserAccount systemUserAccount=new SystemUserAccount();
                systemUserAccount.setAccountId(acc.getId());
                SystemUser systemUser=(SystemUser) session.getAttribute("systemUserSession");
                systemUserAccount.setUserId(systemUser.getId());
                code=systemUserAccountService.addSystemUserAccount(systemUserAccount);
                if (code>0){
                    jsonObject.put("accResult",acc );
                    List<Account> accountList=new ArrayList<Account>();
                    accountList=accountService.allAccount(systemUser.getUsername());
                    model.addAttribute("accountSession",JSONArray.toJSONString(accountList));
                    model.addAttribute("num",accountList.size());
//                JSONObject.parse(JSONArray.toJSONString(acc))
                }else{
                    errcode="连接数据库错误！";
                }
            }else{
                errcode="添加失败！";
            }
        }else {
            errcode="公众号名字已经存在！";
        }
        jsonObject.put("errcode", errcode);
        return jsonObject;
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
                              HttpSession session,
                              Model model){
        Account acc=new Account();
        acc.setName(name);
        acc.setAccount(account);
        acc.setUrl(url);
        acc.setToken(token);
        acc.setAppid(appid);
        acc.setAppsecret(appsecret);
        accountService.editAccount(acc);
        List<Account> accountList=new ArrayList<Account>();
        SystemUser systemUser=(SystemUser) session.getAttribute("systemUserSession");
        accountList=accountService.allAccount(systemUser.getUsername());
        model.addAttribute("accountSession",JSONArray.toJSONString(accountList));
        model.addAttribute("num",accountList.size());
        return acc;
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
        acc=accountService.selectAccount(accountName);
        boolean flag=accountService.deleteAccount(acc);
        if (flag){
            SystemUserAccount systemUserAccount=new SystemUserAccount();
            systemUserAccount.setAccountId(acc.getId());
            flag=systemUserAccountService.deleteByAccountId(acc.getId());
            if (flag){
                List<Account> accountList=new ArrayList<Account>();
                SystemUser systemUser=(SystemUser) session.getAttribute("systemUserSession");
                accountList=accountService.allAccount(systemUser.getUsername());
                if (accountList.size()==0){
                    model.addAttribute("accountName","没有可管理的公众号");
                }else {
                    accountName=accountList.get(0).getName();
                    model.addAttribute("accountName",accountName);
                }
                model.addAttribute("accountSession",JSONArray.toJSONString(accountList));
                model.addAttribute("num",accountList.size());
                result="success";
            }else{
                result="fail";
            }
        }else{
            result="fail";
        }
        return result;
    }

}
