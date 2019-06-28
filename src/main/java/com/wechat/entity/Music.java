package com.wechat.entity;

public class Music {
    /*
    * 音乐消息的音乐对象
    * */
    private  int id;
    private String title;
    private String description;
    private String musicUrl;
    private String hqMusicUrl;
    private String thumbmediaId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMusicUrl() {
        return musicUrl;
    }

    public void setMusicUrl(String musicUrl) {
        this.musicUrl = musicUrl;
    }

    public String getHqMusicUrl() {
        return hqMusicUrl;
    }

    public void setHqMusicUrl(String hqMusicUrl) {
        this.hqMusicUrl = hqMusicUrl;
    }

    public String getThumbmediaId() {
        return thumbmediaId;
    }

    public void setThumbmediaId(String thumbmediaId) {
        this.thumbmediaId = thumbmediaId;
    }
}
