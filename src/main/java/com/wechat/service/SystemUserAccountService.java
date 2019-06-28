package com.wechat.service;

import com.wechat.entity.SystemUserAccount;

import java.util.List;

public interface SystemUserAccountService {
    public int addSystemUserAccount(SystemUserAccount systemUserAccount);
    public boolean deleteSystemUserAccount(SystemUserAccount systemUserAccount);
//    public boolean deleteByUserId(int userId);
    public boolean deleteByAccountId(int addountId);
    public List<Integer> accountIdByUserId(int userId);
}
