package com.wechat.dao;

import com.wechat.entity.Thumb;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("thumbDAO")
public interface ThumbDAO {
    public List<Thumb> selectAllThumbs(String accountName);
    public Thumb selectThumbByThumbID(Thumb thumb);
    public int addThumb(Thumb thumb);
    public int editThumb(Thumb thumb);
    public int deleteThumb(Thumb thumb);
}
