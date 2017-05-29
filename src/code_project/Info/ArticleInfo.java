package code_project.Info;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by txie936 on 25/05/2017.
 */
public class ArticleInfo {
    private int article_ID;
    private String content;
    private String post_time;
    private String tags;
    private String username;
    private String title;

    public ArticleInfo(int article_ID,String title,String content,String post_time,String tags,String username){
        this.article_ID=article_ID;
        this.title=title;
        this.content=content;
        this.post_time =  post_time;
        this.tags=tags;
        this.username=username;
    }

    public int getArticle_ID() {
        return article_ID;
    }

    public String getContent() {
        return content;
    }

    public String getPost_time() {
        return post_time;
    }

    public String getTags() {
        return tags;
    }

    public String getUsername() {
        return username;
    }

    public void setArticle_ID(int article_ID) {
        this.article_ID = article_ID;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setPost_time(String post_time) {
        this.post_time = post_time;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public void setUsername(String username) {
        this.username = username;
    }


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
