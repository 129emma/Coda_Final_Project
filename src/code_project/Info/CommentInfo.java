package code_project.Info;

/**
 * Created by qpen546 on 29/05/2017.
 */
public class CommentInfo {
    public String comment_ID;
    public String content;
    public String post_time;
    public String username;
    public String article_ID;

    public CommentInfo(String comment_ID, String content, String post_time, String username, String article_ID) {
        this.comment_ID = comment_ID;
        this.content = content;
        this.post_time = post_time;
        this.username = username;
        this.article_ID = article_ID;
    }

    public String getComment_ID() {
        return comment_ID;
    }

    public String getContent() {
        return content;
    }

    public String getPost_time() {
        return post_time;
    }

    public String getUsername() {
        return username;
    }

    public String getArticle_ID() {
        return article_ID;
    }
}
