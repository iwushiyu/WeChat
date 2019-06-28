package com.wechat.service;

import com.wechat.entity.Account;
import org.springframework.stereotype.Service;

import java.util.List;

public interface AccountService {
    public List<Account> allAccount(String username);
    public List<Account> all();
    public int addAccount (Account account);
    public Account selectAccount(String accountName);
    public Account selectAccountByAccount(String account);
    public boolean editAccount (Account account);
    public boolean deleteAccount (Account account);
    public Account getByName(String accountName);
}
