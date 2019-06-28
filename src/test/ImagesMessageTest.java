import com.wechat.entity.BaseMessage;
import com.wechat.entity.image;
import com.wechat.entity.imagesMessage;
import com.wechat.entity.TextMessage;
import com.wechat.service.Impl.BaseMessageServiceImpl;
import com.wechat.service.Impl.imagesMessageServiceImpl;
import com.wechat.service.Impl.TextMessageServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:ApplicationContext.xml","classpath:ApplicationContext-database.xml"})
public class imagesMessageTest {
    @Resource(name = "imagesMessageService")
    private imagesMessageServiceImpl imagesMessageService;
    @Resource(name = "baseMessageService")
    private BaseMessageServiceImpl baseMessageService;

    @Test
    public void findAll(){
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setInputCode("5");
        baseMessage.setAccount("ceshi");
        baseMessage=baseMessageService.getByInputCode(baseMessage);
        image image=imagesMessageService.selectimagesMessage(baseMessage);
        if(image!=null){
            System.out.println(image.getMediaId());
        }else{
            System.out.println("kong");
        }

    }

}
