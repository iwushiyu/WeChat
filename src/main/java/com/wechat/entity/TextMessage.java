package com.wechat.entity;

import javax.xml.crypto.Data;

public class TextMessage extends BaseMessage {
    /*
    * 文本消息
    * */
    private int id;
    private String content;
    private String title;
    private int baseID;//消息主表id

    @Override
    public int getId() {
        return id;
    }

    @Override
    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getBaseID() {
        return baseID;
    }

    public void setBaseID(int baseID) {
        this.baseID = baseID;
    }
}
