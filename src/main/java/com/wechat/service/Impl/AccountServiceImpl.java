package com.wechat.service.Impl;

import com.wechat.dao.AccountDAO;
import com.wechat.entity.Account;
import com.wechat.service.AccountService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("accountService")
public class AccountServiceImpl implements AccountService {
    @Resource(name = "accountDAO")
    private AccountDAO accountDAO;
    @Override
    public List<Account> allAccount(String username) {
        return accountDAO.allAccount(username);
    }
    public List<Account> all( ) {
        return accountDAO.all();
    }
    @Override
    public Account getByName(String accountName){
        return accountDAO.getByName(accountName);
    }
    @Override
    public int addAccount(Account account) {
        int code=0;
        try {
            accountDAO.addAccount(account);
            code=account.getId();
        }catch (Exception e){
            code=-1;
        }finally {
        }
        return  code;
    }

    @Override
    public Account selectAccount(String accountName) {
        return accountDAO.selectAccount(accountName);
    }

    @Override
    public Account selectAccountByAccount(String account) {
        return accountDAO.selectAccountByAccount(account);
    }

    @Override
    public boolean editAccount(Account account) {
        int code=accountDAO.editAccount(account);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return flag;
    }

    @Override
    public boolean deleteAccount(Account account) {
        int code=accountDAO.deleteAccount(account);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return flag;
    }
}
