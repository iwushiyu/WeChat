package com.wechat.entity;

public class SystemMenu {
    private int id;
    private String menuName;
    private int fatherID;
    private String menuDescribe;
    private String childCatalog;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public int getFatherID() {
        return fatherID;
    }

    public void setFatherID(int fatherID) {
        this.fatherID = fatherID;
    }

    public String getMenuDescribe() {
        return menuDescribe;
    }

    public void setMenuDescribe(String menuDescribe) {
        this.menuDescribe = menuDescribe;
    }

    public String getChildCatalog() {
        return childCatalog;
    }

    public void setChildCatalog(String childCatalog) {
        this.childCatalog = childCatalog;
    }
}
