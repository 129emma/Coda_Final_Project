package code_project.Info;

/**
 * Created by qpen546 on 29/05/2017.
 */
public class CommentReplyInfo {
    public int commentReplyID, commentID;
    public String content, postTime, username, editBtn, editComment, deleteBtn, deleteComment, replyComment;

    public void setReplyComment(String username) {
        replyComment = "<a href=\"Comment?action=reply&commentID=" + commentID + "&commentReplyID=" + commentReplyID + "\">Reply</a>";
    }

    public void setEditComment(String username) {
        if (this.username.equals(username)) {
            editBtn = "<a id='editBtn' class='reply'><i class='write icon'></i></a>";
            editComment = "<a href=\"Comment?action=update&commentID=" + commentID + "&commentReplyID=" + commentReplyID + "\">Update</a>";
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
            deleteBtn = "<a href=\"Comment?action=delete&commentID=" + commentID + "&commentReplyID=" + commentReplyID + "\"><i class='trash icon'></i></a>";
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

    public CommentReplyInfo(int commentReplyID, String content, String postTime, String username, int commentID) {
        this.commentReplyID = commentReplyID;
        this.content = content;
        this.postTime = postTime;
        this.username = username;
        this.commentID = commentID;
        editComment = "";
        deleteComment = "";
        replyComment ="";
    }

    public int getCommentReplyID() {
        return commentReplyID;
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

    public int getcommentID() {
        return commentID;
    }
}
