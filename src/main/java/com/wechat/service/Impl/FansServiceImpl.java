package com.wechat.service.Impl;

import com.wechat.dao.FansDAO;
import com.wechat.entity.Account;
import com.wechat.entity.Fans;
import com.wechat.service.FansService;
import com.wechat.util.WeixinUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("fansService")
public class FansServiceImpl implements FansService {
    @Resource(name = "fansDAO")
    private FansDAO fansDAO;
    @Override
    public boolean addFans(Fans fans) {
        int code= fansDAO.addFans(fans);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return flag;
    }
    @Override
    public Fans syncAccountFans(String openId, Account account){
        Fans fans = WeixinUtil.syncAccountFans(openId, account);
        if (null != fans) {
            Fans tmpFans = fansDAO.getByOpenId(openId);
            if (tmpFans == null) {
                fansDAO.add(fans);
            } else {
                fansDAO.update(fans);
            }
        }
        return fans;
    }

    @Override
    public List<Fans> search(Fans fans) {
        return fansDAO.search(fans);
    }

    @Override
    public Fans selectFans(Fans fans) {
        return fansDAO.selectFans(fans);
    }

    @Override
    public List<Fans> allFnas(String accountName) {
        return fansDAO.allFnas(accountName);
    }

    @Override
    public boolean deleteFans(Fans fans) {
       int code= fansDAO.deleteFans(fans);
        boolean flag=false;
       if (code>0){
           flag=true;
       }
        return flag;
    }

    @Override
    public boolean updateFnas(Fans fans) {
       int code=fansDAO.updateFans(fans);
        boolean flag=false;
        if (code>0){
            flag=true;
        }
        return flag;
    }
}
