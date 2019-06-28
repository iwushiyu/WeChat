package com.wechat.service.Impl;

import com.wechat.dao.SystemUserAccountDAO;
import com.wechat.dao.SystemUserDAO;
import com.wechat.entity.SystemUser;
import com.wechat.entity.SystemUserAccount;
import com.wechat.service.SystemUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

@Service("systemUserService")
public class SystemUserServiceImpl implements SystemUserService {
    @Resource(name = "systemUserDAO")
    private SystemUserDAO systemUserDAO;
    @Resource(name = "systemUserAccountDAO")
    private SystemUserAccountDAO systemUserAccountDAO;
    @Override
    public List<SystemUser> allSystemUser(int accountId) {
        return systemUserDAO.allSystemUser(accountId);
    }
    @Override
    public  SystemUser selectSystemUserByUsername(SystemUser systemUser) {
        return systemUserDAO.check(systemUser);
    }

    @Override
    public boolean editSystemUserpwd(SystemUser systemUser) {
        int code=systemUserDAO.editSystemUserpwd(systemUser);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }

    @Override
    public SystemUser getSystemUserById(int userId) {
        return systemUserDAO.getSystemUserById(userId);
    }



    /*获取当前账号下所有公众号下的运营人员*/
    @Override
    public List<SystemUser> allSystemUserByUserId(int userId,int accountId) {

        List<Integer> userIdList=systemUserAccountDAO.allSystemUserIdById(userId);
        List<Integer> userIdList2=new ArrayList<>();
//        userIdList = new ArrayList<Integer>(new HashSet<>(userIdList));
        List<Integer> systemUserIdById=systemUserAccountDAO.systemUserIdByAccountId(accountId);
        for(int i = 0 ; i < userIdList.size() ; i++) {
            for (int j = 0 ; j < systemUserIdById.size() ; j++) {
                if (systemUserIdById.get(j)==userIdList.get(i)){
                    break;
                }else {
                    if (j==systemUserIdById.size()-1){
                        userIdList2.add(userIdList.get(i));
                    }
                }

            }
        }
        List<SystemUser> userList=new ArrayList<>();
        List<SystemUser> systemUserList=new ArrayList<>();
            for (int j = 0 ; j < userIdList2.size() ; j++) {
                SystemUser systemUser=systemUserDAO.getSystemUserById(userIdList2.get(j));
                if (systemUser!=null){
                    userList.add(systemUser);
                }
            }
        return userList;
    }
    @Override
    public SystemUser doLogin(String name, String pwd) {
        SystemUser systemUser = new SystemUser();
        systemUser.setUsername(name);
        systemUser.setPassword(pwd);
        return systemUserDAO.selectSystemUser(systemUser);
    }

    @Override
    public int addSystemUser(SystemUser systemUser) {
        int code=0;
        systemUserDAO.addSystemUser(systemUser);
        code=systemUser.getId();
        if (systemUser!=null){
            code=systemUser.getId();
        }
        return  code;
    }

    @Override
    public List<SystemUser> search(String username,int accountId) {
        return systemUserDAO.search(username,accountId);
    }
    @Override
    public List<SystemUser> searchAll(String username) {
        return systemUserDAO.searchAll(username);
    }
    @Override
    public boolean deleteSystemUser(SystemUser systemUser) {
        int code=systemUserDAO.deleteSystemUser(systemUser);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }

    @Override
    public boolean editSystemUser(SystemUser systemUser) {
        int code=systemUserDAO.editSystemUser(systemUser);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }
}
