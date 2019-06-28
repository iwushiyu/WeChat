package com.wechat.dao;

import com.wechat.entity.JSPAccountName;
import org.springframework.stereotype.Repository;

@Repository("jspAccountNameDAO")
public interface JSPAccountNameDAO {
    public int edit(String jspAccountName);
    public int add(String jspAccountName);
    public int delete(String jspAccountName);
    public JSPAccountName select();
}
