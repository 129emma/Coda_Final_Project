package code_project.Info;

import org.json.simple.JSONObject;

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
    public String editArticle;
    public String deleteArticle;
    public String retrieveAddress;
    public String preview;
    public String userAvatar;
    public String followButton;
    public int likeNum;
    public String ifLiked;
    public String ifRed;


    public ArticleInfo(int articleID, String title, String content, String post_time, String tags, String username, String userAvatar, int likeNum) {
        this.articleID = articleID;
        this.title = title;
        this.content = content;
        this.postTime = post_time;
        this.tags = tags;
        this.username = username;
        this.userAvatar = userAvatar;
        this.likeNum = likeNum;
        this.preview = "";
        this.editArticle = "";
        this.deleteArticle = "";
        this.followButton = "";
        this.retrieveAddress = "Article?action=retrieve&articleID=" + articleID;
        setPreview();
    }

    public String getFollowButton() {
        return followButton;
    }

    public void setFollowButton(String followButton) {
        this.followButton = followButton;
    }

    public String getUserAvatar() {
        return userAvatar;
    }

    public void setPreview() {
        String[] words = content.split(" ");
        int num = Math.min(words.length, 200);
        for (int i = 0; i < num; i++) {
            if (i == words.length - 1) {
                preview += words[i];
            } else if (i==199) {
                preview += words[i]+"<a href='"+retrieveAddress+"'> (show more...)</a>";
            } else {
                preview += words[i] + " ";
            }
        }
    }

    public ArticleInfo(String title, String content, String tags) {
        this.title = title;
        this.content = content;
        this.tags = tags;
    }

    public String getPreview() {
        return preview;
    }

    public JSONObject getArticlePreviewJSON() {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("articleID", articleID);
        jsonObject.put("title", title);
        jsonObject.put("username", username);
        jsonObject.put("content", preview);
        return jsonObject;
    }

    public JSONObject getArticleContentJSON() {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("articleID", articleID);
        jsonObject.put("title", title);
        jsonObject.put("content", content);
        return jsonObject;
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

    public String getRetrieveAddress() {
        return retrieveAddress;
    }

    public String getEditArticle() {
        return editArticle;
    }

    public String getDeleteArticle() {
        return deleteArticle;
    }

    public int getLikeNum() {
        return likeNum;
    }

    public String getIfLiked() {
        return ifLiked;
    }

    public String getIfRed() {
        return ifRed;
    }

    public void setLikeNum(int likeNum) {
        this.likeNum = likeNum;
    }

    public void setIfLiked(String ifLiked) {
        this.ifLiked = ifLiked;
    }

    public void setIfRed(String ifRed) {
        this.ifRed = ifRed;
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
            editArticle = "<button class='ui circular ui icon button editButton' href=\"Article?action=edit&articleID=" + articleID + "\">Edit</button>";
        }
    }

    public void setDeleteArticle(String username) {
        if (this.username.equals(username)) {
            deleteArticle = "<button class='ui circular ui icon button deleteButton' href=\"Article?action=delete&articleID=" + articleID + "\">Delete</button>";
        }
    }

    public void setRetrieveArticle(String retrieveArticle) {
        this.retrieveAddress = retrieveArticle;
    }


}
