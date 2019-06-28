import com.wechat.entity.BaseMessage;
import com.wechat.entity.imagesMessage;
import com.wechat.entity.Video;
import com.wechat.entity.VideoMessage;
import com.wechat.service.Impl.BaseMessageServiceImpl;
import com.wechat.service.Impl.imagesMessageServiceImpl;
import com.wechat.service.Impl.VideoMessageServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:ApplicationContext.xml","classpath:ApplicationContext-database.xml"})
public class VideoMessageTest {
    @Resource(name = "videoMessageService")
    private VideoMessageServiceImpl videoMessageService;
    @Resource(name = "baseMessageService")
    private BaseMessageServiceImpl baseMessageService;

    @Test
    public void findAll(){
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setInputCode("7");
        baseMessage.setAccount("ceshi");
        baseMessage=baseMessageService.getByInputCode(baseMessage);
        Video videoi=videoMessageService.selectVideoMessage(baseMessage);
        if(videoi!=null){
            System.out.println(videoi.getMediaId());
        }else{
            System.out.println("kong");
        }

    }

}
