import com.wechat.entity.BaseMessage;
import com.wechat.entity.imagesMessage;
import com.wechat.entity.Music;
import com.wechat.entity.MusicMessage;
import com.wechat.service.Impl.BaseMessageServiceImpl;
import com.wechat.service.Impl.imagesMessageServiceImpl;
import com.wechat.service.Impl.MusicMessageServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:ApplicationContext.xml","classpath:ApplicationContext-database.xml"})
public class MusicMessageTest {
    @Resource(name = "musicMessageService")
    private MusicMessageServiceImpl musicMessageService;
    @Resource(name = "baseMessageService")
    private BaseMessageServiceImpl baseMessageService;
    @Test
    public void findAll(){
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setAccount("ceshi");
        baseMessage.setInputCode("4");
        baseMessage=baseMessageService.getByInputCode(baseMessage);
        Music musicMessage=musicMessageService.selectMusicMessage(baseMessage);
        if(musicMessage!=null){
            System.out.println(musicMessage.getTitle());
            System.out.println(musicMessage.getDescription());
            System.out.println(musicMessage.getMusicUrl());
            System.out.println(musicMessage.getHqMusicUrl());
            System.out.println(musicMessage.getThumbmediaId());
        }else{
            System.out.println("kong");
        }

    }

}
