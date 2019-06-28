import com.wechat.entity.BaseMessage;
import com.wechat.entity.image;
import com.wechat.service.Impl.BaseMessageServiceImpl;
import com.wechat.service.Impl.imagesMessageServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:ApplicationContext.xml","classpath:ApplicationContext-database.xml"})
public class BaseMessageTest {
    @Resource(name = "baseMessageService")
    private BaseMessageServiceImpl baseMessageService;

    @Test
    public void findAll(){
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setAccount("ceshi");
        baseMessage.setInputCode("5");
        baseMessage=baseMessageService.getByInputCode(baseMessage);
        if(baseMessage!=null){
            System.out.println(baseMessage.getId());
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
        for(BaseMessage b:baseMessageList){
            System.out.println(b.getId());
        }
    }
    @Test
    public void addBaseMessage(){
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setAccount("ceshi");
        baseMessage.setInputCode("abc");
        baseMessage.setMsgType("text");
        baseMessage.setCreateTime(new Date().getTime());
       baseMessageService.addBaseMessage(baseMessage);
       baseMessage=baseMessageService.selectBaseMessage(baseMessage);
       System.out.println(baseMessage.getId());
    }

    @Test
    public void search(){
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setInputCode("1");
       List<BaseMessage> baseMessageList= baseMessageService.search(baseMessage);
       for(BaseMessage b:baseMessageList) {
           System.out.println(b.getId());
       }
    }

}
