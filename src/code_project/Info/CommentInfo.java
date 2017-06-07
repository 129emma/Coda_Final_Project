package code_project.Info;

/**
 * Created by qpen546 on 29/05/2017.
 */
public class CommentInfo {
    public int commentID, articleID;
    public String content, postTime, username, editComment, deleteComment, replyComment;

    public void setReplyComment(String username) {
        replyComment = "<a class='reply' href=\"Comment?action=reply&articleID=" + articleID + "&commentID=" + commentID + "\">Reply</a>";
    }

    public void setEditComment(String username) {
        if (this.username.equals(username)) {
            editComment = "<a class='reply' href=\"Comment?action=edit&articleID=" + articleID + "&commentID=" + commentID + "\">Edit</a>";
        }
    }

    public void setDeleteComment(String username) {
        if (this.username.equals(username)) {
            deleteComment = "<a class='reply' href=\"Comment?action=delete&articleID=" + articleID + "&commentID=" + commentID + "\">Delete</a>";
        }
    }

    public String getReplyComment() {
        return replyComment;
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
        editComment = "";
        deleteComment = "";
        replyComment ="";
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
