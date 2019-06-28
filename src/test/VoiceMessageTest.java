import com.wechat.entity.BaseMessage;
import com.wechat.entity.imagesMessage;
import com.wechat.entity.Voice;
import com.wechat.entity.VoiceMessage;
import com.wechat.service.Impl.BaseMessageServiceImpl;
import com.wechat.service.Impl.imagesMessageServiceImpl;
import com.wechat.service.Impl.VoiceMessageServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:ApplicationContext.xml","classpath:ApplicationContext-database.xml"})
public class VoiceMessageTest {
    @Resource(name = "voiceMessageService")
    private VoiceMessageServiceImpl voiceMessageService;
    @Resource(name = "baseMessageService")
    private BaseMessageServiceImpl baseMessageService;

    @Test
    public void findAll(){
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setInputCode("6");
        baseMessage.setAccount("ceshi");
        baseMessage=baseMessageService.getByInputCode(baseMessage);
        Voice voiceMessage=voiceMessageService.selectVoiceMessage(baseMessage);
        if(voiceMessage!=null){
            System.out.println(voiceMessage.getMediaId());
        }else{
            System.out.println("kong");
        }
    }

}
