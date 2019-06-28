package com.wechat.entity;

public class VoiceMessage extends BaseMessage {
    /*
    * 语音对象
    * */
    private Voice voice;
   private int voiceID;
   private int baseID;

    public Voice getVoice() {
        return voice;
    }

    public void setVoice(Voice voice) {
        this.voice = voice;
    }

    public int getVoiceID() {
        return voiceID;
    }

    public void setVoiceID(int voiceID) {
        this.voiceID = voiceID;
    }

    public int getBaseID() {
        return baseID;
    }

    public void setBaseID(int baseID) {
        this.baseID = baseID;
    }
}
