import com.wechat.dao.AccountDAO;
import com.wechat.dao.SystemUserDAO;
import com.wechat.entity.Account;
import com.wechat.entity.SystemUser;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:ApplicationContext.xml","classpath:ApplicationContext-database.xml"})
public class SystemUserDAOTset {
    @Resource(name = "systemUserDAO")
    private SystemUserDAO dao;

    @Test
    public void findAll(){
        List<SystemUser> systemUsersList = dao.allSystemUser();
        for (SystemUser s:systemUsersList) {
            System.out.println(s.getUsername()+"\t\t"+s.getPassword());
        }
    }
    @Test
    public void login(){
        SystemUser systemUser=new SystemUser();
        systemUser.setUsername("wechat");
        systemUser.setPassword("wechat");
        SystemUser systemUsersList = dao.selectSystemUser(systemUser);
        System.out.println(systemUsersList.getUsername()+"\t\t"+systemUsersList.getPassword()+"\t\t"+systemUsersList.getPhone());

    }
}
