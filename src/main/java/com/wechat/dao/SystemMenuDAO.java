package com.wechat.dao;

import com.wechat.entity.Role;
import com.wechat.entity.SystemMenu;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("systemMenuDAO")
public interface SystemMenuDAO {
    public List<SystemMenu> selectSystemMenu(Role role);
    public int addSystemMenu(SystemMenu systemMenu);
}
