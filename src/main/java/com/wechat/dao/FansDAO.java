package com.wechat.dao;

import com.wechat.entity.Fans;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("fansDAO")
public interface FansDAO {
    public int addFans(Fans fans);
    public List<Fans> search(Fans fans);
    public Fans selectFans(Fans fans);
    public List<Fans> allFnas(String account);
    public int deleteFans(Fans fans);
    public int updateFans(Fans fans);
    public int add(Fans fans);
    public Fans getByOpenId(String openId);
    public int update(Fans fans);

}