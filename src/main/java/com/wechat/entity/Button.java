package com.wechat.entity;

public class Button {
    /*
    * 菜单按钮的公共属性类
    * */
    private  String type;
    private  String name;
    private Button[] subButton;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Button[] getSubButton() {
        return subButton;
    }

    public void setSubButton(Button[] subButton) {
        this.subButton = subButton;
    }
}
