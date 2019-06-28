import com.wechat.dao.AccountDAO;
import com.wechat.entity.Account;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:ApplicationContext.xml","classpath:ApplicationContext-database.xml"})
public class AccountTset {
    @Resource(name = "accountDAO")
    private AccountDAO dao;

    @Test
    public void findAll(){
        List<Account> accountList = dao.all();
        for (Account s:accountList) {
            System.out.println(s.getName()+"\t\t"+s.getAccount());
        }
    }
    @Test
    public void add( ){
        Account acc=new Account();
        acc.setName("name");
        acc.setAccount("account");
        acc.setUrl("url");
        acc.setToken("token");
        acc.setAppid("appid");
        acc.setAppsecret("appsecret");
//        acc.setMsg_count(5);
        acc.setCreateTime(new Date().getTime());
        dao.addAccount(acc);
    }
}
