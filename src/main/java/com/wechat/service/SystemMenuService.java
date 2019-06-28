package com.wechat.service;

import com.wechat.entity.Role;
import com.wechat.entity.SystemMenu;

import java.util.List;

public interface SystemMenuService {
    public List<SystemMenu> selectSystemMenu(Role role);
    public boolean addSystemMenu(SystemMenu systemMenu);
}
