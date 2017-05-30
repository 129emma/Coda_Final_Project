package code_project.Info;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by txie936 on 25/05/2017.
 */
public class ArticleInfo {
    public int articleID;
    public String content;
    public String postTime;
    public String tags;
    public String username;
    public String title;

    public ArticleInfo(int article_ID,String title,String content,String post_time,String tags,String username){
        this.articleID=article_ID;
        this.title=title;
        this.content=content;
        this.postTime =  post_time;
        this.tags=tags;
        this.username=username;
    }

    public int getArticleID() {
        return articleID;
    }

    public String getContent() {
        return content;
    }

    public String getPostTime() {
        return postTime;
    }

    public String getTags() {
        return tags;
    }

    public String getUsername() {
        return username;
    }

    public String getTitle() {
        return title;
    }

    public void setArticleID(int articleID) {
        this.articleID = articleID;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setPostTime(String postTime) {
        this.postTime = postTime;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
