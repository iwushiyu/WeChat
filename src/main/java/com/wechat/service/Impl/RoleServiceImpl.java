package com.wechat.service.Impl;

import com.wechat.dao.RoleDAO;
import com.wechat.dao.SystemMenuDAO;
import com.wechat.entity.Role;
import com.wechat.entity.SystemMenu;
import com.wechat.entity.SystemUser;
import com.wechat.service.RoleService;
import com.wechat.service.SystemMenuService;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
@Repository("roleService")
public class RoleServiceImpl implements RoleService {
    @Resource(name = "roleDAO")
    private RoleDAO roleDAO;

    @Override
    public Role selectRole(SystemUser systemUser) {
        return roleDAO.selectRole(systemUser);
    }

//    @Override
//    public boolean addSystemMenu(SystemMenu systemMenu) {
//        int code=systemMenuDAO.addSystemMenu(systemMenu);
//        boolean flag=false;
//        if (code>0){
//            flag=true;
//        }
//        return  flag;
//    }

}
