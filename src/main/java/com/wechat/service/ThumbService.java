package com.wechat.service;

import com.wechat.entity.Thumb;
import java.util.List;


public interface ThumbService {
    public List<Thumb> selectAllThumbs(String accountName);
    public Thumb selectThumbByThumbID(Thumb thumb);
    public int addThumb(Thumb thumb);
    public boolean editThumb(Thumb thumb);
    public boolean deleteThumb(Thumb thumb);
}
