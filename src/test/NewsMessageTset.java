import com.wechat.dao.AccountDAO;
import com.wechat.dao.NewsMessageDAO;
import com.wechat.entity.Account;
import com.wechat.entity.BaseMessage;
import com.wechat.entity.News;
import com.wechat.entity.NewsMessage;
import com.wechat.service.Impl.BaseMessageServiceImpl;
import com.wechat.service.Impl.NewsMessageServiceImpl;
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
public class NewsMessageTset {
    @Resource(name = "newsMessageService")
    private NewsMessageServiceImpl dao;
    @Resource(name = "baseMessageService")
    private BaseMessageServiceImpl baseMessageService;

    @Test
    public void findAll(){
        BaseMessage baseMessage=new BaseMessage();
        baseMessage.setInputCode("7");
        baseMessage.setAccount("ceshi");
        baseMessage=baseMessageService.getByInputCode(baseMessage);
        List<NewsMessage> newsList = dao.selectNewsMessage(baseMessage);
        System.out.println("newsMessage的大小"+newsList.size());
        List<News> news = new ArrayList<News>();
        for (NewsMessage s:newsList) {
            System.out.println(s.toString()+"----------------------");
            news = s.getArticles();
            System.out.println("artical的大小"+s.getArticles().size());
//            news.add(s.getArticles());
            System.out.println("news的大小"+news.size());
//            System.out.println(s.getArticles());
//            for (News n:news){
//                System.out.println(n.toString());
//            }
            System.out.println(news.toString());
        }
        for (News n:news) {
//                System.out.println(n.toString());
//            }
           System.out.println(n.toString());
        }
    }

}
