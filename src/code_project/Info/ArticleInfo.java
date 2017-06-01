package code_project.Info;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by txie936 on 25/05/2017.
 */
public class ArticleInfo {
    public int articleID;
    public String content, postTime, tags, username, title, editArticle, deleteArticle, retrieveAddress;

    public ArticleInfo(int articleID, String title, String content, String post_time, String tags, String username) {
        this.articleID = articleID;
        this.title = title;
        this.content = content;
        this.postTime = post_time;
        this.tags = tags;
        this.username = username;
        editArticle = "";
        deleteArticle = "";
        retrieveAddress = "Article?action=retrieve&articleID="+articleID;
    }
public ArticleInfo(String title,String content,String tags){
        this.title=title;
        this.content=content;
        this.tags=tags;
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

    public String getRetrieveAddress() { return retrieveAddress; }

    public String getEditArticle() {
        return editArticle;
    }

    public String getDeleteArticle() {
        return deleteArticle;
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

    public void setEditArticle(String username) {
        if (this.username.equals(username)) {
            editArticle = "<a href=\"Article?action=edit&articleID=" + articleID + "&commentID=" + articleID + "\">Edit</a>";
        }
    }

    public void setDeleteArticle(String username) {
        if (this.username.equals(username)) {
            deleteArticle = "<a href=\"Article?action=delete&articleID=" + articleID + "&commentID=" + articleID + "\">delete</a>";
        }
    }

    public void setRetrieveArticle(String retrieveArticle) {
        this.retrieveAddress = retrieveArticle;
    }


}
