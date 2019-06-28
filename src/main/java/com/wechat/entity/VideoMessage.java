package com.wechat.entity;

public class VideoMessage extends BaseMessage{
    /*
    * 视频消息
    * */
    private Video video;
    private int videoID;
    private int baseID;

    public int getBaseID() {
        return baseID;
    }

    public void setBaseID(int baseID) {
        this.baseID = baseID;
    }

    public int getVideoID() {
        return videoID;
    }

    public void setVideoID(int videoID) {
        this.videoID = videoID;
    }

    public Video getVideo() {
        return video;
    }

    public void setVideo(Video video) {
        this.video = video;
    }

    @Override
    public String toString() {
        return "VideoMessage{" +
                "video=" + video +
                ", videoID=" + videoID +
                ", baseID=" + baseID +
                '}';
    }
}
