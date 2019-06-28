package com.wechat.service.Impl;

import com.wechat.dao.JSPAccountNameDAO;
import com.wechat.entity.Account;
import com.wechat.entity.JSPAccountName;
import com.wechat.service.JSPAccountService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("jspAccountService")
public class JSPAccountServiceImpl implements JSPAccountService {
@Resource(name = "jspAccountNameDAO")
private JSPAccountNameDAO jspAccountNameDAO;
    @Resource(name = "accountService")
    private AccountServiceImpl accountService;
    @Override
    public boolean edit(String jspAccountName) {
        int code=jspAccountNameDAO.edit(jspAccountName);
        System.out.println(code);
        boolean flag=false;
        if (code>0){
            flag=true;
        }else{
            jspAccountNameDAO.add(jspAccountName);
        }
        return  flag;
    }

    @Override
    public boolean delete(String jspAccountName) {
        int code= jspAccountNameDAO.delete(jspAccountName);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }

    @Override
    public String select() {
        JSPAccountName jspAccountName=new JSPAccountName();
        jspAccountName=jspAccountNameDAO.select();
        String name=null;
        if (jspAccountName==null){
            List<Account> accountList=accountService.allAccount(jspAccountName.getAccountName());
            name=accountList.get(0).getName();
        }else{
            name=jspAccountName.getAccountName();
        }
        return name;
    }
}
