package com.wechat.service;

import com.wechat.entity.Role;

import com.wechat.entity.SystemUser;

public interface RoleService {
    public Role selectRole(SystemUser systemUser);
//    public boolean addRole(SystemMenu systemMenu);
}
