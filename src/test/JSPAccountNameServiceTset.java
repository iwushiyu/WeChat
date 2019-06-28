import com.wechat.entity.Account;
import com.wechat.service.Impl.AccountServiceImpl;
import com.wechat.service.Impl.JSPAccountServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:ApplicationContext.xml","classpath:ApplicationContext-database.xml"})
public class jspAccountNameServiceTset {
    @Resource(name = "jspAccountService")
    private JSPAccountServiceImpl jspAccountService;

    @Test
    public void find(){
      String jspAccountName="ceshi";
       System.out.println(jspAccountService.select());
    }
    @Test
    public void update(){
        String jspAccountName="ceshi";
        jspAccountService.edit(jspAccountName);
    }
}
