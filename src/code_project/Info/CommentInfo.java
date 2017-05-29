package code_project.Info;

/**
 * Created by qpen546 on 29/05/2017.
 */
public class CommentInfo {
    public int commentID;
    public String content;
    public String postTime;
    public String username;
    public int articleID;
    public String editComment;
    public String deleteComment;

    public void setEditComment(int articleID) {
    }

    public void setDeleteComment(String username) {
        if(this.username.equals(username)){
         deleteComment = "<a href=\"Comment?action='delete'&commentID="+commentID+"\">delete</a>";
        }
    }

    public String getEditComment() {
        return editComment;
    }

    public String getDeleteComment() {
        return deleteComment;
    }

    public CommentInfo(int commentID, String content, String postTime, String username, int articleID) {
        this.commentID = commentID;
        this.content = content;
        this.postTime = postTime;
        this.username = username;
        this.articleID = articleID;
        editComment ="";
        deleteComment = "";
    }

    public int getCommentID() {
        return commentID;
    }

    public String getContent() {
        return content;
    }

    public String getPostTime() {
        return postTime;
    }

    public String getUsername() {
        return username;
    }

    public int getArticleID() {
        return articleID;
    }
}
