package code_project.Info;

/**
 * Created by txie936 on 25/05/2017.
 */
public class ArticleInfo {

    private String articleID;
    private String content;
    private String postTime;
    private String tags;
    private String username;
    private String title;

  

  


    public ArticleInfo(String article_ID,String title,String content,String post_time,String tags,String username){
        this.articleID=article_ID;
        this.title=title;
        this.content=content;
        this.postTime=post_time;
        this.tags=tags;
        this.username=username;
    }

    public String getArticleID() {
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

    public void setArticleID(String article_ID) {
        this.articleID = article_ID;
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


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
