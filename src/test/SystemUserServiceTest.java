import com.wechat.entity.SystemUser;
import com.wechat.service.Impl.SystemUserServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:ApplicationContext.xml","classpath:ApplicationContext-database.xml"})
public class SystemUserServiceTest {

    @Resource(name = "systemUserService")
    private SystemUserServiceImpl service;

    @Test
    public void findAll(){
        List<SystemUser> systemUsersList = service.allSystemUser();
        for (SystemUser s:systemUsersList) {
            System.out.println(s.getUsername()+"\t\t"+s.getPassword());
        }
    }

    @Test
    public void add(){
        SystemUser systemUser=new SystemUser();
        systemUser.setUsername("123qwe");
        systemUser.setPassword("123456");
        boolean code=service.addSystemUser(systemUser);
        System.out.println(code);
    }


    @Test
    public void login(){
            System.out.println(service.doLogin("wechat","wechat"));
    }

}
