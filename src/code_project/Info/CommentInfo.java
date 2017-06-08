package code_project.Info;

/**
 * Created by qpen546 on 29/05/2017.
 */
public class CommentInfo {
    public int commentID, articleID;
    public String content, postTime, username, editBtn, editComment, deleteBtn, deleteComment, replyComment;

    public void setReplyComment(String username) {
        replyComment = "<a href=\"Comment?action=reply&articleID=" + articleID + "&commentID=" + commentID + "\">Reply</a>";
    }

    public void setEditComment(String username) {
        if (this.username.equals(username)) {
            editBtn = "<a id='editBtn' class='reply'><i class='write icon'></i></a>";
            editComment = "<a href=\"Comment?action=edit&articleID=" + articleID + "&commentID=" + commentID + "\">Edit</a>";
        }
    }

    public String getEditBtn() {
        return editBtn;
    }

    public String getDeleteBtn() {
        return deleteBtn;
    }

    public void setDeleteComment(String username) {
        if (this.username.equals(username)) {
            deleteBtn = "<a href=\"Comment?action=delete&articleID=" + articleID + "&commentID=" + commentID + "\"><i class='trash icon'></i></a>";
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
