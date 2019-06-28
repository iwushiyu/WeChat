package com.wechat.service;

import com.wechat.entity.Account;
import com.wechat.entity.Fans;
import org.springframework.stereotype.Service;

import java.util.List;

public interface FansService {
    public boolean addFans(Fans fans);
    public List<Fans> search(Fans fans);
    public Fans selectFans(Fans fans);
    public List<Fans> allFnas(String accountName);
    public boolean deleteFans(Fans fans);
    public boolean updateFnas(Fans fans);
    public Fans syncAccountFans(String openId, Account account);
}
