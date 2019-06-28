import com.wechat.dao.AccountDAO;
import com.wechat.dao.BaseMessageDAO;
import com.wechat.entity.Account;
import com.wechat.entity.BaseMessage;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:ApplicationContext.xml","classpath:ApplicationContext-database.xml"})
public class BaseDAO {
    @Resource(name = "baseMessageDAO")
    private BaseMessageDAO dao;

    @Test
    public void findAll(){
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setAccount("ceshi");
        baseMessage.setMsgType("text");
        List<BaseMessage> accountList = dao.getByMsgType(baseMessage);
        for (BaseMessage s:accountList) {
            System.out.println(s.getAccount());
        }
    }
}
