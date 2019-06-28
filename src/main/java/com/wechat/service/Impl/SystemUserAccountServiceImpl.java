package com.wechat.service.Impl;

import com.wechat.dao.SystemUserAccountDAO;
import com.wechat.entity.SystemUserAccount;
import com.wechat.service.SystemUserAccountService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

@Service("systemUserAccountService")
public class SystemUserAccountServiceImpl implements SystemUserAccountService {
    @Resource(name = "systemUserAccountDAO")
    private SystemUserAccountDAO systemUserAccountDAO;

    @Override
    public int addSystemUserAccount(SystemUserAccount systemUserAccount) {
        int code=0;
        try {
            systemUserAccountDAO.addSystemUserAccount(systemUserAccount);
            code=systemUserAccount.getId();
        }catch (Exception e){
            code=-1;
        }finally {
        }
        return  code;
    }

    @Override
    public boolean deleteSystemUserAccount(SystemUserAccount systemUserAccount) {
        int code=0;
        boolean flag=false;
        try {
            code=systemUserAccountDAO.deleteSystemUserAccount(systemUserAccount);
        }catch (Exception e){
            code=-1;
        }finally {
        }
        if (code>-1){
            flag=true;
        }
        return  flag;
    }
    @Override
    public boolean deleteByAccountId(int addountId) {
        int code=0;
        boolean flag=false;
        try {
            code=systemUserAccountDAO.deleteByAccountId(addountId);
        }catch (Exception e){
            code=-1;
        }finally {
        }
        if (code>-1){
            flag=true;
        }
        return  flag;
    }

    @Override
    public List<Integer> accountIdByUserId(int userId) {
        return systemUserAccountDAO.accountIdByUserId(userId);
    }
}
