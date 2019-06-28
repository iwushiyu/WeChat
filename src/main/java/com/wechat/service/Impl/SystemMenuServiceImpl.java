package com.wechat.service.Impl;

import com.wechat.dao.SystemMenuDAO;
import com.wechat.entity.Role;
import com.wechat.entity.SystemMenu;
import com.wechat.service.SystemMenuService;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;
@Repository("systemMenuService")
public class SystemMenuServiceImpl implements SystemMenuService {
    @Resource(name = "systemMenuDAO")
    private SystemMenuDAO systemMenuDAO;
    @Override
    public List<SystemMenu> selectSystemMenu(Role role) {
        return systemMenuDAO.selectSystemMenu(role);
    }

    @Override
    public boolean addSystemMenu(SystemMenu systemMenu) {
        int code=systemMenuDAO.addSystemMenu(systemMenu);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return  flag;
    }

}
