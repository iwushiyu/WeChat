import com.wechat.dao.AccountDAO;
import com.wechat.entity.Account;
import com.wechat.service.Impl.AccountServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:ApplicationContext.xml","classpath:ApplicationContext-database.xml"})
public class AccountServiceTset {
    @Resource(name = "accountService")
    private AccountServiceImpl accountService;

    @Test
    public void find(){
        Account acc=new Account();
        acc.setName("ligang");
       Account account = accountService.selectAccount(acc);
       System.out.println(account.toString());
    }
}
