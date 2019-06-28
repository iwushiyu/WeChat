import com.wechat.dao.AccountDAO;
import com.wechat.entity.Account;
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
public class TestMessageTest {
    @Resource(name = "textMessageService")
    private TextMessageServiceImpl textMessageService;
    @Resource(name = "baseMessageService")
    private BaseMessageServiceImpl baseMessageService;
    @Test
    public void findAll(){
//        BaseMessage baseMessage=new BaseMessage();
//        baseMessage.setInputCode("1");
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setAccount("ceshi");
        baseMessage.setInputCode("2");
        baseMessage=baseMessageService.getByInputCode(baseMessage);
        TextMessage textMessage=textMessageService.selectTextMessage(baseMessage);
        if(textMessage!=null){
            System.out.println(textMessage.getContent()+"\t\t"+textMessage.getInputCode());
        }else{
            System.out.println("kong");
        }
    }
    @Test
    public void findByMsgType(){
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setAccount("ceshi");
        baseMessage.setMsgType("text");
        List<BaseMessage> baseMessageList=baseMessageService.getByMsgType(baseMessage);
        List<TextMessage> textMessageList=new ArrayList<TextMessage>();
        if (baseMessageList!=null){
            for(BaseMessage b:baseMessageList){
                TextMessage textMessage=textMessageService.selectTextMessage(b);
                textMessage.setInputCode(b.getInputCode());
                textMessageList.add(textMessage);
            }
            for(TextMessage t:textMessageList){
                System.out.println(t.getInputCode());
                System.out.println(t.getTitle());
                System.out.println(t.getContent());
                System.out.println(t.getBaseID());
                System.out.println("##############");
            }
        }
    }
    @Test
    public void addTextMessage(){
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setAccount("ceshi");
        baseMessage.setInputCode("amnb");
        baseMessage.setMsgType("text");
        baseMessage.setCreateTime(new Date().getTime());
        TextMessage textMessage=new TextMessage();
        textMessage.setContent("content");
        textMessage.setTitle("content");
         textMessageService.addTextMessage(textMessage);
    }
    @Test
    public void search(){
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setAccount("ceshi");
        baseMessage.setInputCode("21");
        baseMessage.setMsgType("text");
        baseMessage.setCreateTime(new Date().getTime());
        TextMessage textMessage=new TextMessage();
        textMessage.setContent("content");
        textMessage.setTitle("content");
        textMessageService.addTextMessage(textMessage);
    }

    @Test
    public void delete(){
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setInputCode("25");
        baseMessage.setMsgType("text");
        TextMessage textMessage=new TextMessage();
        textMessage.setContent("content");
        textMessage.setTitle("content");
        textMessageService.addTextMessage(textMessage);
    }
}
