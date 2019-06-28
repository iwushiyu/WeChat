import com.wechat.dao.AccountDAO;
import com.wechat.entity.Account;
import com.wechat.entity.Fans;
import com.wechat.service.Impl.FansServiceImpl;
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
public class FnasTset {
    @Resource(name = "fansService")
    private FansServiceImpl fansService;

    @Test
    public void add( ){
        Fans fans=new Fans();
        fans.setSubscribeStatus(1);
        fans.setOpenId("dhakdopenid");
        fans.setNickName("asdnickname");
        fans.setSex(1);
        fans.setLanguage("chinese");
        fans.setCity("nanchang");
        fans.setProvince("jiangxi");
        fans.setCountry("china");
        fans.setHeadImgUrl("dhsakhdkaurl");
        fans.setAccount("ceshi");
        fans.setSubscribeTime(new Date().getTime());
       boolean flag= fansService.addFans(fans);
       System.out.println(flag);
    }
    @Test
    public void find( ){
        Fans fans=new Fans();
        fans.setId(1);
        List<Fans> fansList=new ArrayList<>();
        fansList=fansService.allFnas("ceshi");
        for(Fans f:fansList)
        System.out.println(f.getNickName());
    }
}
