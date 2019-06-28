package com.wechat.dao;

import com.wechat.entity.SystemUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("systemUserDAO")
public interface SystemUserDAO {
    public List<SystemUser> allSystemUser(int accountId);
    public SystemUser selectSystemUser(SystemUser systemUser);
    public SystemUser getSystemUserById(int userId);
    public int addSystemUser(SystemUser systemUser);
    public int deleteSystemUser(SystemUser systemUser);
    public int editSystemUser(SystemUser systemUser);
    public int editSystemUserpwd(SystemUser systemUser);
    public List<SystemUser> search(@Param("username")String username, @Param("accountId") int accountId);
    public List<SystemUser> searchAll(String username);
    public  SystemUser check(SystemUser systemUser);

}
