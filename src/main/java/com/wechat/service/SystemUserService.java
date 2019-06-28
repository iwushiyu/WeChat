package com.wechat.service;

import com.wechat.entity.SystemUser;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


public interface SystemUserService {
    public List<SystemUser> allSystemUser(int accountId);
    public SystemUser doLogin(String name,String pwd);
    public int addSystemUser(SystemUser systemUser);
    public List<SystemUser> search(String username,int accountId);
    public List<SystemUser> searchAll(String username);
    public boolean deleteSystemUser(SystemUser systemUser);
    public boolean editSystemUser(SystemUser systemUser);
    public  SystemUser selectSystemUserByUsername(SystemUser systemUser);
    public boolean editSystemUserpwd(SystemUser systemUser);
    public SystemUser getSystemUserById(int userId);
    public List<SystemUser> allSystemUserByUserId(int  userId,int accountId);
}
