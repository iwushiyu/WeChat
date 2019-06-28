package com.wechat.dao;

import com.wechat.entity.Account;
import com.wechat.entity.SystemUserAccount;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("accountDAO")
public interface AccountDAO {
    public List<Account> allAccount(String username);
    public List<Account> all();
    public int addAccount (Account account);
    public int editAccount (Account account);
    public int deleteAccount (Account account);
    public Account selectAccount(String accountName);
    public Account selectAccountByAccount(String account);
    public Account getByName(String accountName);
}
