package com.wechat.entity;

public class Role {
    private int id;
    private String roleName;
    private String roleDescribe;
    private long crrateTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleDescribe() {
        return roleDescribe;
    }

    public void setRoleDescribe(String roleDescribe) {
        this.roleDescribe = roleDescribe;
    }

    public long getCrrateTime() {
        return crrateTime;
    }

    public void setCrrateTime(long crrateTime) {
        this.crrateTime = crrateTime;
    }
}
