package com.wechat.entity;

public class MusicMessage extends BaseMessage {
    /*
    * 音乐消息
    * */
    private  Music music;
private int musicID;
private int baseID;

    public Music getMusic() {
        return music;
    }

    public void setMusic(Music music) {
        this.music = music;
    }

    public int getMusicID() {
        return musicID;
    }

    public void setMusicID(int musicID) {
        this.musicID = musicID;
    }

    public int getBaseID() {
        return baseID;
    }

    public void setBaseID(int baseID) {
        this.baseID = baseID;
    }
}
