package com.wechat.dao;


import com.wechat.entity.SystemUserAccount;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("systemUserAccountDAO")
public interface SystemUserAccountDAO {

    public int addSystemUserAccount(SystemUserAccount systemUserAccount);
    public int deleteByUserId(int userId);
    public int deleteSystemUserAccount(SystemUserAccount systemUserAccount);
    public int deleteByAccountId(int addountId);
    public List<Integer> allSystemUserIdById(int userId);
    public List<Integer> systemUserIdByAccountId(int accountId);
    public List<Integer> accountIdByUserId(int userId);




}
