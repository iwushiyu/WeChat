package com.wechat.dao;

import com.wechat.entity.Role;
import com.wechat.entity.SystemMenu;
import com.wechat.entity.SystemUser;
import org.springframework.stereotype.Repository;

@Repository("roleDAO")
public interface RoleDAO {
    public Role selectRole(SystemUser systemUser);
//    public int addSystemMenu(SystemMenu systemMenu);
}
