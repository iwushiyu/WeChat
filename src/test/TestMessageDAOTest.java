import com.wechat.dao.TextMessageDAO;
import com.wechat.entity.BaseMessage;
import com.wechat.entity.TextMessage;
import com.wechat.service.Impl.BaseMessageServiceImpl;
import com.wechat.service.Impl.TextMessageServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:ApplicationContext.xml","classpath:ApplicationContext-database.xml"})
public class TestMessageDAOTest {
    @Resource(name = "textMessageDAO")
    private TextMessageDAO textMessageDAO;
    @Resource(name = "baseMessageService")
    private BaseMessageServiceImpl baseMessageService;

    @Test
    public void addTextMessage(){
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setAccount("ceshi");
        baseMessage.setInputCode("amnb");
        baseMessage.setMsgType("text");
        baseMessage.setCreateTime(new Date().getTime());
       boolean flag= baseMessageService.addBaseMessage(baseMessage);
        baseMessage=baseMessageService.selectBaseMessage(baseMessage);
                TextMessage textMessage=new TextMessage();
                textMessage.setbaseID(baseMessage.getId());
                textMessage.setContent("cont222222222222222nt");
                textMessage.setTitle("content");
                textMessageDAO.addTextMessage(textMessage);
         System.out.println(flag);


    }

}
