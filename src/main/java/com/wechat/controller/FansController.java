package com.wechat.controller;

import com.wechat.entity.*;
import com.wechat.service.Impl.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/Fans")
public class FansController {
    @Resource(name = "fansService")
    private FansServiceImpl fansService;
    @Resource(name = "accountService")
    private AccountServiceImpl accountService;
    /*
     * 显示文本消息
     * */
    @RequestMapping(value = "/list")
    public String list() {
        return "fans";
    }

    @RequestMapping(value = "/syncAccountFans")
    @ResponseBody
    public boolean syncAccountFans(@RequestParam("openId")String openId,HttpSession session)  {
        String accountName= (String) session.getAttribute("accountName");
        Account account=accountService.getByName(accountName);
        boolean flag=false;

        if (account != null) {
            Fans fans = fansService.syncAccountFans(openId, account);//同时更新数据库
            if (fans != null) {
                flag=true;
            }
        }
        return flag;
    }


    @RequestMapping(value = "/fansData")
    @ResponseBody
    public LayuiResult<Fans> listData(String keyword, Integer page, Integer limit,HttpSession session) {
        LayuiResult<Fans> result = new LayuiResult<Fans>();
        Fans fans = new Fans();
        List<Fans> list =new ArrayList<>();
        String accountName= (String) session.getAttribute("accountName");
        System.out.println(accountName);
        if (keyword==null||keyword.length()==0){
            list = fansService.allFnas(accountName);
        }else{
            fans.setAccount(accountName);
            fans.setNickName(keyword);
            list =fansService.search(fans);
        }
        for (Fans t:list){
            System.out.println(t.getAccount()+"\t\t"+t.getNickName()+"\t\t"+t.getSex()+"\t\t"+t.getCity());
        }
        List<Fans> list1 = new ArrayList<Fans>();
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
        result.setData(list1);
        result.setCount(list.size());//显示共有多少条数据
        return result;
    }

}
